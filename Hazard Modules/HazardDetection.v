`timescale 1ns / 1ps

module HazardDetection(RegDst_MUX,RegDst1Result_MEM, MemRead_EX, MemRead_MEM, branch, jump, IF_Flush, rs_address_ID, rt_address_ID , PC_Write, IF_ID_Write, ControlMuxSig, 
                        isBranch, RegWrite_EX, RegWrite_WB, RegDst1Result_WB, jal/*, RegWrite_MEM */,jal_Control);

    input [4:0] RegDst_MUX, RegDst1Result_MEM,
                rs_address_ID, rt_address_ID;
    input MemRead_EX, MemRead_MEM, branch, jump, isBranch, RegWrite_EX; //branch means a branch is happening, isBranch means there is a branch instruction
    input jal;//, RegWrite_MEM; //jal
    input RegWrite_WB; //Used for writeback to ID dependency
    input [4:0] RegDst1Result_WB; //Used for writeback to ID dependency

    output reg PC_Write, IF_ID_Write, ControlMuxSig, IF_Flush, jal_Control;

    initial begin

    PC_Write <= 1;
    IF_ID_Write <= 1;
    ControlMuxSig <= 1;
    IF_Flush <= 0;

    end

    always @(*) begin

        //inefficient stalling with dependency in wb
        if (((RegDst1Result_WB == rs_address_ID) || (RegDst1Result_WB == rt_address_ID)) && RegWrite_WB) begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 0;
                PC_Write <= 0;
                IF_Flush <= 0;
                jal_Control <= 0;
        end
        // lw stall logic
        else if (MemRead_EX) begin
            if ((RegDst_MUX == rs_address_ID) || (RegDst_MUX == rt_address_ID)) begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 0;
                PC_Write <= 0;
                IF_Flush <= 0;
                jal_Control <= 0;
                // Stall PC and IF/ID pipeline

                //
            end
            else begin
                ControlMuxSig <= 1;
                IF_ID_Write <= 1;
                PC_Write <= 1;
                IF_Flush <= 0;
                jal_Control <= 0;
            end

        end
        else if (isBranch) begin
            if (((RegDst1Result_MEM == rs_address_ID) || (RegDst1Result_MEM == rt_address_ID)) && MemRead_MEM)begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 0;
                PC_Write <= 0;
                IF_Flush <= 0;
                jal_Control <= 0;
            end
            else if (((RegDst_MUX == rs_address_ID) || (RegDst_MUX == rt_address_ID)) && RegWrite_EX) begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 0;
                PC_Write <= 0;
                IF_Flush <= 0;
                jal_Control <= 0;
                // Stall PC and IF/ID pipeline

                //
            end
            else if (branch) begin

                ControlMuxSig <= 0;
                IF_ID_Write <= 1;
                PC_Write <= 1;
                IF_Flush <= 1;
                jal_Control <= 0;

            end
            else begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 1;
                PC_Write <= 1;
                IF_Flush <= 0;
                jal_Control <= 0;
            end
        end

        else if (branch) begin //this is the case for jumps
        if (RegWrite_EX) begin
            ControlMuxSig <= 0;
                IF_ID_Write <= 0;
                PC_Write <= 0;
                IF_Flush <= 0;
                jal_Control <= 0;
        end
        else if (jal && (RegWrite_WB)) begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 0;
                PC_Write <= 0;
                IF_Flush <= 0;
                jal_Control <= 0;
                end
        else if (jal && !RegWrite_WB)begin
            ControlMuxSig <= 0;
                IF_ID_Write <= 1;
                PC_Write <= 1;
                IF_Flush <= 1;
                jal_Control <= 1;
        end
        else begin
                ControlMuxSig <= 0;
                IF_ID_Write <= 1;
                PC_Write <= 1;
                IF_Flush <= 1;
                jal_Control <= 0;
        end
        end
        else begin
                ControlMuxSig <= 1;
                IF_ID_Write <= 1;
                PC_Write <= 1;
                IF_Flush <= 0;
                jal_Control <= 0;
        end
    end
        

endmodule