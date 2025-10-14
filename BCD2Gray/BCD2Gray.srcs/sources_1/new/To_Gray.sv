`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/13 19:05:14
// Design Name: 
// Module Name: To_Gray
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Addiytional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module To_Gray(
  input  logic [3:0] bin,   
  output logic [3:0] gray
);
  logic [7:0] y1;   
  logic [7:0] y2;   

  ymq74LS138  Y1  (.a(bin[2:0]), .s({1'b0, 1'b0, ~bin[3]}), .y(y1));
  ymq74LS138  Y2  (.a(bin[2:0]), .s({1'b0, 1'b0,  bin[3]}), .y(y2));

  assign gray[3] = ~& y2;                       

  assign gray[2] = ~& { y1[7:4], y2[3:0] };

  assign gray[1] = ~& { y1[5:2], y2[5:2] };

  assign gray[0] = ~& { y1[6], y1[5], y1[2], y1[1],
                        y2[6], y2[5], y2[2], y2[1] };
endmodule
