`timescale 1ns / 1ps

module Datapath(clk, pc, dinstOut, ewreg, em2reg , ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32,
    b, r, mwreg, mm2reg, mwmem, mdestReg, mr, mqb, mdo, wwreg, wm2reg, wdestReg, wr, wdo, wbData);
    input clk;
    output wire[31:0] pc;
    wire[31:0] next_pc;
    wire[31:0] instOut;
    output wire[31:0] dinstOut;
    wire wreg;
    wire m2reg;
    wire wmem;
    wire[3:0] aluc;
    wire aluimm;
    wire regrt;
    wire[4:0] destReg;
    wire[31:0] qa;
    wire[31:0] qb;
    wire[31:0] imm32;
    
    //ID/EXE OUT
    output wire ewreg;
    output wire em2reg;
    output wire ewmem;
    output wire[3:0] ealuc;
    output wire ealuimm;
    output wire[4:0] edestReg;
    output wire[31:0] eqa;
    output wire[31:0] eqb;
    output wire[31:0] eimm32;
    
    //EXE OUT
    output wire[31:0] b;
    output wire[31:0] r;
    
    //EXE/MEM OUT
    output wire mwreg;
    output wire mm2reg;
    output wire mwmem;
    output wire[4:0] mdestReg;
    output wire[31:0] mr;
    output wire[31:0] mqb;
    
    //MEM OUT
    output wire[31:0] mdo;
    output wire wwreg;
    output wire wm2reg;
    output wire[4:0] wdestReg;
    output wire[31:0] wr;
    output wire[31:0] wdo;
    
    //WB
    output wire[31:0] wbData;
    
    wire wpcir;
    wire[1:0] fwda;
    wire[1:0] fwdb;
    wire[31:0] muxaOut;
    wire[31:0] muxbOut;
    
    PCAdder pcAdder(pc, next_pc);
    
    ProgramCounter programCounter(next_pc, clk, wpcir, pc);
    
    InstructionMemory instructionMemory(pc, instOut);
    
    IFIDPipelineRegister ifIdPipelineRegister(instOut, clk, wpcir, dinstOut);
    
    ControlUnit controlUnit(dinstOut[31:26], dinstOut[5:0], wreg, m2reg, wmem, aluc, aluimm, regrt, 
        dinstOut[25:21], dinstOut[20:16], ewreg, em2reg, edestReg, mwreg, mm2reg, mdestReg, fwda, fwdb);
    
    RegRTMux regRTMux(dinstOut[20:16], dinstOut[15:11], regrt, destReg);
    
    RegisterFile registerFile(dinstOut[25:21], dinstOut[20:16], wdestReg, wbData, wwreg, clk, qa, qb);
    
    FwdAMux fwdaMux(qa, r, mr, so, fwda, muxaOut);
    
    FwdBMux fwdbMux(qb, r, mr, so, fwdb, muxbOut);
    
    ImmediateExtender immediateExtender(dinstOut[15:0],imm32);
    
    IDEXEPipelineRegister idExePipelineRegister(wreg, m2reg, wmem, aluc, aluimm, destReg, muxaOut, muxbOut, imm32, clk,
        ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32);
        
    ALUMultiplexer aluMultiplexer(ealuimm, eqb, eimm32, b);
    
    ALU alu(eqa, b, ealuc, r);
    
    EXEMEMPipelineRegister exeMemPipelineRegister(clk, ewreg, em2reg, ewmem, edestReg, r, eqb, mwreg, mm2reg, 
        mwmem, mdestReg, mr, mqb);
    
    DataMemory dataMemory(clk, mr, mqb, mwmem, mdo);
    
    MEMWBPipelineRegister memWbPipelineRegister(clk, mwreg, mm2reg, mdestReg, mr, mdo, wwreg, wm2reg,
        wdestReg, wr, wdo);
        
    WBMultiplexer wbMultiplexer(wr, wdo, wm2reg, wbData);
    
endmodule