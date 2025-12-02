`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/17 14:30:51
// Design Name: 
// Module Name: X7seg
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


module X7seg(input logic [7:0] lights,
    input logic clk,
    output logic [7:0] an,
    output logic [6:0] a2g,
    output logic dp

    );
logic [2:0] s;
logic [1:0] digit;
logic [19:0] clkdiv;

assign s = clkdiv[19:17];
assign dp = 1;

always_comb 
    case(s)
        'h0: digit = lights[7:6];
        'h1: digit = lights[5:4];
        'h2: digit = lights[3:2];
        'h3: digit = lights[1:0];
        'h4: digit = 2'h3;
        'h5: digit = 2'h3;
        'h6: digit = 2'h3;
        'h7: digit = 2'h3;
        default:digit =  2'h3;
    endcase

always_comb
    case(s)
    'h0: an = 8'b11111110;
    'h1: an = 8'b11111101;    
    'h2: an = 8'b11111011;    
    'h3: an = 8'b11110111;
    'h4: an = 8'b11101111;
    'h5: an = 8'b11011111;
    'h6: an = 8'b10111111;
    'h7: an = 8'b01111111;
    default : an = 8'b11111111;
    endcase
    
always @(posedge clk)
    clkdiv <= clkdiv + 1;
    
Hex7seg(.digit(digit),.a2g(a2g));
endmodule
