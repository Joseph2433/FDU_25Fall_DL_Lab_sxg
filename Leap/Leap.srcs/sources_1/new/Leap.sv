`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 10:13:47
// Design Name: 
// Module Name: Leap
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


module Leap(input logic [15:0] data,
            output logic sign
             );  
       logic valid;
       //将data转化为年份
       always_comb       
       begin
       automatic int year;
       valid = (data[3:0]  <= 4'd9) && 
            (data[7:4]  <= 4'd9) && 
            (data[11:8] <= 4'd9) && 
            (data[15:12] <= 4'd9);
       if(valid)begin
       year = data[3:0] + data[7:4]*10 + data[11:8]*100 + data[15:12]*1000;
       end
       else begin
       year = 0;
       end
       if(year % 4 == 0 && year % 100 != 0)
            begin
                 sign = 1;
            end
       else if(year % 400 == 0)
            begin 
                 sign = 1;
            end
        else begin
            sign = 0;
            end
       end
endmodule
