module machine_jk(
    input wire x,
    input wire CLK,
    input wire RESET,
    output wire F,
    output wire [2:0] S
);
wire A=S[2];
wire B=S[1];
wire C=S[0];
    // Your code goes here.  DO NOT change anything that is already given! Otherwise, you will not be able to pass the tests!
    jkff jk1(.J(B|(~C&x)),.K((B&~C&x)|(B&C&~x)),.RESET(RESET),.CLK(CLK),.Q(S[2]));
    jkff jk2(.J((C&~A)|(~C&A)|(C&x)),.K((~A&x)|(C&~x)),.CLK(CLK),.RESET(RESET),.Q(S[1]));
    jkff jk3(.J(~x|(~A&~B&x)),.K((~A&~x)|(B&~x)|(A&x&~B)),.CLK(CLK),.RESET(RESET),.Q(S[0]));
    assign F=(A&B&C);
endmodule