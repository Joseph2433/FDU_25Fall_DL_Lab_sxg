`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/22 10:56:16
// Design Name: 
// Module Name: Alu
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


module Alu(
    input logic [1:0] alusel,
    input logic m,
    input logic [3:0] a,
    input logic [3:0] b,
    input logic cin,
    output logic [39:0] data,
    output logic cout
    );

    logic [4:0] temp;
    logic [3:0] f;
    
    //核心alu功能实现
    always_comb
    begin
        f = 4'b0000;
        cout = 1'b0;
        data = 40'b0;
        case(m)
            1'b0://M = 0 位运算
                begin
                    cout = 0;
                    case(alusel)
                        2'b00: 
                            begin
                                f = ~a;
                                data = {1'b0,a,30'b100111001110011100111001010011,1'b0,f};
                            end//非
                        2'b01:  
                            begin
                                f = a & b;
                                data = {1'b0,a,5'b10011,1'b0,b,20'b10011100111001010011,1'b0,f};
                            end//与
                        2'b10: 
                            begin
                                f = a | b;
                                data = {1'b0,a,5'b10011,1'b0,b,20'b10011100111001010011,1'b0,f};
                            end//或
                        2'b11: 
                            begin 
                                f = a ^ b;
                                data = {1'b0,a,5'b10011,1'b0,b,20'b10011100111001010011,1'b0,f};
                            end//异或
                        default:
                            begin
                                f = ~a;
                                data = {1'b0,a,30'b100111001110011100111001010011,1'b0,f};
                            end
                    endcase
                end
            1'b1://M = 1 算术运算
                begin
                case(alusel)
                    2'b00: begin
                                temp = {1'b0, a} + {1'b0,b} + {4'b0000,cin};
                                f = temp [3:0];
                                cout = temp [4];
                                data = {1'b0,a,6'b100000,b,9'b100000000,cin,9'b100100000,cout,1'b0,f};
                            end
                        
                    2'b01:
                            begin 
                                temp = {1'b0,a} - {1'b0,b} - {4'b0000,cin};
                                f = temp [3:0];
                                cout = temp [4];
                                data = {1'b0,a,6'b100010,b,9'b100010000,cin,9'b100100000,cout,1'b0,f};
                            end
                    default: f = 4'b0000;
                 endcase
              end
          endcase
      end     

endmodule