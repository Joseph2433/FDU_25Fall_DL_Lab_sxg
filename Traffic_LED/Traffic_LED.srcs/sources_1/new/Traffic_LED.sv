`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/17 13:59:15
// Design Name: 
// Module Name: Traffic_LED
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


module Traffic_LED(
    input  logic clk1, 
    inout  logic clr,
    output logic [5:0] lights ); 

    logic [1:0] state;  
    logic [6:0] count;  

    parameter  S0=2'b00, S1=2'b01, S2=2'b10,
                S3=2'b11;
    parameter  Sec15=15, 
                Sec45=45; 

    always_ff @(posedge clk1, posedge clr)
    begin
        if(clr==1)                  begin  state<=S0; count<=0;        end            
        else
            case(state)
                S0: if(count<Sec45)  begin  state<=S0; count<=count+1;  end                        
                    else            begin  state<=S1; count<=0;        end                         
                S1: if(count<Sec15)  begin  state<=S1; count<=count+1;  end                        
                    else            begin  state<=S2; count<=0;        end                        
                S2: if(count<Sec45)  begin  state<=S2; count<=count+1;  end                       
                    else            begin  state<=S3; count<=0;        end
                S3: if(count<Sec15)  begin  state<=S3; count<=count+1;  end                        
                    else            begin  state<=S0; count<=0;        end                                              
                default             begin  state<=S0; count<=0;        end                         
             endcase               
    end

    always_comb    
    begin                    
        case(state)          
            S0:     lights = 6'b0_1_0_0_0_1;     
            S1:     lights = 6'b1_0_0_0_0_1;     
            S2:     lights = 6'b0_0_1_0_1_0;     
            S3:     lights = 6'b0_0_1_1_0_0;     
            default lights = 6'b0_1_0_0_0_1;
        endcase
    end             
endmodule