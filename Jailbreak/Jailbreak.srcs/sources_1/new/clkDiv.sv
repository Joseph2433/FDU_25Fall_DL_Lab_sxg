module clkDiv(
    input  logic clk, clr,
    output logic clk25MHz,
    output logic clk60Hz
);
    //25MHz
    logic [1:0] count25;
    always_ff @(posedge clk, posedge clr) begin
        if (clr) count25 <= 0;
        else count25 <= count25 + 1;
    end
    assign clk25MHz = count25[1]; 

    //60Hz
    logic [20:0] count60;
    always_ff @(posedge clk, posedge clr) begin
        if (clr) begin
            count60 <= 0;
            clk60Hz <= 0;
        end else if (count60 == 833333) begin 
            count60 <= 0;
            clk60Hz <= ~clk60Hz;
        end else begin
            count60 <= count60 + 1;
        end
    end
endmodule