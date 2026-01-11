module Top(
    input  logic CLK100MHZ, 
    input  logic BTNC, BTNL, BTNR,
    input  logic [15:0] SW,
    output logic [15:0] LED,
    output logic [7:0]  AN,
    output logic [6:0]  A2G
);
    logic [31:0] pc, instr, readData, writeData, dataAdr;
    logic        memwrite;
    
    // --- 新增：时钟分频�?�辑 ---
    logic [25:0] clk_div_cnt;
    logic        cpu_clk;

    always_ff @(posedge CLK100MHZ) begin
        clk_div_cnt <= clk_div_cnt + 1;
    end
    
    
    assign cpu_clk = clk_div_cnt[20]; 
    // -------------------------

    // 1. MIPS CPU 使用分频后的慢时�?
    mips mips(
        .clk(cpu_clk),    // <--- 修改这里
        .reset(BTNC), 
        .pc(pc), 
        .instr(instr), 
        .memwrite(memwrite), 
        .aluout(dataAdr), 
        .writedata(writeData), 
        .readdata(readData)
    );

    imem imem(pc[7:2], instr);

    dMemoryDecoder dmd(
        .clk(cpu_clk),    // <--- 修改这里
        .writeEN(memwrite), 
        .addr(dataAdr), 
        .writeData(writeData), 
        .readData(readData),
        .reset(BTNC), 
        .btnL(BTNL), 
        .btnR(BTNR), 
        .switch(SW), 
        .leds(LED)
    );

    // 4. 数码管扫描必须使�? 100MHz 高频时钟，否则会闪烁
    mux7seg m7seg(
        .clk(CLK100MHZ),  
        .reset(BTNC), 
        .val({SW,4'hF,LED[11:0]}), 
        .an(AN), 
        .a2g(A2G)
    );
endmodule

module mux7seg(
    input  logic        clk, reset,
    input  logic [31:0] val,
    output logic [7:0]  an,
    output logic [6:0]  a2g
);
    logic [19:0] clkdiv;
    logic [3:0] digit;
    always_ff @(posedge clk, posedge reset)
        if(reset) clkdiv <= 0; else clkdiv <= clkdiv+1;
    
    always_comb
        case(clkdiv[19:17])
            0: begin an=8'b11111110; digit=val[3:0]; end
            1: begin an=8'b11111101; digit=val[7:4]; end
            2: begin an=8'b11111011; digit=val[11:8]; end
            3: begin an=8'b11110111; digit=val[15:12]; end
            4: begin an=8'b11101111; digit=val[19:16]; end
            5: begin an=8'b11011111; digit=val[23:20]; end
            6: begin an=8'b10111111; digit=val[27:24]; end
            7: begin an=8'b01111111; digit=val[31:28]; end
            default: begin an=8'b11111111; digit=0; end // ����ʾ
        endcase
        
     always_comb
        case (digit) 
            'h0: a2g = 7'b0000001; 
            'h1: a2g = 7'b1001111; 
            'h2: a2g = 7'b0010010; 
            'h3: a2g = 7'b0000110; 
            'h4: a2g = 7'b1001100; 
            'h5: a2g = 7'b0100100; 
            'h6: a2g = 7'b0100000; 
            'h7: a2g = 7'b0001111; 
            'h8: a2g = 7'b0000000; 
            'h9: a2g = 7'b0000100; 
            'hA: a2g = 7'b0001000; 
            'hB: a2g = 7'b1100000; 
            'hC: a2g = 7'b0110001; 
            'hD: a2g = 7'b1000010; 
            'hE: a2g = 7'b0110000; 
            'hF: a2g = 7'b1110110; 
        default: a2g = 7'b0000001; //0
        endcase
endmodule