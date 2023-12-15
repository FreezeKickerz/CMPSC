`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 04:53:10 PM
// Design Name: 
// Module Name: Datapath
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Datapath(
clk, 
pc, 
dinstOut, 
ewreg, 
em2reg, 
ewmem, 
ealuc, 
ealuimm, 
edestReg, 
eqa, 
eqb, 
eimm32,
b, 
r, 
mwreg, 
mm2reg, 
mwmem, 
mdestReg, 
mr, 
mqb, 
mdo, 
wwreg, 
wm2reg, 
wdestReg, 
wr, 
wdo
    );
    
    input clk;
    /*output[31:0] pc;
    output dinstOut;
    output ewreg;
    output em2reg;
    output ewmem;
    output[3:0] ealuc;
    output ealuimm;
    output[4:0] edestReg;
    output[31:0] eqa;
    output[31:0] eqb;
    output[31:0] eimm32;*/
    
    output wire[31:0] pc;
    wire[31:0] next_Pc;
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
  
  //Pipeline Reg  
    output wire ewreg;
    output wire em2reg;
    output wire ewmem;
    output wire[3:0] ealuc;
    output wire ealuimm;
    output wire[4:0] edestReg;
    output wire[31:0] eqa;
    output wire[31:0] eqb;
    output wire[31:0] eimm32;
    
    //EXE
    output wire[31:0] b;
    output wire[31:0] r;
    
    //EXE|MEM
    output wire mwreg;
    output wire mm2reg;
    output wire mwmem;
    output wire[4:0] mdestReg;
    output wire[31:0] mr;
    output wire[31:0] mqb;
    
    //Mem
    output wire[31:0] mdo;
    output wire wwreg;
    output wire wm2reg;
    output wire[4:0] wdestReg;
    output wire[31:0] wr;
    output wire[31:0] wdo;
        
    PC_Adder pcAdder(pc, next_Pc);
    IF_PC programCounter(next_Pc, clk, pc);
    Inst_mem instructionMemory(pc, instOut);
    IF_ID pipelineRegister(instOut, clk, dinstOut);
    ID_Control controlUnit(dinstOut[31:26], dinstOut[5:0], wreg, m2reg, wmem, aluc, aluimm, regrt);
    Regrt_Multiplexer regrtMultiplexer(dinstOut[20:16], dinstOut[15:11], regrt, destReg);
    Register_File registerFile(dinstOut[25:21], dinstOut[20:16], qa, qb);
    Immediate_Extender immediateExtender(dinstOut[15:0], imm32);
    IDEXE_Pipeline_Register idexePipelineRegister(wreg, m2reg, wmem, aluc, aluimm, destReg, qa, qb, imm32, clk, ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32);
    Alu_Mux ALU_Multiplexer(ealuimm, eqb, eimm32, b);    
    ALU Arithmetic_Logic_Unit(eqa, b, ealuc, r);
    EXEMEM_Pipeline_Register EXEMEMPipelineRegister(clk, ewreg, em2reg, ewmem, edestReg, r, eqb, mwreg, mm2reg, 
        mwmem, mdestReg, mr, mqb);
    Data_Memory DataMemory(clk, mr, mqb, mwmem, mdo);
    MEMWB_Pipeline_Register MEMWBPipelineRegister(clk, mwreg, mm2reg, mdestReg, mr, mdo, wwreg, wm2reg,
        wdestReg, wr, wdo);    
endmodule
    