`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/03 11:45:54
// Design Name: 
// Module Name: clk6HZ
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


module Clk6Hz(input  logic clk100MHz,
              output logic clk6Hz );

  logic [23:0] count;
     
  always @(posedge clk100MHz)
    count <= count + 1;

  assign clk6Hz = count[23];
endmodule
