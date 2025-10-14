module x7seg( input  logic [15:0] data1,
              input  logic [15:0] data2,
              input  logic        clk,
              output logic [6:0]  a2g,
              output logic [7:0]  an, //数码管使能
              output logic        dp ); //小数点
    
    logic [2:0] s;     //选择哪个数码管
    logic [3:0] digit;
    logic [19:0] clkdiv;
    
    assign dp = 1;           // DP off
    assign s = clkdiv[19:17];    
    
    //八个数码管 8选1 (MUX44)
    always_comb
        case(s)
            0:  digit = data1[3:0];
            1:  digit = data1[7:4];
            2:  digit = data1[11:8];
            3:  digit = data1[15:12];
            4:  digit = data2[3:0];
            5:  digit = data2[7:4];
            6:  digit = data2[11:8];
            7:  digit = data2[15:12];
            default: digit = data1[3:0];
        endcase
    
    //8个数码管的使能
    always_comb
        case(s)
            0:  an = 8'b11111110;
            1:  an = 8'b11111101;
            2:  an = 8'b11111011;
            3:  an = 8'b11110111;
            4:  an = 8'b11101111;
            5:  an = 8'b11011111;
            6:  an = 8'b10111111;
            7:  an = 8'b01111111;
            default: an = 8'b11111110;
        endcase
        
    // 时钟分频器（20位二进制计数器）
    always @(posedge clk)
         clkdiv <= clkdiv + 1;
    
    //实例化 7段数码管
    Hex7Seg H7(.digit(digit), .a2g(a2g));    
endmodule