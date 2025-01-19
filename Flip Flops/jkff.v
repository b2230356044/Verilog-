module jkff (
    input J,      // Data input
    input K,      // Data input
    input CLK,    // Clock input
    input RESET,  // Asynchronous reset, active high
    output reg Q  // Output
);
wire Qn;
assign Qn = ~Q;

always @(posedge CLK or posedge RESET) begin
    if (RESET)
        Q <= 0;
    else begin
        case ({J, K})
            2'b00: Q <= Q;
            2'b01: Q <= 0;
            2'b10: Q <= 1;
            2'b11: Q <= ~Q;
        endcase
    end
end

endmodule