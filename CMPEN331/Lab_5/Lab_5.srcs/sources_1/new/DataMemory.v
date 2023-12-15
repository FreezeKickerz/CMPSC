`timescale 1ns / 1ps

module DataMemory(clk, mr, mqb, mwmem, mdo);
    input clk;
    input[31:0] mr;
    input[31:0] mqb;
    input mwmem;
    
    output[31:0] mdo;
    reg[31:0] mdo;
    
    reg[31:0] dataMemory [63:0];
    //Assign Values to data memory
    initial begin
        dataMemory[0] = 32'ha00000aa;
        dataMemory[1] = 32'h10000011;
        dataMemory[2] = 32'h20000022;
        dataMemory[3] = 32'h30000033;
        dataMemory[4] = 32'h40000044;
        dataMemory[5] = 32'h50000055;
        dataMemory[6] = 32'h60000066;
        dataMemory[7] = 32'h70000077;
        dataMemory[8] = 32'h80000088;
        dataMemory[9] = 32'h90000099;
    end
    
    always @(*)begin
        //Read memory
        mdo = dataMemory[mr];
    end
     
    always @(negedge clk)begin
        //Write to memory
        if(mwmem == 1) begin
            dataMemory[mr] = mqb;
        end
    end
endmodule
