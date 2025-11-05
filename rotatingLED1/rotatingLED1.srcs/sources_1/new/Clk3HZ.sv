`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/03 12:03:48
// Design Name: 
// Module Name: Clk3HZ
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


module Clk3HZ(
    input  logic clk100MHz,  
    output logic clk3Hz     
);
    logic [23:0] count;  
    parameter HALF_PERIOD = 16650000; 

    always @(posedge clk100MHz) begin
         begin
            if (count == HALF_PERIOD - 1) begin
                count <= 0;
                clk3Hz <= ~clk3Hz;  
            end else begin
                count <= count + 1;
            end
        end
    end
endmodule
