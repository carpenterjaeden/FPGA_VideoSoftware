`timescale 1ns / 1ps

module BranchCheck(rs, rt, rsgz, tes, rsez);   
//                       rs > 0, rt = rs, rs == 0

input signed [31:0] rs, rt;
output reg rsgz, tes, rsez;
// check equality
initial begin
    rsgz <= 0;
    rsez <= 0;
    tes <= 0;
end

always@(*) begin
    if (rs == rt)       // rs = rt
        tes <= 1;
    else
        tes <= 0;    

    if (rs > 0)         // rs > 0
        rsgz <= 1;
    else
        rsgz <= 0;

    if (rs == 0)        // rs = 0
        rsez <= 1;
    else
        rsez <= 0;
end

endmodule