`timescale 1ns / 1ps

module Mux32Bit3To1(A, B, C, out, sel);

input [31:0] A, B, C;
output reg [31:0] out;
input [1:0] sel;

initial begin
    out <= 0;
end    
always @(*) begin
if (sel == 0) begin
    out <= A;
end
else if (sel == 1) begin
    out <= B;
end
else if (sel == 2) begin
    out <= C;
end       
end

endmodule