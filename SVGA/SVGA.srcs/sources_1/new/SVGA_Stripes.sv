module SVGA_Stripes(
    input  logic displayOn,
    input  logic [10:0] xPixel, yPixel,
    output logic [3:0]  red, green, blue );

   logic r = ((xPixel&7)==0) || ((yPixel&7)==0); 
   logic g = yPixel[4]; 
   logic b = xPixel[4];
           
    always @(*)
    begin
        red   = 0;
        green = 0;
        blue  = 0;
        
        if(displayOn == 1)
        begin
            red   =  {yPixel[4], yPixel[4], yPixel[4], yPixel[4]};
            green = ~{yPixel[4], yPixel[4], yPixel[4], yPixel[4]};
           red   =  {xPixel[4], xPixel[4], xPixel[4], xPixel[4]};
           green = ~{xPixel[4], xPixel[4], xPixel[4], xPixel[4]};
           red   = {r, r, r, r};
           green = {g, g, g, g};
           blue  = {b, b, b, b};
        end
    end
endmodule