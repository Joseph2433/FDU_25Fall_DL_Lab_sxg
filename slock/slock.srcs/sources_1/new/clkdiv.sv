`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/10 15:26:58
// Design Name: 
// Module Name: ckldiv
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


module clkdiv(input logic clk1,
input logic clr,
input logic clk2
    );
    logic [18:0] cnt;   

    always @(posedge clk1,posedge clr)
        if(clr == 1) cnt <= 0;
        else
            cnt <= cnt + 1;

    assign clk2 = cnt[18];
    
endmodule
