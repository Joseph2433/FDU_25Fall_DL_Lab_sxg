`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/13 23:02:42
// Design Name: 
// Module Name: To_Gray2
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


module To_Gray2(input  logic [3:0] bin,   
  output logic [3:0] gray

    );
    assign gray[3] = bin[3];
    assign gray[2] = (~bin[3] & bin[2]) | (~bin[2] & bin[3]);
    assign gray[1] = (~bin[2] & bin[1]) | (~bin[1] & bin[2]);
    assign gray[0] = (~bin[1] & bin[0]) | (~bin[0] & bin[1]);
    
endmodule
