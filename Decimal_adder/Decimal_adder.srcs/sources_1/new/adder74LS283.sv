`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/20 10:32:03
// Design Name: 
// Module Name: adder74LS283
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


module adder74LS283(input logic [3:0] a,
input logic [3:0] b,
input logic c0,
output logic [3:0] s,
output logic cout

    );
    logic c1,c2,c3;
    logic [3:0] g;
    logic [3:0] p;
    assign g = a&b;
    assign p = a^b;                         
    assign c1 = g[0] | (p[0] & c0);
    assign c2 = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c0);
    assign c3 = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c0);
    assign cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c0);
    assign s = p^{c3,c2,c1,c0};
endmodule
