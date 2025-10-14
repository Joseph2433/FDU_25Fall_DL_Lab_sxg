`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/15 13:38:51
// Design Name: 
// Module Name: x7seg1_top
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


module x7seg1_top(input logic CLK100MHZ,
    input logic [0:0] SW,
    output logic [3:0] AN,
    output logic [6:0] A2G,
    output logic DP

    );
    logic [15:0] x;
    assign  x = 'h2024;
    
    x7seg1(.data(x),
    .clr(SW[0]),
    .clk(CLK100MHZ),
    .an(AN),
    .a2g(A2G),
    .dp(DP));
    
endmodule
