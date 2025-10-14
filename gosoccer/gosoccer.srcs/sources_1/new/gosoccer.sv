`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/08 15:39:05
// Design Name: 
// Module Name: gosoccer
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


module gosoccer(
        input logic [15:0] SW,
        output logic [15:0] LED
    );
    assign LED[15:9] = SW[15:9];
    assign LED[7:0] = SW[7:0];
    assign LED[8] = SW[15] & SW[0];
           
endmodule
