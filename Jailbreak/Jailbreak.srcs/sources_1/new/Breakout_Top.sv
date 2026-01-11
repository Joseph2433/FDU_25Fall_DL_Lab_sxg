module Breakout_Top(
    input  logic CLK100MHZ,      
    input  logic BTNC,          
    input  logic BTNU, BTND,    
    output logic VGA_HS, VGA_VS, 
    output logic [3:0] VGA_R, VGA_G, VGA_B 
);

    // 内部连接信号
    logic clk25MHz, clk60Hz;
    logic videoOn;
    logic [10:0] pixel_x, pixel_y;
    logic [3:0] game_r, game_g, game_b;

    clkDiv U_Clock(
        .clk(CLK100MHZ),
        .clr(BTNC),
        .clk25MHz(clk25MHz),
        .clk60Hz(clk60Hz)
    );

    VGA640x480 U_VGA(
        .clk(clk25MHz),      // 必须用 25MHz
        .clr(BTNC),
        .hSync(VGA_HS),
        .vSync(VGA_VS),
        .xPixel(pixel_x),    // 输出当前扫描的 X
        .yPixel(pixel_y),    // 输出当前扫描的 Y
        .displayOn(videoOn)  // 输出是否在显示区
    );

    breakout_game U_Game(
        .clk(clk60Hz),       // 必须用 60Hz (游戏速度)
        .reset(BTNC),
        .btnUp(BTNU),
        .btnDown(BTND),
        .videoOn(videoOn),
        .pix_x(pixel_x),     // 输入坐标
        .pix_y(pixel_y),     // 输入坐标
        .red(game_r),        // 接收计算出的颜色
        .green(game_g),
        .blue(game_b)
    );

    // -----------------------------------------------------------
    // 4. 输出赋值
    // -----------------------------------------------------------
    assign VGA_R = game_r;
    assign VGA_G = game_g;
    assign VGA_B = game_b;

endmodule