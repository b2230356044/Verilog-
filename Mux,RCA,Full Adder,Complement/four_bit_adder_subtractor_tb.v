`timescale 1ns/1ps
module four_bit_adder_subtractor_tb;
reg [3:0] At,Bt;
reg substract;
wire t1,t2;
wire [3:0] Result;
wire cout;

four_bit_adder_subtractor UUT(.A(At),.B(Bt),.subtract(substract),.Result(Result),.Cout(cout));

 initial
 begin
        At = 4'b0000; Bt = 4'b0000; substract = 0;
        #10 At = 4'b0101; Bt = 4'b0011; substract = 0;
        #10 At = 4'b1001; Bt = 4'b0110; substract = 0;
        #10 At = 4'b1100; Bt = 4'b0011; substract = 1;
        #10 At = 4'b0111; Bt = 4'b1001; substract = 1;
        #10 At = 4'b1111; Bt = 4'b0001; substract = 0;  //overflow
        #10 At = 4'b0000; Bt = 4'b0000; substract = 1;
        #10 $finish;
    end
endmodule
