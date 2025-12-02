`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/17 14:30:08
// Design Name: 
// Module Name: state_changer
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


module state_changer( 
    input  logic clk1, 
    inout  logic clr,
    output logic [7:0] lights ); 

    logic [2:0] state;  

    parameter  S0=3'b000, S1=3'b001, S2=3'b010, S3=3'b011,
               S4=3'b100, S5=3'b101, S6=3'b110, S7=3'b111;

    always_ff @(posedge clk1, posedge clr)
    begin
        if(clr==1)  begin state<=S0; end      
        else
            case(state)
                S0: begin state<=S1;      end                             
                S1: begin state<=S2;      end                          
                S2: begin state<=S3;      end    
                S3: begin state<=S4;      end    
                S4: begin state<=S5;      end 
                S5: begin state<=S6;      end 
                S6: begin state<=S7;      end   
                S7: begin state<=S0;      end                                                 
                default: begin state<=S0;  end                         
             endcase               
    end

    always_comb    
    begin                    
        case(state)          
            S0:    begin lights = 8'b01_10_10_10;  end    
            S1:    begin lights = 8'b10_01_10_10;  end    
            S2:    begin lights = 8'b10_10_01_10;  end     
            S3:    begin lights = 8'b10_10_10_01;  end 
            S4:    begin lights = 8'b10_10_10_00;  end 
            S5:    begin lights = 8'b10_10_00_10;  end 
            S6:    begin lights = 8'b10_00_10_10;  end 
            S7:    begin lights = 8'b00_10_10_10;  end    
            default: begin lights = 8'b00000_0_0_0;  end
        endcase
    end             
endmodule
