`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/13 20:22:12
// Design Name: 
// Module Name: heg7seg
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


module hex7seg(input logic [3:0] digit,
output logic [6:0] a2g

    );
    always_comb
        case(digit)
        'h0: a2g = 7'b0000001;
        'h1: a2g = 7'b1001111;
        default: a2g = 7'b1111111; 
    endcase
endmodule
