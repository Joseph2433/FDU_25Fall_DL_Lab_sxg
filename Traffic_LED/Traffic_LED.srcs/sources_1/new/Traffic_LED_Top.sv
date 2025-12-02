`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/17 13:59:31
// Design Name: 
// Module Name: Traffic_LED_Top
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


module Traffic_LED_Top(
    input  logic CLK100MHZ,
    inout  logic BTNC,
    output logic LED16_B, 
    output logic LED16_G,
    output logic LED16_R, 
    output logic LED17_B, 
    output logic LED17_G, 
    output logic LED17_R);
    
    logic Onesecond;
    logic [5:0] output_LED;

    assign output_LED = {LED16_B,LED16_G,LED16_R,LED17_B,LED17_G,LED17_R};

    Clkdiv  U1(.clk(CLK100MHZ), .clr(BTNC), .OneSecond(Onesecond));
    Traffic_LED U2(.clk1(Onesecond), .clr(BTNC), .lights(output_LED));
endmodule