`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/20 10:31:31
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


module X7seg(input logic [31:0] data,
    input logic clk,
    output logic [7:0] an,
    output logic [6:0] a2g,
    output logic dp

    );
logic [2:0] s;
logic [3:0] digit;
logic [19:0] clkdiv;

assign dp = 1;
assign s = clkdiv[19:17];

always_comb 
    case(s)
        'h0: digit = data[3:0];
        'h1: digit = data[7:4];
        'h2: digit = data[11:8];
        'h3: digit = data[15:12];
        'h4: digit = data[19:16];
        'h5: digit = data[23:20];
        'h6: digit = data[27:24];
        'h7: digit = data[31:28];
        default:digit = data[3:0];
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
