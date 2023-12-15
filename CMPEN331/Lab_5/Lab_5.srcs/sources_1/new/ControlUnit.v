`timescale 1ns / 1ps

module ControlUnit(op, func, wreg, m2reg, wmem, aluc, aluimm, regrt, rs, rt, ewreg, em2reg, ern, mwreg, mm2reg, mrn, fwda, fwdb, wpcir);
    input[5:0] op;
    input[5:0] func;
    output wreg;
    output m2reg;
    output wmem;
    output[3:0] aluc;
    output aluimm;
    output regrt;
    
    input[4:0] rs, rt;
    input ewreg;
    input em2reg;
    input[31:0] ern;
    input mwreg;
    input mm2reg;
    input[31:0] mrn;
    output fwda;
    output fwdb;
    output wpcir;
    
    reg wreg;
    reg m2reg;
    reg wmem;
    reg[3:0] aluc;
    reg aluimm;
    reg regrt;
    
    reg[31:0] fwda;
    reg[31:0] fwdb;
    reg wpcir;
    
    always @(*) begin
        fwda = 2'b00;
        fwdb = 2'b00;
        if(ewreg == 1'b1 & ern == rs) begin
            fwda = 2'b01;
        end
        if(ewreg == 1'b1 & ern == rt) begin
            fwdb = 2'b01;
        end
        if(mwreg == 1'b1 & mrn == rs & ern != rs) begin
            fwda = 2'b10;
        end
        if(mwreg == 1'b1 & mrn == rt & ern != rt) begin
            fwdb = 2'b10;
        end
        
        wpcir = 1'b1;
        
        case(op)
            6'b000000:
            begin
                case(func)
                    6'b100000:
                        begin
                            wreg = 1'b1;
                            m2reg = 1'b0;
                            wmem = 1'b0;
                            aluc = 4'b0010;
                            aluimm = 1'b0;
                            regrt = 1'b1;
                        end
                    6'b100010:
                        begin
                            wreg = 1'b1;
                            m2reg = 1'b0;
                            wmem = 1'b0;
                            aluc = 4'b0110;
                            aluimm = 1'b0;
                            regrt = 1'b1;
                        end
                    6'b100100:
                        begin
                            wreg = 1'b1;
                            m2reg = 1'b0;
                            wmem = 1'b0;
                            aluc = 4'b0000;
                            aluimm = 1'b0;
                            regrt = 1'b1;
                        end
                    6'b100101:
                        begin
                            wreg = 1'b1;
                            m2reg = 1'b0;
                            wmem = 1'b0;
                            aluc = 4'b0001;
                            aluimm = 1'b0;
                            regrt = 1'b1;
                        end
                    6'b100110:
                        begin
                            wreg = 1'b1;
                            m2reg = 1'b0;
                            wmem = 1'b0;
                            aluc = 4'b1111;
                            aluimm = 1'b0;
                            regrt = 1'b1;
                        end
                endcase
            end
            6'b100011:
                begin
                    wreg = 1'b1;
                    m2reg = 1'b1;
                    wmem = 1'b0;
                    aluc = 4'b0000;
                    aluimm = 1'b1;
                    regrt = 1'b0;
                end
            6'b101011:
                begin
                    wreg = 1'b0;
                    m2reg = 1'b0;
                    wmem = 1'b1;
                    aluc =  4'b0000;
                    aluimm = 1'b1;
                    regrt = 1'b0;
                end
        endcase
    end
endmodule 