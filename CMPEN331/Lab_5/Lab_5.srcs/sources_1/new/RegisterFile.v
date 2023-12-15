`timescale 1ns / 1ps

module RegisterFile(rs, rt, wdestReg, wbData, wwreg, clk, qa, qb);
    input[4:0] rs;
    input[4:0] rt;
    input[4:0] wdestReg;
    input[31:0] wbData;
    input wwreg;
    input clk;
    output[31:0] qa;
    output[31:0] qb;
    reg[31:0] qa;
    reg[31:0] qb;

    reg[31:0] registers[31:0];
    
    integer r;
    initial begin
        for (r = 0; r <= 31; r = r + 1) begin
            registers[r] = 0;
        end
        registers[0] = 32'h00000000;
        registers[1] = 32'ha00000aa;
        registers[2] = 32'h10000011;
        registers[3] = 32'h20000022;
        registers[4] = 32'h30000033;
        registers[5] = 32'h40000044;
        registers[6] = 32'h50000055;
        registers[7] = 32'h60000066;
        registers[8] = 32'h70000077;
        registers[9] = 32'h80000088;
        registers[10] = 32'h90000099;
    end
    
    always @(*) begin
        qa = registers[rs];
        qb = registers[rt];
    end
    
    always @(negedge clk) begin
        if (wwreg == 1) begin
            registers[wdestReg] = wbData;
        end
    end
endmodule