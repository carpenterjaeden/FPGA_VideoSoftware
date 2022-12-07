`timescale 1ns / 1ps

module MEM_WB_Reg(ReadData_MEM, ReadData_WB, ALUResult_MEM, ALUResult_WB, 
                  MemToReg_MEM, MemToReg_WB, RegWrite_MEM, RegWrite_WB,
                  RegDst1Result_MEM, RegDst1Result_WB, jal_MEM, jal_WB, Jump_MEM, Jump_WB, JR_MEM, JR_WB, Clk, Reset);

input Reset;
input Clk;
input MemToReg_MEM, RegWrite_MEM, jal_MEM, Jump_MEM, JR_MEM; // control signals
input [4:0] RegDst1Result_MEM;
input [31:0] ReadData_MEM, ALUResult_MEM;

output reg MemToReg_WB, RegWrite_WB, jal_WB, Jump_WB, JR_WB;
output reg [4:0] RegDst1Result_WB;
output reg [31:0] ReadData_WB, ALUResult_WB;

initial begin

    ReadData_WB <= 0;
    ALUResult_WB <= 0;
    MemToReg_WB <= 0;
    RegWrite_WB <= 0;
    RegDst1Result_WB <= 0;

end

always @(posedge Clk) begin
    if (Reset == 1)begin
    ReadData_WB <= 0;
    ALUResult_WB <= 0;
    MemToReg_WB <= 0;
    RegWrite_WB <= 0;
    RegDst1Result_WB <= 0;
    jal_WB <= 0;
    Jump_WB <= 0;
    JR_WB <= 0;
    end
    else begin
    ReadData_WB <= ReadData_MEM;
    ALUResult_WB <= ALUResult_MEM;
    MemToReg_WB <= MemToReg_MEM;
    RegWrite_WB <= RegWrite_MEM;
    RegDst1Result_WB <= RegDst1Result_MEM;
    jal_WB <= jal_MEM;
    Jump_WB <= Jump_MEM;
    JR_WB <= JR_MEM;
    end
end



endmodule