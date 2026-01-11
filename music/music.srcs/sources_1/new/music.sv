module music(              // ????????
    input  logic clk,
    output logic audioData,// Open-drain output
    output logic audioSD); // Analog filter ShutDown input  
    
    assign audioSD = 1;   // ??????
           
    localparam MEM_SIZE = 106353; //???????    
    logic [16:0] address; // 2^17=131,072 > 106,353     
    logic [7:0] value;    // ???????(8¦Ë:0-255)
    logic clk2048kHz;     // 1k=1000
    
    clk2MHz C2(clk, clk2048kHz);
    
    SuperMario M1(.clka(clk),     // ?????
                  .addra(address),// input [16:0]
                  .douta(value) );// output -8¦Ë???? 

    logic [7:0] counter = 0; 
    // 8kHz * 256 steps = 2,048kHz
    always @(posedge clk2048kHz) 
    begin
        counter <= counter + 1;
        
        audioData <= (counter < value); 
      
        if (counter == (256 - 1))    // 8kHz
        begin
            address <= address + 1;  
            // ?????????????0
            if (address == MEM_SIZE) address <= 0;
        end
    end
endmodule