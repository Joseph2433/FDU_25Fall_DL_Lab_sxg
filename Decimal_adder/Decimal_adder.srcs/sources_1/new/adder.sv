`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/20 11:14:28
// Design Name: 
// Module Name: adder
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


module adder(input logic [7:0] a,
input logic [7:0] b,
input logic cin,
output logic [7:0] s,
output logic cout
    );
    logic cout1;
    
    adder74LS283 a1(.a(a[3:0]),.b(b[3:0]),.c0(cin),.s(s[3:0]),.cout(cout1));
    adder74LS283 a2(.a(a[7:4]),.b(b[7:4]),.c0(cout1),.s(s[7:4]),.cout(cout));
    
endmodule
