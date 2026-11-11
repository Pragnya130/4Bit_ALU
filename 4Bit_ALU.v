// 4-Bit Arithmetic Logic Unit (ALU)
module alu_4bit (
    input  [3:0] A,          // 4-bit Operand A (0 to 15)
    input  [3:0] B,          // 4-bit Operand B (0 to 15)
    input  [2:0] ALU_Sel,    // 3-bit Opcode selector
    output reg [3:0] ALU_Out,// 4-bit Result
    output reg CarryOut      // Carry flag for addition
);

    always @(*) begin
        CarryOut = 1'b0;
        case (ALU_Sel)
            3'b000: {CarryOut, ALU_Out} = A + B; // ADD
            3'b001: ALU_Out = A - B;             // SUB
            3'b010: ALU_Out = A & B;             // AND
            3'b011: ALU_Out = A | B;             // OR
            3'b100: ALU_Out = A ^ B;             // XOR
            3'b101: ALU_Out = ~A;                // NOT
            3'b110: ALU_Out = A << 1;            // Left Shift
            3'b111: ALU_Out = A >> 1;            // Right Shift
            default: ALU_Out = 4'b0000;
        endcase
    end

endmodule
