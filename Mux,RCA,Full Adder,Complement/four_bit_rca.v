module four_bit_rca(
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] S,
    output Cout
);
wire carries[2:0];
   full_adder F1 (.A(A[0]),.B(B[0]),.Cin(Cin),.S(S[0]),.Cout(carries[0]));
   full_adder F2(.A(A[1]),.B(B[1]),.Cin(carries[0]),.S(S[1]),.Cout(carries[1]));
   full_adder F3(.A(A[2]),.B(B[2]),.Cin(carries[1]),.S(S[2]),.Cout(carries[2]));
   full_adder F4 (.A(A[3]),.B(B[3]),.Cin(carries[2]),.S(S[3]),.Cout(Cout));



endmodule