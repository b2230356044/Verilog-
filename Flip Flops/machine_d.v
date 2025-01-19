module machine_d(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
wire A=S[2];
wire B=S[1];
wire C=S[0];
dff Da(.D((~A & B)|(~B & ~C & x) | (A & ~C & ~x) | (A & C & x)|(A&~B)),.CLK(CLK),.RESET(RESET),.Q(S[2]));
dff Db(.D((~C&A)|(x&A)|(C&~A&~B)|(~C&~x&B)),.CLK(CLK),.RESET(RESET),.Q(S[1]));
dff Dc(.D((~C&~x)|(C&x&B)|(x&~A&~B)),.CLK(CLK),.RESET(RESET),.Q(S[0]));
assign F =(A&B&C);
endmodule