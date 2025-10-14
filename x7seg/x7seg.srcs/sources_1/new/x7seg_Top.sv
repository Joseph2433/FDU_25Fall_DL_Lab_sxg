module x7seg_Top(
    input  logic       CLK100MHZ,
    input  logic [15:0] SW,
    output logic [6:0] A2G,
    output logic [7:0] AN,
    output logic       DP );
    
    logic [15:0] x;
    assign x = 'h0147; //test value

    x7seg X7(.data1(SW),
             .data2(x),
             .clk (CLK100MHZ),
             .a2g (A2G),
             .an  (AN),
             .dp  (DP) );
endmodule