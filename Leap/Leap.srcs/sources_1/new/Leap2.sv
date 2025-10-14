`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 11:43:12
// Design Name: 
// Module Name: Leap2
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


module Leap2(input logic [15:0] data,
             output logic sign
    );
    logic d4;
    logic d100;
    logic d400;
   
    always_comb
    begin
        d4 = ~(data[4] | data[1] | data[0]) | data[4] & data[1] &(~data[0]);
        d100 = ~(data[7] | data[6] | data[5] | data[4]|data[3] | data[2] | data[1] | data[0]);
        d400 = d100 & (~(data[12] |data[8]|data[9]) | data[12] & ~data[8]& data[9]);
        sign = d4 &(~d100)|d400;
     end
endmodule
