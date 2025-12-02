`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/24 18:41:10
// Design Name: 
// Module Name: TimeCounter
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


module TimeCounter(
input logic clr,
input logic time_in,
output logic time_out,
output logic [7:0] timec
    );
    always_ff @(posedge time_in or posedge clr)
    begin 
        if(clr == 1) begin timec <= 7'h0; end
        else begin 
            timec <= timec + 1;
            if(timec == 59) begin time_out <= 1;timec <= 0; end
            else begin time_out <= 0; end
        end

    end

endmodule
