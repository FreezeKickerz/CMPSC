`timescale 1ns / 1ps

module MEMWBPipelineRegister(clk, mwreg, mm2reg, mdestReg, mr, mdo, wwreg, wm2reg, wdestReg, wr, wdo);
    input clk;
    input mwreg;
    input mm2reg;
    input[4:0] mdestReg;
    input[31:0] mr;
    input[31:0] mdo;
    
    output wwreg;
    output wm2reg;
    output[4:0] wdestReg;
    output[31:0] wr;
    output[31:0] wdo;
    reg wwreg;
    reg wm2reg;
    reg[4:0] wdestReg;
    reg[31:0] wr;
    reg[31:0] wdo;
    
    always @(posedge clk) begin
        wwreg = mwreg;
        wm2reg = mm2reg;
        wdestReg = mdestReg;
        wr = mr;
        wdo = mdo;
    end  
endmodule
