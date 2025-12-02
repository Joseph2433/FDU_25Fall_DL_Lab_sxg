`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/17 14:23:42
// Design Name: 
// Module Name: Top
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


module Top (
    input logic CLK100MHZ,
    inout  logic BTNC,
    output logic DP,
    output logic [6:0] A2G,
    output logic [7:0] AN
    );
    
    logic Onesecond;
    logic [7:0] lights;

    Clkdiv  U1(.clk(CLK100MHZ), .clr(BTNC), .OneSecond(Onesecond));
    state_changer U2(.clk1(Onesecond), .clr(BTNC), .lights(lights));
    X7seg x7(.lights(lights),.clk(CLK100MHZ),.an(AN),.a2g(A2G),.dp(DP));
endmodule
