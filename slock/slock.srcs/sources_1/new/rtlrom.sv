`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/10 15:40:21
// Design Name: 
// Module Name: rtlrom
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


module rtlrom(
input logic zero,
input logic one,
input logic two,
input logic three,
output logic [1:0] din
    );
    logic [3:0] s ;
    assign s = {zero,one,two,three};
    always_comb
        begin
            case(s)
                4'b1000 : begin din = 2'b00; end
                4'b0100 : begin din = 2'b01; end
                4'b0010 : begin din = 2'b10; end
                4'b0001 : begin din = 2'b11; end
                default: begin
                    din = 2'b00;
                end
            endcase
        end
endmodule 
