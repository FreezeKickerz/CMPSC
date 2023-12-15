`timescale 1ns / 1ps

module FwdBMux(qb, r, mr, do, select, fwdB);
    input[31:0] qb;
    input[31:0] r;
    input[31:0] mr;
    input[31:0] do;
    input[1:0] select;
    output fwdB;
    reg[31:0] fwdB;
    
    always @(*) begin
        if(select == 2'b00) begin
            fwdB = qb;
        end
        else if(select == 2'b01) begin
            fwdB = r;
        end
        else if(select == 2'b10) begin
            fwdB = mr;
        end
        else if(select == 2'b11) begin
            fwdB = do;
        end
    end
endmodule