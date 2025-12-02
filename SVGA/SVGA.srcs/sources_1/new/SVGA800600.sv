`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/12/01 15:57:24
// Design Name: 
// Module Name: SVGA800600
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


module SVGA800600(
    input  logic clk, clr,
    output logic hSync, vSync,   
    output logic [10:0] xPixel, yPixel, 
    output logic displayOn );     
     
    // horizontal constants
    localparam H_DISPLAY = 800; // horizontal display width 
    localparam H_SYNC    =  120; //horizontal sync lines
    localparam H_BACK    =  56; // left border (back porch) 
    localparam H_FRONT   =  64; // right border (front porch) 
    // vertical constants
    localparam V_DISPLAY = 600; // vertical display height 
    localparam V_SYNC    =   6; // vertical sync lines
    localparam V_TOP     =  37; // vertical top border  
    localparam V_BOTTOM  =  23; // vertical bottom border  
    // derived constants
    localparam 
      H_SYNC_START = H_SYNC + H_BACK,                       
      H_SYNC_END   = H_SYNC + H_BACK + H_DISPLAY,           
      H_PIXELS     = H_SYNC + H_BACK + H_DISPLAY + H_FRONT, 
      V_SYNC_START = V_SYNC + V_TOP,                       
      V_SYNC_END   = V_SYNC + V_TOP + V_DISPLAY,            
      V_LINES      = V_SYNC + V_TOP + V_BOTTOM + V_DISPLAY; 

    logic hMaxed, vMaxed;
    assign hMaxed = (xPixel == H_PIXELS-1) || clr;	// set when xPixel is maximum
    assign vMaxed = (yPixel == V_LINES -1) || clr;	// set when yPixel is maximum
     
    // horizontal position counter  
    always @(posedge clk)
    begin
        
        hSync <= (xPixel>=H_SYNC && xPixel<H_SYNC_END); 
        if(hMaxed)  xPixel <= 0;
        else        xPixel <= xPixel + 1;
    end  
    
    // vertical position counter  
    always @(posedge clk)
    begin
       
        vSync <= (yPixel>=V_SYNC && yPixel<V_SYNC_END); 
        if(hMaxed)
            if (vMaxed)  yPixel <= 0;
            else         yPixel <= yPixel + 1;
    end  
    
    //Enable displayOn when beam is in "safe" visible frame
    assign displayOn = ((xPixel>=H_SYNC_START) && 
                        (xPixel< H_SYNC_END) &&   
                        (yPixel>=V_SYNC_START) && 
                        (yPixel< V_SYNC_END));   
endmodule
    
