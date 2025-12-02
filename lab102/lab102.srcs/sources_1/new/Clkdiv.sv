`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/17 14:24:26
// Design Name: 
// Module Name: Clkdiv
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Clkdiv(
    input  logic clk, clr,
    output logic OneSecond );
    
    parameter N = 100_000_000 - 1;// 100M
    logic [31:0] count;
    
    always_ff @(posedge clk, posedge clr)
        if(clr==1)  count <= 0;
        else
        begin
            OneSecond <= 0;
            if(count < N) count <= count + 1;
            else
            begin
                count <= 0;
                OneSecond <= 1;
            end
        end
endmodule