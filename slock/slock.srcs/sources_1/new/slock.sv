`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/10 15:11:54
// Design Name: 
// Module Name: slock
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


module slock(input logic [7:0] sw,
input logic [1:0] din,
input logic clr,
input logic clk,
output logic ans,
output logic an
    );
    parameter S0 = 4'b0000,S1 = 4'b0001,S2 = 4'b0010,S3 = 4'b0011,S4 = 4'b0100,E1 = 4'b0101,E2 = 4'b0110,E3 = 4'b0111,E4 = 4'b1000;
    logic [3:0] pstate;

    always_ff @(posedge clk, posedge clr) begin
        if(clr == 1) pstate <= S0;
        else case(pstate)
                S0 : if(din == sw[7:6]) pstate <= S1;
                    else pstate <= E1;
                S1 : if(din == sw[5:4]) pstate <= S2;
                    else pstate <= E2;
                S2 : if(din == sw[3:2]) pstate <= S3;
                    else pstate <= E3;
                S3 : if(din == sw[1:0]) pstate <= S4;
                    else pstate <= E4;
                S4 : 
                    if(din == sw[7:6]) pstate <= S1;
                    else pstate <= E1;
                E1 : pstate <= E2;
                E2 : pstate <= E3;
                E3 : pstate <= E4;
                E4 : pstate <= E1;
                default: pstate <= S0;
            endcase
    end

    always_comb
        if(pstate == S4) begin 
            ans = 1;
            an = 1;
        end
        else if(pstate == E4) begin 
            ans = 0;
            an = 1;
        end
        else begin 
            ans = 0;
            an = 0;
        end
endmodule
