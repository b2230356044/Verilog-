module four_bit_2x1_mux(In_1, In_0, Select, Out);
	input [3:0] In_1;
	input [3:0] In_0;
	input Select;
	output [3:0] Out;
	
	 assign Out = (In_1 & {4{Select}}) | (In_0 & {4{~Select}});
endmodule
