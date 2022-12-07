`timescale 1ns / 1ps

module IF_ID_Reg(PCAddResult_IF, Instruction_IF, PCAddResult_ID, Instruction_ID, IF_Flush, IF_ID_Write, Clk, Reset); //ADDED SIGNAL

input [31:0] Instruction_IF, PCAddResult_IF;
input IF_Flush, IF_ID_Write;

output reg [31:0] Instruction_ID, PCAddResult_ID;

input Reset;
input Clk;  // each pipeline register should be clocked

 initial begin
     PCAddResult_ID <= 0;
     Instruction_ID <= 0;
 end

always @(posedge Clk) begin
    if (IF_ID_Write) begin
    if (Reset == 1 || IF_Flush == 1)begin
    PCAddResult_ID <= 0;
    Instruction_ID <= 0;
    end
    else begin
    PCAddResult_ID <= PCAddResult_IF;
    Instruction_ID <= Instruction_IF;
    end
    end
end

endmodule
