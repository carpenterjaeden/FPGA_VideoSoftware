`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Team Members: Malcolm Hayes, Sam Kerns, Jaeden Carpenter
// Overall percent effort of each team meber: 33% each 
// 
// ECE369A - Computer Architecture
//  THIS SHOULD NOT BE SET AS TOP FILE, SET Top_Board AS TOP FILE!!!!!!!!!!!!!!!!!!
//  THIS SHOULD NOT BE SET AS TOP FILE, SET Top_Board AS TOP FILE!!!!!!!!!!!!!!!!!!

module Top(Clk, Reset, v0_Out, v1_Out);

    output wire [31:0] v0_Out, v1_Out;
    // reg [31:0] v0, v1;
(* mark_debug = "true" *) input Clk, Reset;
    // To PCSrc mux
   (* mark_debug = "true" *) wire PCSrc;  // output of Branch AndGate
    // To EX Adder of PC+ShiftLeft2 Immediate
   (* mark_debug = "true" *) wire [31:0] ShiftLeft2Out_ID;

   (* mark_debug = "true" *) wire jal_EX, jal_MEM, jal_WB, Jump_EX, Jump_MEM, Jump_WB, JR_EX, JR_MEM, JR_WB, jal_Control; // pipeline jal to prevent errors
   (* mark_debug = "true" *) wire [31:0] JumpPC_EX, JumpPC_MEM, rs_value_MEM;
   (* mark_debug = "true" *) wire rsgz, tes, rsez;
// InstructionFetch and PC
   (* mark_debug = "true" *) wire [31:0] PCAddResult;
   (* mark_debug = "true" *) wire [31:0] PCResult; //output
   (* mark_debug = "true" *) wire [31:0] Instruction;
   (* mark_debug = "true" *) wire PC_Write;
// PCPlusOffset
   (* mark_debug = "true" *) wire [31:0] PCPlusOffset_ID;
// Control Signals
   (* mark_debug = "true" *) wire RegWrite, RegDst, ALUSrc, Branch, MemToReg;
   (* mark_debug = "true" *) wire [3:0] ALUOp;
   (* mark_debug = "true" *) wire [1:0] MemWrite, MemRead;
   (* mark_debug = "true" *) wire jal_RA;
   (* mark_debug = "true" *) wire RegWrite_WB;
   (* mark_debug = "true" *) wire rs_MUX, rt_MUX; //controls MUX for branch check unit inputs
   (* mark_debug = "true" *) wire isBranch; //hazard detection for branch
//   (* mark_debug = "true" *) wire Zero;
   (* mark_debug = "true" *) wire jump, jr;  
// Mux output Wires
   (* mark_debug = "true" *) wire [31:0] PCSrc_Result_MUX;
   (* mark_debug = "true" *) wire [31:0] jump_Result_MUX;
   (* mark_debug = "true" *) wire [31:0] jr_Result_MUX;
   (* mark_debug = "true" *) wire [4:0] WriteReg_MUX;
   (* mark_debug = "true" *) wire [31:0] WriteData_MUX; //output
   (* mark_debug = "true" *) wire [31:0] ALUSrc_MUX;
   (* mark_debug = "true" *) wire [4:0] RegDst_MUX;
   (* mark_debug = "true" *) wire [31:0] MemToReg_WB_MUX;
   (* mark_debug = "true" *) wire [31:0] BranchCheckMUX_rs, BranchCheckMUX_rt; //output of mux, input of branch check unit

// Pipeline Register Wires:
    // IF_ID output
        //To RegisterFile
   (* mark_debug = "true" *) wire [31:0] rs_value_ID, rt_value_ID;
   (* mark_debug = "true" *) wire RegWrite_ORGate;
    // IF_ID output
   (* mark_debug = "true" *) wire [31:0] Immediate_ID;
   (* mark_debug = "true" *) wire [31:0] PCAddResult_ID;
   (* mark_debug = "true" *) wire [31:0] Instruction_ID;
   (* mark_debug = "true" *) wire [31:0] JumpPC;
    // ID_EX output
   (* mark_debug = "true" *) wire RegWrite_EX, RegDst_EX, ALUSrc_EX;
   (* mark_debug = "true" *) wire MemToReg_EX/*, Branch_EX*/;
   (* mark_debug = "true" *) wire [31:0] PCAddResult_EX;
   (* mark_debug = "true" *) wire [1:0] MemWrite_EX, MemRead_EX;
   (* mark_debug = "true" *) wire [31:0] rt_value_EX;
   (* mark_debug = "true" *) wire [4:0] rs_address_EX;
        //To ALUControl
   (* mark_debug = "true" *) wire [31:0] Immediate_EX;
   (* mark_debug = "true" *) wire [3:0] ALUOp_EX;
   (* mark_debug = "true" *) wire [5:0] ALUControl;
    
        //To ALU
   (* mark_debug = "true" *) wire [31:0] rs_value_EX;
   (* mark_debug = "true" *) wire [31:0] ALUResult_EX;
        //To RegDst_Mux
   (* mark_debug = "true" *) wire [4:0] rt_address_EX, rd_address_EX;
   // ForwardingUnit and HazardDetection
        //To 3x1 ALU_Mux's
   (* mark_debug = "true" *) wire [1:0] ALU_input_rs;
   (* mark_debug = "true" *) wire [1:0] ALU_input_rt;
   (* mark_debug = "true" *) wire IF_ID_Write, ControlMuxSig;
   (* mark_debug = "true" *) wire [31:0] forward_rs_value, forward_rt_value; // output
   (* mark_debug = "true" *) wire IF_Flush;
   (* mark_debug = "true" *) wire [31:0] WriteMEMData_MUX; //mux data that goes into the mem register then into the WriteData for memory unit
   (* mark_debug = "true" *) wire [1:0] WriteMEMData_Signal;
     // EX_MEM output
   (* mark_debug = "true" *) wire [4:0] RegDst1Result_MEM;
   (* mark_debug = "true" *) wire [31:0] PCPlusOffset_MEM;
   (* mark_debug = "true" *) wire MemToReg_MEM;
   (* mark_debug = "true" *) wire RegWrite_MEM;
        //To DataMemory
   (* mark_debug = "true" *) wire [31:0] ALUResult_MEM;
   (* mark_debug = "true" *) wire [31:0] rt_value_MEM;
   (* mark_debug = "true" *) wire [1:0] MemWrite_MEM, MemRead_MEM;
   (* mark_debug = "true" *) wire [31:0] ReadData_MEM;
        //To ANDGATE
  (* mark_debug = "true" *)  wire Branch_MEM;
  (* mark_debug = "true" *)  wire Zero_MEM;
    // MEM_WB output
  (* mark_debug = "true" *)  wire [4:0] RegDst1Result_WB;
        //To MemToReg_Mux
   (* mark_debug = "true" *) wire [31:0] ReadData_WB;
   (* mark_debug = "true" *) wire [31:0] ALUResult_WB;
   (* mark_debug = "true" *) wire MemToReg_WB;


// DATAPATH START

// INSTRUCTION FETCH STAGE
    PCAdder PCAdder_1(PCResult, PCAddResult);   // PCAddResult --> 2x1Mux --> 2x1Mux --> 2x1Mux --> PC
 
    Mux32Bit2To1 Mux32Bit2To1_PCSrc(PCSrc_Result_MUX, PCAddResult, PCPlusOffset_ID, Branch); 
    Mux32Bit2To1 Mux32Bit2To1_jump(jump_Result_MUX, PCSrc_Result_MUX, JumpPC, jump); // debug these
    Mux32Bit2To1 Mux32Bit2To1_jr(jr_Result_MUX, jump_Result_MUX, rs_value_ID, jr);

    ProgramCounter ProgramCounter_1(jr_Result_MUX, PCResult, PC_Write, Reset, Clk);
    InstructionMemory InstructionMemory_1(PCResult, Instruction);
// END of IF
    // PIPELINE
    IF_ID_Reg IF_ID_Reg_1(PCAddResult, Instruction, PCAddResult_ID, Instruction_ID, IF_Flush, IF_ID_Write, Clk, Reset);
// DECODE STAGE
    Controller Controller_1(rsgz, tes, rsez, Instruction_ID, RegWrite, RegDst, ALUSrc, ALUOp, 
                            MemWrite, MemRead, MemToReg, Branch, jump, jal_RA, jr, isBranch); // new controller signals needed (jump instruction, etc.)

    Mux5Bit2To1 Mux5Bit2To1_WriteReg(WriteReg_MUX, RegDst1Result_WB, 5'b11111, jal_Control);
    Mux32Bit2To1 Mux32Bit2To1_WriteDat(WriteData_MUX, MemToReg_WB_MUX, PCAddResult_ID, jal_Control);

    ShiftLeft2 ShiftLeft2__1(Immediate_ID, ShiftLeft2Out_ID); // debug this

    Adder32Bit Adder32Bit_1(PCAddResult_ID, ShiftLeft2Out_ID, PCPlusOffset_ID); // debug this

    ORGate ORGate_RegWrite(RegWrite_WB, jal_RA, RegWrite_ORGate);

    RegisterFile RegisterFile_1(Instruction_ID[25:21], Instruction_ID[20:16], WriteReg_MUX, WriteData_MUX, RegWrite_ORGate, Clk, rs_value_ID, rt_value_ID, v0_Out, v1_Out);
                              //ReadRegister1     , ReadRegister2     , WriteRegister   , WriteData     , RegWrite, Clk, ReadData1  , ReadData2
    
    BranchCheck BranchCheck_1(BranchCheckMUX_rs, BranchCheckMUX_rt, rsgz, tes, rsez);
    SignExtension SignExtension_1(Instruction_ID[15:0], Immediate_ID[31:0]);
    JumpConcatenate JumpConcatenate_1(Instruction_ID[25:0], PCAddResult_ID[31:28], JumpPC);
// END of ID
    // PIPELINE
    ID_EX_Reg ID_EX_Reg_1(RegWrite, RegDst, ALUOp, ALUSrc, /*Branch,*/ MemWrite, MemToReg, MemRead, 
                          rs_value_ID, rt_value_ID, Immediate_ID, Instruction_ID[25:21], Instruction_ID[20:16], Instruction_ID[15:11], /*PCAddResult_ID,*/ jal_RA, jump, jr, JumpPC,
                        //                                          rs_address_ID  ^      rt_address_ID   ^    , rd_address_ID   ^
                          RegWrite_EX, RegDst_EX, ALUOp_EX, ALUSrc_EX, /*Branch_EX,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, 
                          rs_value_EX, rt_value_EX, Immediate_EX, rs_address_EX, rt_address_EX, rd_address_EX, /*PCAddResult_EX,*/ jal_EX, Jump_EX, JR_EX, JumpPC_EX, ControlMuxSig, Clk, Reset);

// FORWARDING UNIT AND HAZARD DETECTION (AND MUXES)
    ForwardingUnit ForwardingUnit_1(RegWrite_MEM, RegDst1Result_MEM, RegWrite_WB, RegDst1Result_WB, rs_address_EX, rt_address_EX, ALU_input_rs, ALU_input_rt, WriteMEMData_Signal);
//                                 EX_MEM_RegWrite,  EX_MEM_rd,   MEM_WB_RegWrite,   MEM_WB_rd,        ID_EX_rs,      ID_EX_rt, ALU_input_rs, ALU_input_rt, WriteMEMData_Signal
    Mux32Bit3To1 Mux32Bit3To1_rs(rs_value_EX, ALUResult_MEM, MemToReg_WB_MUX, forward_rs_value, ALU_input_rs);
    Mux32Bit3To1 Mux32Bit3To1_rt(rt_value_EX, ALUResult_MEM, MemToReg_WB_MUX, forward_rt_value, ALU_input_rt);
//                              (A,B,C,out,sel)
    HazardDetection HazardDetection_1(RegDst_MUX, RegDst1Result_MEM, MemRead_EX,MemRead_MEM, Branch, jump, IF_Flush, Instruction_ID[25:21], Instruction_ID[20:16], PC_Write, IF_ID_Write, 
                                        ControlMuxSig, isBranch, RegWrite_EX, RegWrite_WB, RegDst1Result_WB, jal_RA/*, RegWrite_MEM */, jal_Control);
//FORWARDING UNIT FOR BRANCHING AND MUXES
    ForwardBranch ForwardBranch_1(Instruction_ID[25:21], Instruction_ID[20:16], RegDst1Result_MEM, RegWrite_MEM, rs_MUX, rt_MUX);
//                                  rs_ID,                      rt_ID,            EX_MEM_rd,      EX_MEM_RegWrite, rs_MUX, rt_MUX
    Mux32Bit2To1 Mux32Bit2To1_BRANCHrs(BranchCheckMUX_rs, rs_value_ID, ALUResult_MEM, rs_MUX); 
    Mux32Bit2To1 Mux32Bit2To1_BRANCHrt(BranchCheckMUX_rt, rt_value_ID, ALUResult_MEM, rt_MUX);
//                                      out, A, B, sel
// EXECUTE STAGE
    ALUControl ALUControl_1(Immediate_EX[5:0], ALUOp_EX, rt_address_EX[0], ALUControl);
    Mux32Bit2To1 Mux32Bit2To1_ALUSrc(ALUSrc_MUX, rt_value_EX, Immediate_EX, ALUSrc_EX);

    Mux32Bit3To1 Mux32Bit3To1_WriteMEMData(rt_value_EX, ALUResult_MEM, MemToReg_WB_MUX, WriteMEMData_MUX, WriteMEMData_Signal);

    ALU32Bit ALU32Bit_1(ALUControl, forward_rs_value, forward_rt_value, Immediate_EX, ALUResult_EX /*, Zero*/);

    Mux5Bit2To1 Mux5Bit2To1_RegDst(RegDst_MUX, rt_address_EX, rd_address_EX, RegDst_EX);

//    ShiftLeft2 ShiftLeft2__1(Immediate_EX, ShiftLeft2Out_EX);

//    Adder32Bit Adder32Bit_1(PCAddResult_EX, ShiftLeft2Out_EX, PCPlusOffset_EX);
// END of EX
    // PIPELINE
    EX_MEM_Reg EX_MEM_Reg_1(ALUResult_EX, /*PCPlusOffset_EX,*/ WriteMEMData_MUX,
                            RegDst_MUX, /*Zero,*/ MemWrite_EX, MemToReg_EX, MemRead_EX, /*Branch_EX,*/ RegWrite_EX, jal_EX, Jump_EX, JR_EX, JumpPC_EX, rs_value_EX,
                            //
                            ALUResult_MEM, /*PCPlusOffset_MEM,*/ rt_value_MEM,
                            RegDst1Result_MEM, /*Zero_MEM,*/ MemWrite_MEM, MemToReg_MEM, MemRead_MEM, /*Branch_MEM,*/ 
                            RegWrite_MEM, jal_MEM, Jump_MEM, JR_MEM, JumpPC_MEM, rs_value_MEM, Clk, Reset);
// MEMORY STAGE
    DataMemory DataMemory_1(ALUResult_MEM, rt_value_MEM, Clk, MemWrite_MEM, MemRead_MEM, ReadData_MEM);
    
// REPLACED BY BRANCH_CHECK    ANDGate ANDGate_1(Zero_MEM, Branch_MEM, PCSrc);

// END OF MEM
    // PIPELINE
    MEM_WB_Reg MEM_WB_Reg_1(ReadData_MEM, ReadData_WB, ALUResult_MEM, ALUResult_WB, MemToReg_MEM, 
                            MemToReg_WB, RegWrite_MEM, RegWrite_WB, RegDst1Result_MEM, RegDst1Result_WB,
                            jal_MEM, jal_WB, Jump_MEM, Jump_WB, JR_MEM, JR_WB, Clk, Reset);

// MEM --> M3       M3 --> WB       ???????

// BEGIN WB
    Mux32Bit2To1 Mux32Bit2To1_MemToReg(MemToReg_WB_MUX, ALUResult_WB, ReadData_WB, MemToReg_WB);

// END OF WB
    // always @(posedge Clk) begin
    //     if (WriteReg_MUX == 2) begin
    //         v0 <= WriteData_MUX;
    //     end
    //     if (WriteReg_MUX == 3) begin
    //         v1 <= WriteData_MUX;
    //     end
    //     v0_Out <= v0; // v0 is register 2, v1 is register 3
    //     v1_Out <= v1;
    // end

    // initial begin 
    //    v0 <= 0;
    //    v1 <= 0;
    // end

endmodule