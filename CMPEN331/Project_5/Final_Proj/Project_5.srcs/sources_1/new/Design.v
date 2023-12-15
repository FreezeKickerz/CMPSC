`timescale 1ns / 1ps

module DataPath(
    input clk,
    output wire [31:0] pc, instOut, dinstOut,
    output wire ewreg, em2reg, ewmem, ealuimm,
    output wire [3:0] ealuc,
    output wire [4:0] edestReg,
    output wire [31:0] eqa, eqb, eimm32,
    
    output wire mwreg, mm2reg, mwmem,
    output wire [4:0] mdestReg,
    output wire [31:0] mr, mqb,

    output wire [4:0] ors, ort,
    
    output wire wwreg, wm2reg, 
    output wire [4:0] wdestReg,
    output wire [31:0] wr, wdo, wbData,
    
    output wire [1:0] fwa, fwb 
);
    wire [31:0] nextPc;
    PC pc_dp(nextPc, clk, pc);
    
    PCAdder pcadder_dp(pc, nextPc);

    InstructionMemory im_dp(pc, instOut);
    
    IFIDPipelineReg ifidreg_dp(instOut, clk, dinstOut);
    
    wire [5:0] op = dinstOut[31:26];
    wire [5:0] func = dinstOut[5:0];    
    wire wreg, m2reg, wmem, aluimm, regrt;
    wire [3:0] aluc;

    wire [4:0] rs = dinstOut[25:21];
    wire [4:0] rt = dinstOut[20:16];
    wire [4:0] rd = dinstOut[15:11];

    ControlUnit cu_dp(op, func, rs, rt, mdestReg, edestReg, mm2reg, mwreg, em2reg, ewreg, wreg, m2reg, wmem, aluimm, regrt, aluc, fwa, fwb, ors, ort);
    
      
    wire [31:0] qa;
    wire [31:0] qb;
    FwMux fwmuxa_dp(fqa, r, mr, mdo, fwa, qa);
    FwMux fwmuxb_dp(fqb, r, mr, mdo, fwb, qb);
    
    wire [15:0] imm = dinstOut[15:0];
    wire [31:0] imm32;
    ImmExtender immex_dp(imm, imm32);
    
    IDEXEPipelineReg idexereg_dp(clk, wreg, m2reg, wmem, aluimm, aluc, destReg, qa, qb, imm32, ewreg, em2reg, ewmem, ealuimm, ealuc, edestReg, eqa, eqb, eimm32);
    
    wire [31:0] b;
    ALUMux alumux_dp(eqb, eimm32, ealuimm, b);
    
    wire [31:0] r;
    ALU alu_dp(eqa, b, ealuc, r);
    
    EXEMEMPipelineReg exememreg_dp(clk, ewreg, em2reg, ewmem, edestReg, r, eqb, mwreg, mm2reg, mwmem, mdestReg, mr, mqb);
    
    wire [31:0] mdo;
    DataMemory datamem_dp(clk, mwmem, mr, mqb, mdo);
    
    MEMWBPipelineReg memwbreb_dp(clk, mwreg, mm2reg, mdestReg, mr, mdo, wwreg, wm2reg, wdestReg, wr, wdo);

    WbMux wbmux_dp(wr, wdo, wm2reg, wbData);

    wire [4:0] destReg;
    RegrtMux regrtmux_dp(rt, rd, regrt, destReg);

    wire [31:0] fqa;
    wire [31:0] fqb;
    RegFile rf_dp(clk, wwreg, rs, rt, wdestReg, wbData, fqa, fqb);
endmodule