`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 09:51:09
// Design Name: 
// Module Name: Hex7seg
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


module Hex7seg(input logic [3:0] digit,
               output logic [6:0] a2g
               );
    always_comb
        case(digit)
        'h0: a2g = 7'b0000001;
        'h1: a2g = 7'b1001111;
        'h2: a2g = 7'b0010010;
        'h3: a2g = 7'b0000110;
        'h4: a2g = 7'b1001100;
        'h5: a2g = 7'b0100100;
        'h6: a2g = 7'b0100000;
        'h7: a2g = 7'b0001111;
        'h8: a2g = 7'b0000000;
        'h9: a2g = 7'b0000100;
        //'hA: a2g = 7'b0001000;
        //'hB: a2g = 7'b1100000;
        //'hC: a2g = 7'b0110001;
        //'hD: a2g = 7'b1000010;
        //'hE: a2g = 7'b0110000;
        //'hF: a2g = 7'b0111000;
        'hA: a2g = 7'b1111111;
        'hB: a2g = 7'b1111111;
        'hC: a2g = 7'b1111111;
        'hD: a2g = 7'b1111111;
        'hE: a2g = 7'b1111111;
        'hF: a2g = 7'b1111111;
        default: a2g = 7'b1111111; 
    endcase
      
endmodule

 
