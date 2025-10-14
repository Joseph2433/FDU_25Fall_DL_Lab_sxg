`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 11:17:44
// Design Name: 
// Module Name: Rgb_Led
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


module Rgb_Led(input logic sign,
               output logic r,
               output logic g
    );
    always_comb
    begin
    case(sign)
        1'b0:begin
                r = 1'b1;
                g = 1'b0;
                end
        1'b1:begin
                r = 1'b0;
                g = 1'b1;
                end
        default begin
                r = 1'b0;
                g = 1'b0;
                end
    endcase
    end
endmodule
