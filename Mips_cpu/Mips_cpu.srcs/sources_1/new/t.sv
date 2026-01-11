module T(
    input  logic [15:0] SW,
    output logic [15:0] LED
);
    // 直接把开关状态显示在LED上
    assign LED = SW; 
    
endmodule