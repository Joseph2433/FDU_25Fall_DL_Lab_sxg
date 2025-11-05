`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/03 11:47:10
// Design Name: 
// Module Name: rotatingLED_top
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


module rotatingLED_Top(
  input  logic CLK100MHZ,
  output logic LED17_R,
  output logic LED16_B );

  logic clk6Hz;

  Clk6Hz C6(CLK100MHZ, clk6Hz);

  rotatingLED A1(.clk(clk6Hz),
                .reset(1),
                .RedLED(LED17_R),
                .BlueLED(LED16_B) );
endmodule
