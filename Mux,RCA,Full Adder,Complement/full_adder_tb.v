`timescale 1ns/10ps
module full_adder_tb;
reg At,Bt,Cint;
wire S,Cout;
full_adder UUT(.A(At),.B(Bt),.Cin(Cint),.S(S),.Cout(Cout));
initial
begin
#10 At=0;Bt=0;Cint=0;
#10 At=0;Bt=0;Cint=1;
#10 At=0;Bt=1;Cint=0;
#10 At=0;Bt=1;Cint=1;
#10 At=1;Bt=0;Cint=0;
#10 At=1;Bt=0;Cint=1;
#10 At=1;Bt=1;Cint=0;
#10  At=1;Bt=1;Cint=1;
$finish
end
endmodule