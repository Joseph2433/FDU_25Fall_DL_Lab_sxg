module breakout_game(
    input  logic clk, reset,    // clk: 60Hz 游戏逻辑时钟
    input  logic btnUp, btnDown,// 控制右侧挡板上下移动
    input  logic videoOn,       // 屏幕显示有效信号
    input  logic [10:0] pix_x, pix_y, // 当前扫描坐标
    output logic [3:0] red, green, blue // RGB输出
);

    //=======================================================
    // 1. 参数定义 (Parameters)
    //=======================================================
    localparam
    MAX_X = 640, MAX_Y = 480,
    H_SYNC = 96, H_BACK = 48,
    H_SYNC_START = H_SYNC + H_BACK, // 144
    V_SYNC = 2,  V_TOP  = 29,
    V_SYNC_START = V_SYNC + V_TOP;  // 31

    // --- 砖块参数 (Bricks) ---
    // 定义 3 列，8 行砖块
    localparam BRICK_COLS = 3;
    localparam BRICK_ROWS = 8;
    
    // 砖块区域起始位置 (屏幕最左侧)
    localparam BRICK_START_X = H_SYNC_START + 20; 
    localparam BRICK_START_Y = V_SYNC_START + 20;
    
    // 单个砖块尺寸
    localparam BRICK_W = 20;   // 宽
    localparam BRICK_H = 50;   // 高
    localparam BRICK_GAP = 5;  // 间隙
    
    // 砖块区域的总边界 (用于快速判断球是否进入危险区)
    localparam BRICK_AREA_RIGHT = BRICK_START_X + BRICK_COLS * (BRICK_W + BRICK_GAP);

    // --- 挡板参数 (Paddle/Bar) ---
    localparam BAR_X_L = H_SYNC_START + 600;
    localparam BAR_X_R = H_SYNC_START + 605;
    localparam BAR_Y_SIZE = 70;
    localparam BAR_V = 4;

    // --- 球参数 (Ball) ---
    localparam BALL_SIZE = 8;
    localparam BALL_V = 4; // 稍微快一点

    //=======================================================
    // 2. 变量定义 (Signals)
    //=======================================================
    
    // 砖块状态矩阵: 1=存在, 0=消失
    // logic [列][行]
    logic [BRICK_COLS-1:0][BRICK_ROWS-1:0] bricks_active; 
    
    logic brickOn, barOn, ballOn; // 显示信号
    logic [3:0] obj_r, obj_g, obj_b; // 临时颜色

    // 挡板位置
    logic [10:0] bar_y_t, bar_y_b;
    
    // 球位置与速度
    logic [10:0] ball_x_l, ball_x_r;
    logic [10:0] ball_y_t, ball_y_b;
    logic [10:0] ball_dx, ball_dy;

    //=======================================================
    // 3. 挡板逻辑 (Paddle Logic) - 保持不变
    //=======================================================
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            bar_y_t <= V_SYNC_START + MAX_Y/2 - BAR_Y_SIZE/2;
        end else begin
            if (btnDown && (bar_y_t <= (V_SYNC_START + MAX_Y - 1 - BAR_V - BAR_Y_SIZE)))
                bar_y_t <= bar_y_t + BAR_V;
            else if (btnUp && (bar_y_t >= (V_SYNC_START + BAR_V)))
                bar_y_t <= bar_y_t - BAR_V;
        end
    end
    assign bar_y_b = bar_y_t + BAR_Y_SIZE - 1;
    
    // 挡板显示判断
    assign barOn = ((BAR_X_L <= pix_x) && (pix_x <= BAR_X_R) &&
                    (bar_y_t <= pix_y) && (pix_y <= bar_y_b));

    //=======================================================
    // 4. 球的运动与碰撞逻辑 (Ball Physics & Collision)
    //=======================================================
    
    // 辅助变量：计算球当前所在的砖块索引
    // 注意：这里为了简化逻辑，直接用球的左上角坐标除以砖块大小
    // 实际硬件除法较慢，最好长宽设为2的幂次用移位，这里为了逻辑清晰保留除法形式，
    // 综合器通常会优化常数除法。
    integer hit_col_idx, hit_row_idx;
    
    always_comb begin
        // 计算球左边缘接触到的 列索引
        hit_col_idx = (ball_x_l - BRICK_START_X) / (BRICK_W + BRICK_GAP);
        // 计算球上边缘接触到的 行索引
        hit_row_idx = (ball_y_t - BRICK_START_Y) / (BRICK_H + BRICK_GAP);
    end

    always @(posedge clk, posedge reset) begin
        if (reset) begin
            ball_x_l <= H_SYNC_START + MAX_X/2;
            ball_y_t <= V_SYNC_START + MAX_Y/2;
            ball_dx  <= -1 * BALL_V; // 初始向左飞
            ball_dy  <= BALL_V;
            
            // *** 复位时，重置所有砖块为 1 (存在) ***
            bricks_active <= '1; 
        end
        else begin
            // 更新球位置
            ball_x_l <= ball_x_l + ball_dx;
            ball_y_t <= ball_y_t + ball_dy;
            
            // --- Y轴边界碰撞 (上下墙) ---
            if (ball_y_t <= V_SYNC_START) ball_dy <= BALL_V;
            else if (ball_y_b >= V_SYNC_START + MAX_Y) ball_dy <= -1 * BALL_V;
            
            // --- X轴右侧碰撞 (挡板) ---
            if ((ball_x_r >= BAR_X_L) && (ball_x_r <= BAR_X_R) && 
                (ball_y_b >= bar_y_t) && (ball_y_t <= bar_y_b)) begin
                 ball_dx <= -1 * BALL_V; // 被挡板挡回
            end
            else if (ball_x_r >= H_SYNC_START + MAX_X) begin
                 ball_dx <= -1 * BALL_V; // (可选) 碰到屏幕最右边反弹，防止飞出
            end

            // --- X轴左侧碰撞 (砖块逻辑) ---
            // 1. 判断球是否进入了砖块所在的区域 (X坐标)
            if (ball_dx < 0 && (ball_x_l <= BRICK_AREA_RIGHT) && (ball_x_l >= BRICK_START_X)) begin
                
                // 2. 检查索引是否有效 (防止越界)
                if (hit_col_idx >= 0 && hit_col_idx < BRICK_COLS &&
                    hit_row_idx >= 0 && hit_row_idx < BRICK_ROWS) begin
                    
                    // 3. 检查该位置的砖块是否还“活着”
                    if (bricks_active[hit_col_idx][hit_row_idx] == 1'b1) begin
                        // *** 核心：命中砖块 ***
                        ball_dx <= BALL_V; // 反弹向右
                        bricks_active[hit_col_idx][hit_row_idx] <= 1'b0; // 砖块消失
                    end
                end
            end
            
            // (可选) 如果球穿过砖块区到了屏幕最左边，反弹
            if (ball_x_l <= H_SYNC_START) 
                ball_dx <= BALL_V;
        end
    end

    assign ball_x_r = ball_x_l + BALL_SIZE - 1;
    assign ball_y_b = ball_y_t + BALL_SIZE - 1;

    // 球体显示判断 (简单的方形球)
    assign ballOn = ((ball_x_l <= pix_x) && (pix_x <= ball_x_r) &&
                     (ball_y_t <= pix_y) && (pix_y <= ball_y_b));

    //=======================================================
    // 5. 砖块绘制逻辑 (Brick Rendering)
    //=======================================================
    
    // 计算当前扫描到的像素对应哪个砖块索引
    integer draw_col_idx, draw_row_idx;
    logic in_brick_region;
    
    always_comb begin
        // 判断像素是否在整个砖块大区域内
        if (pix_x >= BRICK_START_X && pix_y >= BRICK_START_Y &&
            pix_x < BRICK_START_X + BRICK_COLS * (BRICK_W + BRICK_GAP) &&
            pix_y < BRICK_START_Y + BRICK_ROWS * (BRICK_H + BRICK_GAP)) 
        begin
            // 计算索引
            draw_col_idx = (pix_x - BRICK_START_X) / (BRICK_W + BRICK_GAP);
            draw_row_idx = (pix_y - BRICK_START_Y) / (BRICK_H + BRICK_GAP);
            
            // 计算当前像素在具体某块砖内部的相对位置，用于处理间隙(Gap)
            // 如果余数小于 BRICK_W，说明在砖身上，否则在间隙里
            if (((pix_x - BRICK_START_X) % (BRICK_W + BRICK_GAP) < BRICK_W) &&
                ((pix_y - BRICK_START_Y) % (BRICK_H + BRICK_GAP) < BRICK_H)) begin
                
                // 只有当该位置的砖块状态为 1 时，才显示
                if (bricks_active[draw_col_idx][draw_row_idx])
                    brickOn = 1'b1;
                else
                    brickOn = 1'b0;
            end else begin
                brickOn = 1'b0; // 在砖块间隙中
            end
        end else begin
            brickOn = 1'b0; // 不在砖块区域
        end
    end

    //=======================================================
    // 6. RGB 输出逻辑 (Painter's Algorithm)
    //=======================================================
    always_comb begin
        if (~videoOn) begin
            red = 0; green = 0; blue = 0;
        end
        else if (ballOn) begin // 球：红色
            red = 4'b1111; green = 4'b0000; blue = 4'b0000;
        end
        else if (barOn) begin  // 挡板：绿色
            red = 4'b0000; green = 4'b1111; blue = 4'b0000;
        end
        else if (brickOn) begin // 砖块：蓝色 (参考作业图)
            red = 4'b0100; green = 4'b0111; blue = 4'b1111; 
        end
        else begin // 背景：浅灰色
            red = 4'b1100; green = 4'b1100; blue = 4'b1100;
        end
    end

endmodule