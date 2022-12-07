`timescale 1ns / 1ps

// input ALUResult, Zero flag, output of RegDst Mux, Rt_register_value from readdata2, PCPlusOffset
// need branch, MemWrite, MemToReg, MemRead, PCSrc(?)

module EX_MEM_Reg(ALUResult_EX, /*PCPlusOffset_EX,*/ rt_Register_Value_EX,
 RegDst1Result_EX, /*Zero_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, /*Branch_EX,*/ RegWrite_EX, jal_EX, Jump_EX, JR_EX, JumpPC_EX, rs_value_EX,
 ALUResult_MEM, /*PCPlusOffset_MEM,*/ rt_Register_Value_MEM,
 RegDst1Result_MEM, /*Zero_MEM,*/ MemWrite_MEM, MemToReg_MEM, MemRead_MEM, /*Branch_MEM,*/ RegWrite_MEM, jal_MEM, Jump_MEM, JR_MEM, JumpPC_MEM, rs_value_MEM, Clk, Reset);

input Reset;
input Clk;
input /*Branch_EX,*/ MemToReg_EX, /*Zero_EX,*/ RegWrite_EX, jal_EX, Jump_EX, JR_EX; // control signals
input [1:0] MemRead_EX, MemWrite_EX;
input [4:0] RegDst1Result_EX;
input [31:0] ALUResult_EX, rt_Register_Value_EX, /*PCPlusOffset_EX,*/ JumpPC_EX, rs_value_EX;

output reg /*Branch_MEM,*/ MemToReg_MEM, /*Zero_MEM,*/ RegWrite_MEM;
output reg [1:0] MemRead_MEM, MemWrite_MEM;
output reg [4:0] RegDst1Result_MEM;
output reg [31:0] ALUResult_MEM, rt_Register_Value_MEM, /*PCPlusOffset_MEM,*/ JumpPC_MEM, rs_value_MEM;
output reg jal_MEM, Jump_MEM, JR_MEM;



 initial begin

    ALUResult_MEM <= 0;
  //  PCPlusOffset_MEM <= 0;
    rt_Register_Value_MEM <= 0;
    RegDst1Result_MEM <= 0;
  //  Zero_MEM <= 0;
    MemWrite_MEM <= 0;
    MemToReg_MEM <= 0;
    MemRead_MEM <= 0;
  //  Branch_MEM <= 0;
    RegWrite_MEM <= 0;

 end

always @(posedge Clk) begin
    if (Reset == 1)begin
            ALUResult_MEM <= 0;
   // PCPlusOffset_MEM <= 0;
    rt_Register_Value_MEM <= 0;
    RegDst1Result_MEM <= 0;
   // Zero_MEM <= 0;
    MemWrite_MEM <= 0;
    MemToReg_MEM <= 0;
    MemRead_MEM <= 0;
   // Branch_MEM <= 0;
    RegWrite_MEM <= 0;
    jal_MEM <= 0;
    Jump_MEM <= 0;
    JR_MEM <= 0;
    JumpPC_MEM <= 0;
    rs_value_MEM <= 0;
 end
 else begin
    ALUResult_MEM <= ALUResult_EX;
   // PCPlusOffset_MEM <= PCPlusOffset_EX;
    rt_Register_Value_MEM <= rt_Register_Value_EX;
    RegDst1Result_MEM <= RegDst1Result_EX;
   // Zero_MEM <= Zero_EX;
    MemWrite_MEM <= MemWrite_EX;
    MemToReg_MEM <= MemToReg_EX;
    MemRead_MEM <= MemRead_EX;
   // Branch_MEM <= Branch_EX;
    RegWrite_MEM <= RegWrite_EX;
    jal_MEM <= jal_EX;
    Jump_MEM <= Jump_EX;
    JR_MEM <= JR_EX;
    JumpPC_MEM <= JumpPC_EX;
    rs_value_MEM <= rs_value_EX;
 end

end

endmodule
