`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/22 10:48:13
// Design Name: 
// Module Name: Alu_Top
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


module Alu_Top(
     input logic [11:0] SW,
     input logic CLK100MHZ,
     output logic [6:0] A2G,
     output logic [7:0] AN,
     output logic [11:0] LED,
     output logic DP
    );
    
    logic [39:0] data;
    logic cout;
    assign LED = SW;
    
    //实例化算术单元
    Alu A(
    .alusel(SW[10:9]),
    .m(SW[11]),
    .a(SW[3:0]),
    .b(SW[7:4]),
    .cin(SW[8]),
    .data(data),
    .cout(cout)
    );
    //实例化
    X7seg X7(.data(data),.clk(CLK100MHZ),.an(AN),.a2g(A2G),.dp(DP));
 
    

endmodule
