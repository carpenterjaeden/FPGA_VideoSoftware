`timescale 1ns / 1ps

module ForwardingUnit(EX_MEM_RegWrite, EX_MEM_rd, MEM_WB_RegWrite, MEM_WB_rd, ID_EX_rs, ID_EX_rt, ALU_input_rs, ALU_input_rt, WriteMEMData_Signal);

    input EX_MEM_RegWrite, MEM_WB_RegWrite;
    input [4:0] EX_MEM_rd, MEM_WB_rd;
    input [4:0] ID_EX_rs, ID_EX_rt;
    output reg [1:0] WriteMEMData_Signal;
    output reg [1:0] ALU_input_rs, ALU_input_rt;
    // MUX SIGNAL KEY:
    // 0 --> value from ID_EX pipeline register
    // 1 --> forwarding from Memory
    // 2 --> forwarding from WriteBack


    initial begin
            ALU_input_rs <= 0;
            ALU_input_rt <= 0;
            WriteMEMData_Signal <= 0;
    end
        always @(*)begin
        if (ID_EX_rs == EX_MEM_rd && EX_MEM_RegWrite == 1 && ID_EX_rt != MEM_WB_rd /* && MEM_WB_RegWrite == 0 */ &&
                                                             ID_EX_rt != EX_MEM_rd)
        begin
            ALU_input_rs <= 1;
            ALU_input_rt <= 0;
            WriteMEMData_Signal <= 0;
        end
        // rs from EX_MEM   rt is default

        else if (ID_EX_rs == EX_MEM_rd && EX_MEM_RegWrite == 1 && ID_EX_rt == EX_MEM_rd && MEM_WB_RegWrite == 1)
        begin
            ALU_input_rs <= 1;
            ALU_input_rt <= 1;
            WriteMEMData_Signal <= 1;
        end
        // rs from EX_MEM   rt from EX_MEM

        else if (ID_EX_rs == EX_MEM_rd && EX_MEM_RegWrite == 1 && ID_EX_rt == MEM_WB_rd && MEM_WB_RegWrite == 1)
        begin
            ALU_input_rs <= 1;
            ALU_input_rt <= 2;
            WriteMEMData_Signal <= 2;
        end
        //Fix for lab7
        // else if (ID_EX_rs == EX_MEM_rd && EX_MEM_RegWrite == 1 && ID_EX_rs == MEM_WB_rd && MEM_WB_RegWrite == 1)
        // begin
        //     ALU_input_rs <= 1;
        //     ALU_input_rt <= 0;
        //     WriteMEMData_Signal <= 0;
        // end
        // rs from EX_MEM   rt from MEM_WB

        else if (ID_EX_rs == MEM_WB_rd && /* EX_MEM_RegWrite == 0 && */ ID_EX_rt != EX_MEM_rd && MEM_WB_RegWrite == 1 &&
                                                                   ID_EX_rt != MEM_WB_rd)
        begin
            ALU_input_rs <= 2;
            ALU_input_rt <= 0;
            WriteMEMData_Signal <= 0;
        end
        // rs from MEM_WB   rt is default

        else if (ID_EX_rs == MEM_WB_rd && EX_MEM_RegWrite == 1 && ID_EX_rt == EX_MEM_rd && MEM_WB_RegWrite == 1)
        begin
            ALU_input_rs <= 2;
            ALU_input_rt <= 1;
            WriteMEMData_Signal <= 1;
        end
        // rs from MEM_WB   rt from EX_MEM

        else if (ID_EX_rs == MEM_WB_rd  && EX_MEM_RegWrite == 1  && ID_EX_rt == MEM_WB_rd && MEM_WB_RegWrite == 1)
        begin
            ALU_input_rs <= 2;
            ALU_input_rt <= 2;
            WriteMEMData_Signal <= 2;
        end
        // rs from MEM_WB   rt from MEM_WB

        else if (ID_EX_rs != MEM_WB_rd /* && EX_MEM_RegWrite == 0 */ && ID_EX_rt != EX_MEM_rd /* && MEM_WB_RegWrite == 0 */ &&
            ID_EX_rs != EX_MEM_rd            &&                    ID_EX_rt != MEM_WB_rd)
        begin
            ALU_input_rs <= 0;
            ALU_input_rt <= 0;
            WriteMEMData_Signal <= 0;
        end
        // rs is default    rt is default

        else if (ID_EX_rs != MEM_WB_rd && EX_MEM_RegWrite == 1 && ID_EX_rt == EX_MEM_rd /* && MEM_WB_RegWrite == 0 */ &&
            ID_EX_rs != EX_MEM_rd)
        begin
            ALU_input_rs <= 0;
            ALU_input_rt <= 1;
            WriteMEMData_Signal <= 1;
        end
        // rs is default    rt from EX_MEM

        else if (ID_EX_rs != MEM_WB_rd /* && EX_MEM_RegWrite == 0 */ && ID_EX_rt == MEM_WB_rd && MEM_WB_RegWrite == 1 &&
            ID_EX_rs != EX_MEM_rd)
        begin
            ALU_input_rs <= 0;
            ALU_input_rt <= 2;
            WriteMEMData_Signal <= 2;
        end
        else begin
            ALU_input_rs <= 0;
            ALU_input_rt <= 0;
            WriteMEMData_Signal <= 0;
        end
        // rs is default    rt from MEM_WB
    end



endmodule