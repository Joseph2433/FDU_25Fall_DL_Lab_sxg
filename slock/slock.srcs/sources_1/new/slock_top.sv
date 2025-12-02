`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/10 15:04:53
// Design Name: 
// Module Name: slock_top
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


module slock_top(input logic [7:0] SW,
output logic [7:0] LED,
input logic CLK100MHZ,
output logic LED16_G,
output logic LED16_R,
input logic BTNC,//clr
input logic BTNU,//0123
input logic BTNL,
input logic BTNR,
input logic BTND
    );
    logic clk190HZ,clk,inp,an,ans;
    logic [1:0] din;
    assign LED = SW;
    
    assign inp = BTND | BTNL | BTNR | BTNU;
    clkdiv div(.clk1(CLK100MHZ),.clr(BTNC),.clk2(clk190HZ));

    ClockPulse p(.clk(clk190HZ), .clr(BTNC), .inp(inp), .outp(clk));

    rtlrom rtlrom(.zero(BTNU), .one(BTNL), .two(BTNR),.three(BTND),.din(din));

    slock locker(.sw(SW),.din(din),.clr(BTNC),.clk(clk),.ans(ans),.an(an));

    always_comb
        begin 
            if(an == 1 && ans == 1) begin 
                LED16_G = 1;
                LED16_R = 0;  
                end 
            else if(an == 1 && ans == 0) begin 
                LED16_R = 1;
                LED16_G = 0;  
                end 
            else begin 
                LED16_R = 0;
                LED16_G = 0;  
                end 
        end

endmodule
