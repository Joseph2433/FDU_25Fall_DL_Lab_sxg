module clkDiv(
    input  logic clk,
    input  logic clr,
    output logic clk50MHz );
    
    logic  q;  //reg
    // 1-bit counter
    always @(posedge clk, posedge clr)
        if(clr==1) q <= 0;
        else       q <= q + 1;

    assign clk50MHz = q; //100/2 = 50
endmodule