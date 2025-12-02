module SVGA_Top(
    input  logic CLK100MHZ, BTNC,
    output logic VGA_HS, VGA_VS, 
    output logic [3:0] VGA_R, VGA_G, VGA_B );
    
    logic clk50MHz, displayOn;
    logic [10:0] xPixel, yPixel;
    
    clkDiv C1(.clk(CLK100MHZ), .clr(BTNC), .clk50MHz(clk50MHz));
    
    SVGA800600 V1(.clk(clk50MHz), .clr(BTNC),       // Input
                  .hSync(VGA_HS), .vSync(VGA_VS),   // Output
                  .xPixel(xPixel), .yPixel(yPixel), // Output 
                  .displayOn(displayOn));           // Output
                  
    assign VGA_R = (displayOn) ? 4'b1111 : 4'b0000;
    assign VGA_G = 4'b0; 
    assign VGA_B = 4'b0;                
endmodule