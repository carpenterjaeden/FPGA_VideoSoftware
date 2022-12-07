`timescale 1ns / 1ps

module Adder32Bit(A, B, Out);

input [31:0] A, B;

output reg [31:0] Out;

initial begin

Out <= 0;

end

always @(*) begin

Out <= A + B;

end

endmodule