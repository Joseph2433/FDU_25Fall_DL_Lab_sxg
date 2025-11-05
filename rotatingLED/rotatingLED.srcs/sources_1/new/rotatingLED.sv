`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/03 11:45:29
// Design Name: 
// Module Name: rotatingLED
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


module rotatingLED( input logic clk,
                    input logic reset,
                    output logic RedLED,
                    output logic BlueLED );

parameter S0 = 0, S1 = 1, S2 = 2,S3 = 3,S4 = 4,S5= 5,S6 = 6;
logic [2:0] state;

always_ff @(posedge clk)
  if (!reset) state <= S0;
  else case (state)
    S0 : state <= S1;
    S1 : state <= S2;
    S2 : state <= S3;
    S3 : state <= S4;
    S4 : state <= S5;
    S5 : state <= S6;
    S6 : state <= S1;
    default: state <= S0;
  endcase

always_comb
  case (state)
    S0 : begin RedLED = 1'b0; BlueLED = 1'b0; end 
    S1 : begin RedLED = 1'b1; BlueLED = 1'b0; end 
    S2 : begin RedLED = 1'b0; BlueLED = 1'b1; end     
    S3 : begin RedLED = 1'b1; BlueLED = 1'b0; end 
    S4 : begin RedLED = 1'b0; BlueLED = 1'b1; end     
    S5 : begin RedLED = 1'b1; BlueLED = 1'b1; end 
    S6 : begin RedLED = 1'b1; BlueLED = 1'b1; end 
    default: begin RedLED = 1'b0; BlueLED = 1'b0; end 
  endcase
endmodule
