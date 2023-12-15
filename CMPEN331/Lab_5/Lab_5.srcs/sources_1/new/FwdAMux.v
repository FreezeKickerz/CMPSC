`timescale 1ns / 1ps

module FwdAMux(qa, r, mr, do, select, fwdA);
    input[31:0] qa;
    input[31:0] r;
    input[31:0] mr;
    input[31:0] do;
    input[1:0] select;
    output fwdA;
    reg[31:0] fwdA;
    
    always @(*) begin
        if(select == 2'b00) begin
            fwdA = qa;
        end
        else if(select == 2'b01) begin
            fwdA = r;
        end
        else if(select == 2'b10) begin
            fwdA = mr;
        end
        else if(select == 2'b11) begin
            fwdA = do;
        end
    end
endmodule