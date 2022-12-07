module Mux5Bit2To1(out, inA, inB, sel);

    output reg [4:0] out;
    
    input [4:0] inA;
    input [4:0] inB;
    input sel;

    initial begin
    out <= 0;
    end

    always @(*) begin
    if (sel == 0)
        out <= inA;
    else   
        out <= inB;

    end
endmodule
