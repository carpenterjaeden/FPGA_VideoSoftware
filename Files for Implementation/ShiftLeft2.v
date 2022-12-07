`timescale 1ns / 1ps

module ShiftLeft2(A, Out);

input [31:0] A;

output reg [31:0] Out;

initial begin

Out <= 0;

end

always @(*) begin

Out <= A << 2;

end

endmodule