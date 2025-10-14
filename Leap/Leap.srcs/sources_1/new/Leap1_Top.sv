`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 09:48:17
// Design Name: 
// Module Name: Leap1_Top
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


module Leap1_Top(input logic [15:0] SW,
                 output logic DP,
                 output logic [15:0] LED,
                 input logic CLK100MHZ,
                 output logic [6:0] A2G,
                 output logic [7:0] AN,
                 output logic LED16_R,
                 output logic LED16_G
    );
    assign DP = 1;
    assign LED = SW;
    logic sign;
    Leap(SW,sign);
    X7seg(SW,CLK100MHZ,AN,A2G,DP);
    Rgb_Led(sign,LED16_R,LED16_G);
endmodule
