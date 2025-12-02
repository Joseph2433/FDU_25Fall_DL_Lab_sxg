`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/24 18:41:30
// Design Name: 
// Module Name: Bin2BCD8bit
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


module Bin2BCD8bit(
    input  logic [7:0] b,
    output logic [11:0] p );
    
    logic [19:0] z;
    integer i;
    
    always_comb begin
        z = 20'd0;
        z[9:3] = b;         
        repeat (5) begin
            if (z[11:8]  >= 5) z[11:8]  = z[11:8]  + 4'd3; 
            if (z[15:12] >= 5) z[15:12] = z[15:12] + 4'd3; 
            if (z[19:16] >= 5) z[19:16] = z[19:16] + 4'd3; 
            z = z << 1;      
        end
        p = z[19:8];        
    end
endmodule 
    
    
    
