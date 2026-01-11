`timescale 1ns / 1ps
// 3. �洢�������� (�ο� PDF P10, P9, P6)
module dMemoryDecoder(
    input  logic        clk, writeEN,
    input  logic [31:0] addr, writeData,
    output logic [31:0] readData,
    // IO Ports
    input  logic        reset,
    input  logic        btnL, btnR,
    input  logic [15:0] switch,
    output logic [15:0] leds
);
    logic pRead, pWrite, mWrite;
    logic [31:0] readDataMem, readDataIO;
    
    // PDF P6: addr[7] ��������
    assign pRead  = (addr[7] == 1'b1);
    assign pWrite = (addr[7] == 1'b1) & writeEN;
    assign mWrite = (addr[7] == 1'b0) & writeEN;
    
    assign readData = (pRead) ? readDataIO : readDataMem;

    dmem dmem(.clk(clk), .we(mWrite), .a(addr), .wd(writeData), .rd(readDataMem));
    
    IO io_unit(
        .clk(clk), .reset(reset), 
        .pRead(pRead), .pWrite(pWrite), 
        .addr(addr[3:2]), 
        .pWriteData(writeData), .pReadData(readDataIO),
        .buttonL(btnL), .buttonR(btnR), .switch(switch), .leds(leds)
    );
endmodule

// 1. ָ��洢�� (�ϸ�ο� PDF P9)
module imem(
    input  logic [5:0]  a,
    output logic [31:0] rd
);
    logic [31:0] RAM[63:0];

    initial begin
        
    $readmemh("memfile.dat", RAM); 
    end
    
    assign rd = RAM[a]; // Word aligned by input logic
endmodule

// 2. ���ݴ洢�� (��RAM)
module dmem(
    input  logic        clk, we,
    input  logic [31:0] a, wd,
    output logic [31:0] rd
);
    logic [31:0] RAM[63:0];
    assign rd = RAM[a[7:2]]; 
    always_ff @(posedge clk)
        if (we) RAM[a[7:2]] <= wd;
endmodule

// 4. IO�ӿ��߼� (��ȫ�ճ� PDF P11 �����ͼ)
module IO(
    input  logic        clk, reset,
    input  logic        pRead, pWrite,
    input  logic [1:0]  addr,
    input  logic [31:0] pWriteData,
    output logic [31:0] pReadData,
    input  logic        buttonL, buttonR,
    input  logic [15:0] switch,
    output logic [15:0] leds
);
    logic [1:0] status;
    logic [15:0] switch1, led1;
    
    assign leds = led1;

    always_ff @(posedge clk) begin
        if (reset) begin
            status <= 0; led1 <= 0; switch1 <= 0;
        end else begin
            if (buttonR) begin status[1] <= 1; switch1 <= switch; end
            if (buttonL) begin status[0] <= 1; end
            
            // P11: Write to LED (addr 01)
            if (pWrite && (addr == 2'b01)) begin
                led1 <= pWriteData[15:0];
                status[0] <= 0;
            end
        end
    end

    // P11: Read logic
    always_comb begin
        pReadData = 32'b0;
        if (pRead)
            case(addr)
                2'b00: pReadData = {30'b0, status};
                2'b10: pReadData = {24'b0, switch1[7:0]};
                2'b11: pReadData = {24'b0, switch1[15:8]};
                default: pReadData = 32'b0;
            endcase
    end
endmodule