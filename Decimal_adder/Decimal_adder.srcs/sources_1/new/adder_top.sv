`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/20 11:14:17
// Design Name: 
// Module Name: adder_top
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


module adder_top(input logic [15:0] SW,
                 output logic DP,
                 output logic [15:0] LED,
                 input logic CLK100MHZ,
                 output logic [6:0] A2G,
                 output logic [7:0] AN
    );
    assign LED = SW;
    logic [7:0] a,b,s; 
    logic cin;
    logic cout;
    assign a = SW[15:8];
    assign b = SW[7:0];
    assign cin = 0;
    logic [7:0] as;
    logic [7:0] bs;
    assign as = (a > 8'd99) ? 8'd99 : a;
    assign bs = (b > 8'd99) ? 8'd99 : b;
    adder adder(.a(as),.b(bs),.cin(cin),.s(s),.cout(cout));
    logic [11:0] ab,bb,sb;
    Bin2bcd A(as,ab);
    Bin2bcd B(bs,bb);
    Bin2bcd S(s,sb);
    logic [31:0] res;
    assign res = {         
            ab[7:4], ab[3:0],
            bb[7:4], bb[3:0],
            4'hA,
            sb[11:8],sb[7:4],sb[3:0]};
    X7seg x7(res,CLK100MHZ,AN,A2G,DP);
endmodule
