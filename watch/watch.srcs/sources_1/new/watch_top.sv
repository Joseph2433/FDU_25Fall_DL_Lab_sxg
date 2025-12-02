`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/24 18:40:10
// Design Name: 
// Module Name: watch_top
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


module watch_top(input logic CLK100MHZ,
    input logic BTNC,
    output logic DP,
    output logic [6:0] A2G,
    output logic [7:0] AN
    );
    logic [7:0] times;
    logic [7:0] timem;
    logic [7:0] timeh;
    logic Onesecond;

    logic timem_in;
    logic timeh_in;

    logic [31:0] x;

    logic [11:0] times1;
    logic [11:0] timem1;
    logic [11:0] timeh1;

    OneSecond U1(.clk(CLK100MHZ), .clr(BTNC), .OneSecond(Onesecond));
    TimeCounter s(.clr(BTNC),.time_in(Onesecond),.time_out(timem_in),.timec(times));
    Bin2BCD8bit s1(.b(times),.p(times1));
    TimeCounter m(.clr(BTNC),.time_in(timem_in),.time_out(timeh_in),.timec(timem));
    Bin2BCD8bit m1(.b(timem),.p(timem1));
    TimeCounter h(.clr(BTNC),.time_in(time_hin),.time_out(0),.timec(timeh));
    Bin2BCD8bit h1(.b(timeh),.p(timeh1));

    assign x = {timeh1[7:0],
                4'b1010,
                timem1[7:0],
                4'b1010,
                times1[7:0]};

    X7seg x7(.x(x),.clk(CLK100MHZ),.an(AN),.a2g(A2G),.dp(DP));

endmodule
