`timescale 1ns / 1ps

module EXEMEMPipelineRegister(clk, ewreg, em2reg, ewmem, edestReg, r, eqb, mwreg, mm2reg, 
    mwmem, mdestReg, mr, mqb);
    input clk;
    input ewreg;
    input em2reg;
    input ewmem;
    input[4:0] edestReg;
    input[31:0] r;
    input[31:0] eqb;
    
    output mwreg;
    output mm2reg;
    output mwmem;
    output[4:0] mdestReg;
    output[31:0] mr;
    output[31:0] mqb;
    reg mwreg;
    reg mm2reg;
    reg mwmem;
    reg[4:0] mdestReg;
    reg[31:0] mr;
    reg[31:0] mqb;
    
   always @(posedge clk) begin
        mwreg = ewreg;
        mm2reg = em2reg;
        mwmem = ewmem;
        mdestReg = edestReg;
        mr = r;
        mqb = eqb;
    end
    
endmodule
