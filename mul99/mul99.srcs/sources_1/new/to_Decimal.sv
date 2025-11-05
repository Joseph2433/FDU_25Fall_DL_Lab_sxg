`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/27 11:02:11
// Design Name: 
// Module Name: to_Decimal
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


module to_Decimal(
    input  logic [7:0] b,
    output logic [11:0] p );
    
    logic [19:0] z;
    integer i;
    
    always_comb begin
        z = 20'd0;            
        z[7:0] = b;         
        repeat (8) begin
            if (z[11:8]  >= 5) z[11:8]  = z[11:8]  + 4'd3; 
            if (z[15:12] >= 5) z[15:12] = z[15:12] + 4'd3; 
            if (z[19:16] >= 5) z[19:16] = z[19:16] + 4'd3; 
            z = z << 1;      
        end
        p = z[19:8];        
    end
endmodule 
