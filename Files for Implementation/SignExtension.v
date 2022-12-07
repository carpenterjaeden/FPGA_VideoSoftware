`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// ECE369 - Computer Architecture
// 
// Module - SignExtension.v
// Description - Sign extension module.
////////////////////////////////////////////////////////////////////////////////
module SignExtension(in, out);

    /* A 16-Bit input word */
    input [15:0] in;
    
    /* A 32-Bit output word */
    output reg [31:0] out;

    initial begin
        out <= 0; // initialize output to 0
    end

    always @(*) begin

    if (in[15] == 1)
        out <= {16'b1111111111111111, in}; // append 1s to represent 0s in 2s comp
    else
        out <= {16'b0000000000000000, in}; 

    end 

endmodule

