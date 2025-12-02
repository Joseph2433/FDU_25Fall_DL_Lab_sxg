module SVGA_colors_Top(
    input  logic CLK100MHZ, BTNC,
    input  logic [11:0] SW,
    output logic VGA_HS, VGA_VS, 
    output logic [3:0] VGA_R, VGA_G, VGA_B );
    
    logic clk50MHz, displayOn;
    logic [10:0] xPixel, yPixel;
    
    clkDiv C1(.clk(CLK100MHZ), .clr(BTNC), .clk50MHz(clk50MHz));
    
    SVGA800600 V1(.clk(clk50MHz), .clr(BTNC),       // Input
                  .hSync(VGA_HS), .vSync(VGA_VS),   // Output
                  .xPixel(xPixel), .yPixel(yPixel), // Output 
                  .displayOn(displayOn));           // Output
                  
    assign VGA_R = (displayOn) ? SW[11:8] : 4'b0000;
    assign VGA_G = (displayOn) ? SW[ 7:4] : 4'b0000; 
    assign VGA_B = (displayOn) ? SW[ 3:0] : 4'b0000;  
endmodule