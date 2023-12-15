`timescale 1ns / 1ps

module PCAdder(pc, nextPc);
    input [31:0]pc;
    output [31:0]nextPc;
    reg[31:0] nextPc;
    
    always @(*) begin
        nextPc = pc + 4;
    end
endmodule
