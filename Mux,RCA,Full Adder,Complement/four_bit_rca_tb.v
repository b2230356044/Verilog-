`timescale 1ns/10ps
module four_bit_rca_tb;
reg [3:0] At,Bt;
reg Cin;
wire [3:0] S;
wire Cout;


four_bit_rca UUT(.A(At),.B(Bt),.Cin(Cin),.S(S),.Cout(Cout));
initial
begin
At=4'b0000;Bt=4'b0000;Cin=0;
#10 At=4'b0000;Bt=4'b0000;Cin=1;
#10 At=4'b1100;Bt=4'b0011;Cin=0;
#10 At=4'b1100;Bt=4'b0011;Cin=1;
#10 At=4'b1110;Bt=4'b0001;Cin=1;
#10 At=4'b1100;Bt=4'b0011;Cin=1;
#10 At=4'b1111;Bt=4'b0001;Cin=0;
#10 At=4'b1111;Bt=4'b1111;Cin=1;
#10 $finish
end


endmodule