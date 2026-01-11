`timescale 1ns / 1ps

module testbench();
    // 1. 物理接口信号 (对应 Top 模块端口)
    logic        clk;
    logic        reset; // 对应 BTNC
    logic        btnl, btnr;
    logic [15:0] sw;
    logic [15:0] led;
    logic [7:0]  an;
    logic [6:0]  a2g;

    // 2. 调试用内部信号 (Signal Spying)
    logic [31:0] dataadr, writedata;
    logic        memwrite;

    // 3. 实例化 Top 模块
    Top dut(
        .CLK100MHZ(clk),
        .BTNC(reset),
        .BTNL(btnl),
        .BTNR(btnr),
        .SW(sw),
        .LED(led),
        .AN(an),
        .A2G(a2g)
    );

    // 4. 连接内部信号以便观察 (用于自动检查)
    // 根据之前的代码结构: Top -> mips -> datapath/controller
    assign memwrite  = dut.mips.memwrite;
    assign dataadr   = dut.mips.aluout;     // 数据存储器地址
    assign writedata = dut.mips.writedata;  // 写入的数据

    // 5. 时钟生成 (100MHz)
    always begin
        clk = 1; #5; clk = 0; #5;
    end

    // 6. 测试流程 (模拟硬件操作)
    initial begin
        // --- 初始化 ---
        reset = 1; 
        btnl = 0; btnr = 0; sw = 0;
        
        // 保持复位足够长的时间 (22ns)，消除不定态
        #22; 
        reset = 0; 

        // --- 步骤 1: 设置开关输入 ---
        // 目标: 12 + 34 = 46
        // 我们用 Hex 方式输入: 低8位 0x12, 高8位 0x34
        // 组合后 SW = 16'h3412
        #50;
        sw = 16'h3412;

        // --- 步骤 2: 按下 BTNR (确认输入) ---
        // CPU 正在轮询 Status[1] (地址 0x80 的 bit 1)
        #100; 
        btnr = 1; 
        #200; // 按住 200ns，确保 CPU 轮询能捕捉到
        btnr = 0; // 松开

        // --- 等待 CPU 计算 ---
        // 此时 CPU 执行加法，并开始轮询 Status[0] (等待输出)
        #200;

        // --- 步骤 3: 按下 BTNL (确认输出) ---
        btnl = 1;
        #200; // 按住 200ns
        btnl = 0; // 松开

        // --- 步骤 4: 观察结果 ---
        // CPU 检测到按键后，会将结果写入 LED 端口 (地址 0x84)
        #500;
        
        // 仿真结束前的最终检查
        if (led === 16'h0046) begin
             $display("--------------------------------------------------");
             $display("Test Passed: LED shows 46 (Hex)");
             $display("--------------------------------------------------");
        end else begin
             $display("Test Failed: LED shows %h, expected 0046", led);
        end
        
        $stop;
    end

    // 7. 实时自动检查 (仿照教材风格)
    // 在每个时钟下降沿检查是否发生了对 LED 端口的写操作
    always @(negedge clk) begin
        if (memwrite) begin
            // 地址 0x84 (132) 是 LED 端口
            // 期望写入的数据是 0x12 + 0x34 = 0x46 (70)
            if (dataadr === 32'h84 && writedata === 32'h46) begin
                $display("Simulation succeeded: Output 46 to LED address 84 at time %t", $time);
                $stop; // 成功后停止仿真
            end 
            // 忽略对 Status 寄存器 (0x80) 的写操作（如果有的话）
            else if (dataadr === 32'h84) begin
                 $display("Simulation Warning: Writing wrong value %h to LED", writedata);
            end
        end
    end

endmodule