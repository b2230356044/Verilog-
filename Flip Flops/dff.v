
module dff (
    input D,      // Data input
    input CLK,    // Clock input
    input RESET,  // Asynchronous reset, active high
    output reg Q  // Output
);
wire D_n, S, R, Q_int, Qn, CLK_gated;


    not u1(D_n, D);
    nand u2(CLK_gated, CLK, RESET);


    nand u3(S, D, CLK_gated);
    nand u4(R, D_n, CLK_gated);


    nand u5(Q_int, S, Qn);
    nand u6(Qn, R, Q_int);

always @(posedge RESET or posedge CLK)
    begin
        if (RESET)
            Q <= 0;
        else
            Q <= Q_int;
    end
endmodule