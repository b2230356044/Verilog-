module four_bit_adder_subtractor(A, B, subtract, Result, Cout);
    input [3:0] A;
    input [3:0] B;
    input subtract;
    output [3:0] Result;
    output Cout;
    wire [3:0] t1,t2;
    two_s_complement tc (.In(B),.Out(t1));
    four_bit_2x1_mux mx (.In_1(t1),.In_0(B),.Select(subtract),.Out(t2));
    four_bit_rca rca(.A(A),.B(t2),.Cin(0),.Cout(Cout),.S(Result));


endmodule
