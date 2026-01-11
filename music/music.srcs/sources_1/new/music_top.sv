module music_top(
    input  logic CLK100MHZ, BTND, //??????????
    input  logic BTNU, BTNC,    // ????Bar????
    output logic VGA_HS, VGA_VS,
    output logic [3:0] VGA_R, VGA_G, VGA_B,
    output logic AUD_PWM, // Open-drain output
    output logic AUD_SD); // Analog filter ShutDown input
    
    logic clk25MHz, videoOn;
    logic [10:0] pixel_x, pixel_y; 

    clkDiv C1(.clk(CLK100MHZ), .clr(BTND), 
              .clk25MHz(clk25MHz));   // output
    
    VGA640x480 V1(.clk(clk25MHz),  .clr(BTND),
             .hSync(VGA_HS),   .vSync(VGA_VS),   // output ***
             .xPixel(pixel_x), .yPixel(pixel_y), // output
             .displayOn(videoOn));               // output
          

    always_comb begin
        if (videoOn) begin
            // 这里设置一个纯蓝色背景，或者你可以自己改颜色
            VGA_R = 4'h0; 
            VGA_G = 4'h0; 
            VGA_B = 4'hF; // 蓝色最大
        end else begin
            // 消隐区必须为全黑
            VGA_R = 0; 
            VGA_G = 0; 
            VGA_B = 0;
        end
    end
    music M1(.clk(CLK100MHZ),
             .audioData(AUD_PWM), .audioSD(AUD_SD));//output            
endmodule