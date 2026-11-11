`timescale 1ns / 1ps

module tb_alu_4bit;
    reg  [3:0] A;
    reg  [3:0] B;
    reg  [2:0] ALU_Sel;
    wire [3:0] ALU_Out;
    wire CarryOut;

    alu_4bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut)
    );

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_alu_4bit);

        $monitor("Time=%0t | Sel=%b | A=%d B=%d | Out=%d (Carry=%b)", 
                 $time, ALU_Sel, A, B, ALU_Out, CarryOut);

        // Test cases
        A = 4'd8;  B = 4'd5;  ALU_Sel = 3'b000; #10; // 8 + 5 = 13
        A = 4'd12; B = 4'd7;  ALU_Sel = 3'b000; #10; // 12 + 7 = 19 (Out=3, Carry=1)
        A = 4'd10; B = 4'd4;  ALU_Sel = 3'b001; #10; // 10 - 4 = 6
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b010; #10; // AND -> 8
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b011; #10; // OR  -> 14
        A = 4'b1100; B = 4'b1010; ALU_Sel = 3'b100; #10; // XOR -> 6

        $finish;
    end
endmodule
