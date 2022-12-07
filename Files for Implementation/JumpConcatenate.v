`timescale 1ns / 1ps

module JumpConcatenate(Instruction, PC, JumpPC); // we need JumpPC control signal for a mux, 1 if we are jumping (read from opcode) and 0 if we are not jumping

input [25:0] Instruction;
input [31:28] PC;     
output reg [31:0] JumpPC;

initial begin

JumpPC <= 0;

end

always @(*) begin

JumpPC <= {PC, Instruction, 2'b00}; // 4 high order PC bits, target, then two 0s

end

endmodule

