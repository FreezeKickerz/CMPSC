`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2023 04:29:41 PM
// Design Name: 
// Module Name: IDEXE_Pipeline_Register
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


module IDEXE_Pipeline_Register(wreg, m2reg, wmem, aluc, aluimm, destReg, qa, qb, imm32, clk,
    ewreg, em2reg, ewmem, ealuc, ealuimm, edestReg, eqa, eqb, eimm32);
  
    input wreg;
    input m2reg;
    input wmem;
    input[3:0] aluc;
    input aluimm;
    input[4:0] destReg;
    input[31:0] qa;
    input[31:0] qb;
    input[31:0] imm32;
    input clk;
    
    output ewreg;
    output em2reg;
    output ewmem;
    output[3:0] ealuc;
    output ealuimm;
    output[4:0] edestReg;
    output[31:0] eqa;
    output[31:0] eqb;
    output[31:0] eimm32;
    reg ewreg;
    reg em2reg;
    reg ewmem;
    reg[3:0] ealuc;
    reg ealuimm;
    reg[4:0] edestReg;
    reg[31:0] eqa;
    reg[31:0] eqb;
    reg[31:0] eimm32;
    
    always @(posedge clk) begin
        ewreg = wreg;
        em2reg = m2reg;
        ewmem = wmem;
        ealuc = aluc;
        ealuimm = aluimm;
        edestReg = destReg;
        eqa = qa;
        eqb = qb;
        eimm32 = imm32;
    end
endmodule