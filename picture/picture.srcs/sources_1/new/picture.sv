module picture(
    input  logic clk,            
    input  logic reset,
    input  logic videoOn,       
    input  logic [10:0] pix_x, pix_y, 
    output logic [3:0] red, green, blue, 
    input  logic [11:0] picData,  
    output logic [16:0] picAddr17 
    );

    //=======================================================
    // 参数定义：VGA时序与屏幕尺�?
    //=======================================================
    localparam 
      MAX_X = 640,  MAX_Y = 480,  
      H_SYNC    =  96, 
      H_BACK    =  48, 
      H_SYNC_START = H_SYNC + H_BACK, 
      V_SYNC    =   2, 
      V_TOP     =  29, 
      V_SYNC_START = V_SYNC + V_TOP;  

    //=======================================================
    // 图片显示参数 (适配 A7 芯片 BRAM 限制，使�? 320x320)
    //=======================================================
    localparam PIC_W = 220; // 图片宽度
    localparam PIC_H = 220; // 图片高度
    
    // 计算图片在屏幕中央的起始坐标 (Offset)
    // C1 = (640 - 320) / 2 = 160
    // R1 = (480 - 320) / 2 = 80
    logic [10:0] C1, R1; 
    assign C1 = (MAX_X - PIC_W) / 2; 
    assign R1 = (MAX_Y - PIC_H) / 2; 

    //=======================================================
    // 图片地址计算逻辑
    //=======================================================
    logic picOn;             
    logic [10:0] xPic, yPic;

    // 计算相对坐标
    assign xPic = pix_x - H_SYNC_START - C1;
    assign yPic = pix_y - V_SYNC_START - R1;

    // 判断是否在显示区�?
    assign picOn = ((pix_x >= H_SYNC_START + C1) && (pix_x < H_SYNC_START + C1 + PIC_W) &&
                    (pix_y >= V_SYNC_START + R1) && (pix_y < V_SYNC_START + R1 + PIC_H));

    // 计算ROM地址�? 地址 = 行号 * 宽度 + 列号
    // 320 * yPic 可以优化，但在FPGA综合器中乘法通常能被处理
    assign picAddr17 = (picOn) ? (PIC_W * yPic + xPic) : 17'd0;

    //=======================================================
    // RGB 颜色输出逻辑
    //=======================================================
    logic [3:0] pic_r, pic_g, pic_b;
    assign pic_r = picData[11:8]; 
    assign pic_g = picData[7:4];  
    assign pic_b = picData[3:0];  

    always_comb begin
        if (~videoOn) begin
            red   = 4'b0000;
            green = 4'b0000;
            blue  = 4'b0000;
        end
        else if (picOn) begin
            red   = pic_r;
            green = pic_g;
            blue  = pic_b;
        end
        else begin
            red   = 4'b0001; 
            green = 4'b0001; 
            blue  = 4'b0010; 
        end
    end

endmodule