`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/03 11:59:16
// Design Name: 
// Module Name: JK
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


module JK(
    input  logic clk, 
    input  logic J,    
    input  logic K,
    output logic q,    
    output logic notq
    );
    logic d;
    assign notq = ~q;
    assign d = (J & notq) | (~K & q);
    always_ff @(posedge clk) begin
        q <= d;
    end
endmodule