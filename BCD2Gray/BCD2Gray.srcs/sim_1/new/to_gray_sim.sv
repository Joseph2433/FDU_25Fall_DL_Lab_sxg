`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/14 09:34:17
// Design Name: 
// Module Name: to_gray_sim
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


module to_gray_sim(
);
  logic [3:0] bin, gray;

To_Gray tg(.bin(bin),.gray(gray));
//assign gray = bin ^ (bin >>1);
 
  initial begin
    bin = 'x;
    #10;
    for (int i = 0; i < 16; i++) begin
      bin = i[3:0];
      #10;
    end
  end
endmodule


