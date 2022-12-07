`timescale 1ns / 1ps

module BranchPredict(Clk, Reset, isBranch, Branch, Prediction);

input Clk, Reset;

input isBranch, Branch;

output reg Prediction; // 0 is Taken, 1 is Not Taken

parameter T = 0, NT = 1;

reg [1:0] State, StateNext;

initial begin
    State <= T;
    StateNext <= T;
end

always @(State, isBranch) begin
    case (State)
    T: begin
        Prediction <= 1;
        if (isBranch == 1 && Branch == 1) begin
            StateNext <= T;
        end
        else begin
            StateNext <= NT;
        end
    end
    NT: begin
        Prediction <= 0;
        if (isBranch == 1 && Branch == 1) begin
            StateNext <= T;
        end
        else begin
            StateNext <= NT;
        end
    end
    endcase

end

always @(posedge Clk) begin
    if (Reset == 1)
        State <= T;
    else
        State <= StateNext;
end


endmodule