module picture_top(
    input  logic CLK100MHZ, 
    input  logic BTND,          
    output logic VGA_HS, VGA_VS,
    output logic [3:0] VGA_R, VGA_G, VGA_B
    );
    
    logic clk25MHz, clk60Hz, videoOn;
    logic [10:0] pixel_x, pixel_y; 

    clkDiv C1(.clk(CLK100MHZ), .clr(BTND), .clk25MHz(clk25MHz));
    clk60Hz C2(.clk(CLK100MHZ), .clr(BTND), .clk60Hz(clk60Hz));        
       
    VGA640x480 V1(
        .clk(clk25MHz), .clr(BTND), 
        .hSync(VGA_HS),   .vSync(VGA_VS), 
        .xPixel(pixel_x), .yPixel(pixel_y), 
        .displayOn(videoOn)
    );                  
        
    logic [16:0] addr17;
    logic [11:0] data;
    
    Draw D1(
        .clka(clk25MHz), 
        .addra(addr17),  
        .douta(data)     
    );  
   
    picture P1(
        .clk(clk60Hz), 
        .reset(BTND),
        .videoOn(videoOn), 
        .pix_x(pixel_x), .pix_y(pixel_y), 
        .red(VGA_R),    
        .green(VGA_G),  
        .blue(VGA_B),   
        .picData(data),
        .picAddr17(addr17)
    );                

endmodule