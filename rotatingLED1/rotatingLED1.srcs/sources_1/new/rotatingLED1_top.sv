`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/03 11:58:18
// Design Name: 
// Module Name: rotatingLED1_top
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


module rotatingLED1_top(
    input logic [15:0] SW,         
    output logic [15:0] LED,      
    input logic CLK100MHZ,         
    input logic BTNC            
);
    logic clk3HZ;  
    logic Q;     
    logic notQ;


    Clk3HZ(
        .clk100MHz(CLK100MHZ),     
        .clk3Hz(clk3HZ)         
    );

    JK  (
        .clk(clk3HZ),         
        .J(SW[15]),            
        .K(SW[0]),             
        .q(Q),                  
        .notq(notQ)          
    );

    always_comb begin
        for (int i = 0; i < 16; i++) begin
            if (i % 2 == 1) begin 
                LED[i] = Q;
            end else begin 
                LED[i] = notQ;
            end
        end
    end
endmodule
