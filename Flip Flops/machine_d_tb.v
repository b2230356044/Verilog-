`timescale 1ns / 1ps

module machine_d_tb;
    reg x;
    reg CLK;
    reg RESET;
    wire F;
    wire [2:0] S;
machine_d uut (
        .x(x),
        .CLK(CLK),
        .RESET(RESET),
        .F(F),
        .S(S)
        );
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end


        initial begin
          RESET = 1;
           x = 0;

           #10 RESET = 0;
           #20 x = 1;
           #30 x = 0;
           #40 x = 1;

           #50 RESET = 1;
           #10 RESET = 0;

           #100 $finish;
    end
    initial begin
        $monitor($time, x, RESET, S, F);
    end

endmodule