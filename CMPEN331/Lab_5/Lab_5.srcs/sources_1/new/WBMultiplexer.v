`timescale 1ns / 1ps

module WBMultiplexer(wr, wdo, wm2reg, wbData);
    input[31:0] wr;
    input[31:0] wdo;
    input wm2reg;
    output reg[31:0] wbData;
    
    always @(*) begin
        if(wm2reg == 0) begin
            wbData = wr;
        end
        else begin
            wbData = wdo;
        end
    end
endmodule
