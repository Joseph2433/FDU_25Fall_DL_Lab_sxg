`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/13 20:22:34
// Design Name: 
// Module Name: x7seg
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

module x7seg(
  input  logic [31:0] data,  
  input  logic        clk,
  output logic [7:0]  an,    
  output logic [6:0]  a2g,   
  output logic        dp
);
  logic [2:0] s;       
  logic [3:0] digit;   
  logic [20:0] clkdiv; 

  assign dp = 1'b1;

  assign s = clkdiv[20:18];

  always_comb begin
    unique case (s)
      3'h0: digit = data[ 3: 0];
      3'h1: digit = data[ 7: 4];
      3'h2: digit = data[11: 8];
      3'h3: digit = data[15:12];
      3'h4: digit = data[19:16];
      3'h5: digit = data[23:20];
      3'h6: digit = data[27:24];
      3'h7: digit = data[31:28];
      default: digit = 4'h0;
    endcase
  end

  always_comb begin
    unique case (s)
      3'h0: an = 8'b1111_1110;
      3'h1: an = 8'b1111_1101;
      3'h2: an = 8'b1111_1011;
      3'h3: an = 8'b1111_0111;
      3'h4: an = 8'b1110_1111;
      3'h5: an = 8'b1101_1111;
      3'h6: an = 8'b1011_1111;
      3'h7: an = 8'b0111_1111;
      default: an = 8'b1111_1111;
    endcase
  end

  always_ff @(posedge clk) begin
    clkdiv <= clkdiv + 1;
  end

  hex7seg u_hex7seg (
    .digit(digit),
    .a2g  (a2g)
  );
endmodule

