`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/27 10:20:42
// Design Name: 
// Module Name: mul_top
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


module mul_top(
    input logic [15:0] SW,
                 output logic DP,
                 output logic [15:0] LED,
                 input logic CLK100MHZ,
                 output logic [6:0] A2G,
                 output logic [7:0] AN
                 );
    logic [23:0] data;
    logic [3:0] a,b;
    logic [7:0] res;
    logic [11:0] p;
    assign a = SW[15:12];
    assign b = SW[3:0];
    assign LED = SW;

    mult_gen_0 mult(.A(a),.B(b),.CLK(CLK100MHZ),.P(res));
    to_Decimal decimal(res,p); 
    assign data = {LED[15:12],4'hA,LED[3:0],4'hB,p[7:0]};
    X7seg x7(data,CLK100MHZ,AN,A2G,DP);
endmodule
