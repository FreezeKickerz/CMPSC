`timescale 1ns / 1ps

module testbench();
    reg clk_tb;
    initial clk_tb = 1'b0;
    
    wire [31:0] pc, instOut, dinstOut;
    wire ewreg, em2reg, ewmem, ealuimm;
    wire [3:0] ealuc;
    wire [4:0] edestReg;
    wire [31:0] eqa, eqb, eimm32;
    
    wire mwreg, mm2reg, mwmem;
    wire [4:0] mdestReg;
    wire [31:0] mr, mqb;

    wire [4:0] ors, ort;
    
    wire wwreg, wm2reg;
    wire [4:0] wdestReg;
    wire [31:0] wr, wdo, wbData;
    
    wire [1:0] fwa, fwb;
    
    DataPath dp_tb (
        clk_tb,
        
        pc, instOut, dinstOut,
        ewreg, em2reg, ewmem, ealuimm,
        ealuc,
        edestReg,
        eqa, eqb, eimm32,
            
        mwreg, mm2reg, mwmem,
        mdestReg,
        mr, mqb,

        ors, ort,
            
        wwreg, wm2reg,
        wdestReg,
        wr, wdo, wbData,
        
        fwa, fwb
    );
    
    always
    begin
        #5
        clk_tb = ~clk_tb;
    end
endmodule