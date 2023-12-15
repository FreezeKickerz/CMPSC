`timescale 1ns / 1ps

module IFIDPipelineRegister(instOut, clk, wpcir, dinstOut);
    input[31:0] instOut;
    input clk;
    input wpcir;
    output[31:0] dinstOut;
    reg[31:0] dinstOut;
    
    always @(posedge clk) begin
        if(1) begin
            dinstOut = instOut;
        end
    end
endmodule

