`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/13 16:21:20
// Design Name: 
// Module Name: Gray1_Top
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


module Gray1_Top(
                 input logic [15:12] SW,
                 output logic [15:12] LED,
                 output logic DP,
                 input logic CLK100MHZ,
                 output logic [6:0] A2G,
                 output logic [7:0] AN
    );
    assign DP = 1;
    assign LED = SW;
    logic [3:0] g;
    To_Gray tg(.bin(LED),.gray(g));
    logic [7:0] res = {SW , g};
    logic [31:0] disp;
    assign disp = {3'b000,res[7],3'b000,res[6],3'b000,res[5],3'b000,res[4],3'b000,res[3],3'b000,res[2],3'b000,res[1],3'b000,res[0]};
    x7seg x7(disp,CLK100MHZ,AN,A2G,DP);
endmodule
