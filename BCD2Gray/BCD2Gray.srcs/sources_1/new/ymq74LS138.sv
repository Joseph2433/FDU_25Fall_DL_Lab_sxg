`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/13 12:07:52
// Design Name: 
// Module Name: ymq74LS138
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


module ymq74LS138(
  input  logic [2:0] a,
  input  logic [2:0] s,
  output logic [7:0] y
);
  always_comb begin
    y = '1;                       
    if (s[0] && !s[1] && !s[2])   
      y[a] = 1'b0;                
  end
endmodule

