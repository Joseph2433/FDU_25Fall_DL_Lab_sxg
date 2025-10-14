`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/15 13:27:06
// Design Name: 
// Module Name: x7seg1
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


module x7seg1(input logic [15:0] data,
    input logic clr,
    input logic clk,
    output logic [3:0] an,
    output logic [6:0] a2g,
    output logic dp

    );
logic [1:0] s;
logic [3:0] digit;
logic [19:0] clkdiv;

assign dp = 1;
assign s = clkdiv[19:18];

always_comb 
    case(s)
        'h0: digit = data[3:0];
        'h1: digit = data[7:4];
        'h2: digit = data[11:8];
        'h3: digit = data[15:12];
        default:digit = data[3:0];
    endcase
  
always_comb
    case(s)
    'h0: an = 4'b1110;
    'h1: an = 4'b1101;    
    'h2: an = 4'b1011;    
    'h3: an = 4'b0111;
    default : an = 4'b1110;
    endcase
    
always @(posedge clk , posedge clr)
    if(clr == 1 ) clkdiv <= 0;
    else clkdiv <= clkdiv + 1;
    
hex7seg(.digit(digit),.a2g(a2g));
    
endmodule
