`timescale 1ns / 1ps

// =================================================================
// 1. MIPS 顶层模块
// =================================================================
module mips(
    input  logic        clk, reset,
    output logic [31:0] pc,
    input  logic [31:0] instr,
    output logic        memwrite,
    output logic [31:0] aluout, writedata,
    input  logic [31:0] readdata
);
    logic        memtoreg, alusrc, regdst, regwrite, jump, pcsrc, zero;
    logic [2:0]  alucontrol;
    logic        immext;

    // 实例化控制器
    controller c(
        .op(instr[31:26]), 
        .funct(instr[5:0]), 
        .zero(zero),
        .memtoreg(memtoreg), 
        .memwrite(memwrite),
        .pcsrc(pcsrc), 
        .alusrc(alusrc),
        .regdst(regdst), 
        .regwrite(regwrite),
        .jump(jump), 
        .alucontrol(alucontrol),
        .immext(immext)
    );

    // 实例化数据通路
    datapath dp(
        .clk(clk), 
        .reset(reset),
        .memtoreg(memtoreg), 
        .pcsrc(pcsrc),
        .alusrc(alusrc), 
        .regdst(regdst),
        .regwrite(regwrite), 
        .jump(jump),
        .alucontrol(alucontrol),
        .immext(immext),
        .zero(zero), 
        .pc(pc), 
        .instr(instr),
        .aluout(aluout), 
        .writedata(writedata),
        .readdata(readdata)
    );
endmodule

// =================================================================
// 2. 控制器 (Controller)
// =================================================================
module controller(
    input  logic [5:0] op, funct,
    input  logic       zero,
    output logic       memtoreg, memwrite,
    output logic       pcsrc, alusrc,
    output logic       regdst, regwrite,
    output logic       jump,
    output logic [2:0] alucontrol,
    output logic       immext
);
    logic [1:0] aluop;
    logic       branch, branch_bne;

    maindec md(
        .op(op), 
        .memtoreg(memtoreg), 
        .memwrite(memwrite),
        .branch(branch), 
        .branch_bne(branch_bne), 
        .alusrc(alusrc), 
        .regdst(regdst), 
        .regwrite(regwrite),
        .jump(jump), 
        .aluop(aluop),
        .immext(immext)
    );

    aludec ad(
        .funct(funct), 
        .aluop(aluop), 
        .alucontrol(alucontrol)
    );

    assign pcsrc = (branch & zero) | (branch_bne & ~zero);
endmodule

module maindec(
    input  logic [5:0] op,
    output logic       memtoreg, memwrite,
    output logic       branch, branch_bne,
    output logic       alusrc, regdst, regwrite,
    output logic       jump,
    output logic [1:0] aluop,
    output logic       immext
);
    logic [10:0] controls;
    assign {regwrite, regdst, alusrc, branch, branch_bne, memwrite, memtoreg, jump, aluop, immext} = controls;

    always_comb
        case(op)
            // RW RD Src Br Bne MW MR Jp ALU Ext
            6'b000000: controls = 11'b1_1_0_0_0_0_0_0_10_0; // R-type
            6'b100011: controls = 11'b1_0_1_0_0_0_1_0_00_0; // lw
            6'b101011: controls = 11'b0_0_1_0_0_1_0_0_00_0; // sw
            6'b000100: controls = 11'b0_0_0_1_0_0_0_0_01_0; // beq
            6'b001000: controls = 11'b1_0_1_0_0_0_0_0_00_0; // addi
            6'b000010: controls = 11'b0_0_0_0_0_0_0_1_00_0; // j
            6'b001100: controls = 11'b1_0_1_0_0_0_0_0_11_1; // andi
            6'b000101: controls = 11'b0_0_0_0_1_0_0_0_01_0; // bne
            default:   controls = 11'b0_0_0_0_0_0_0_0_00_0;
        endcase
endmodule

module aludec(
    input  logic [5:0] funct,
    input  logic [1:0] aluop,
    output logic [2:0] alucontrol
);
    always_comb
        case(aluop)
            2'b00: alucontrol = 3'b010; 
            2'b01: alucontrol = 3'b110; 
            2'b10: case(funct)          
                6'b100000: alucontrol = 3'b010; 
                6'b100010: alucontrol = 3'b110; 
                6'b100100: alucontrol = 3'b000; 
                6'b100101: alucontrol = 3'b001; 
                6'b101010: alucontrol = 3'b111; 
                default:   alucontrol = 3'bxxx;
            endcase
            2'b11: alucontrol = 3'b000; 
            default: alucontrol = 3'bxxx;
        endcase
endmodule

// =================================================================
// 3. 数据通路 (Datapath)
// =================================================================
module datapath(
    input  logic        clk, reset,
    input  logic        memtoreg, pcsrc,
    input  logic        alusrc, regdst,
    input  logic        regwrite, jump,
    input  logic [2:0]  alucontrol,
    input  logic        immext,
    output logic        zero,
    output logic [31:0] pc,
    input  logic [31:0] instr,
    output logic [31:0] aluout, writedata,
    input  logic [31:0] readdata
);
    logic [4:0]  writereg;
    logic [31:0] pcnext, pcnextbr, pcplus4, pcbranch;
    logic [31:0] signimm, signimmsh, zeroimm, imm_final;
    logic [31:0] srca, srcb;
    logic [31:0] result;

    flopr #(32) pcreg(clk, reset, pcnext, pc);
    adder       pcadd1(pc, 32'b100, pcplus4);
    sl2         immsh(signimm, signimmsh);
    adder       pcadd2(pcplus4, signimmsh, pcbranch);
    mux2 #(32)  pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
    mux2 #(32)  pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext);

    regfile     rf(clk, regwrite, instr[25:21], instr[20:16], writereg, result, srca, writedata);
    mux2 #(5)   wrmux(instr[20:16], instr[15:11], regdst, writereg);
    mux2 #(32)  resmux(aluout, readdata, memtoreg, result);

    signext     se(instr[15:0], signimm);
    assign zeroimm = {16'b0, instr[15:0]};
    assign imm_final = (immext) ? zeroimm : signimm; 

    mux2 #(32)  srcbmux(writedata, imm_final, alusrc, srcb);
    alu         alu(srca, srcb, alucontrol, aluout, zero);
endmodule

// =================================================================
// 4. 基础组件 (必须包含在内！)
// =================================================================
module adder(input [31:0] a, b, output [31:0] y);
    assign y = a + b;
endmodule

module sl2(input [31:0] a, output [31:0] y);
    assign y = {a[29:0], 2'b00};
endmodule

module signext(input [15:0] a, output [31:0] y);
    assign y = {{16{a[15]}}, a};
endmodule

module flopr #(parameter WIDTH=8)(
    input  logic             clk, reset,
    input  logic [WIDTH-1:0] d,
    output logic [WIDTH-1:0] q
);
    always_ff @(posedge clk, posedge reset)
        if (reset) q <= 0;
        else       q <= d;
endmodule

module mux2 #(parameter WIDTH=8)(
    input  logic [WIDTH-1:0] d0, d1,
    input  logic             s,
    output logic [WIDTH-1:0] y
);
    assign y = s ? d1 : d0;
endmodule

module regfile(
    input  logic        clk,
    input  logic        we3,
    input  logic [4:0]  ra1, ra2, wa3,
    input  logic [31:0] wd3,
    output logic [31:0] rd1, rd2
);
    logic [31:0] rf[31:0];
    always_ff @(posedge clk)
        if (we3) rf[wa3] <= wd3;
    assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
    assign rd2 = (ra2 != 0) ? rf[ra2] : 0;
endmodule

module alu(
    input  logic [31:0] a, b,
    input  logic [2:0]  alucontrol,
    output logic [31:0] result,
    output logic        zero
);
    always_comb
        case(alucontrol)
            3'b010: result = a + b;
            3'b110: result = a - b;
            3'b000: result = a & b;
            3'b001: result = a | b;
            3'b111: result = (a < b) ? 1 : 0;
            default: result = 32'bx;
        endcase
    assign zero = (result == 0);
endmodule