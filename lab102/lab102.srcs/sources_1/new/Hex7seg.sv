module Hex7seg(input logic [1:0] digit,
               output logic [6:0] a2g
               );
    always_comb
        case(digit)
        'h0: a2g = 7'b0011100;
        'h1: a2g = 7'b1100010;
        default: a2g = 7'b1111111; 
    endcase
endmodule