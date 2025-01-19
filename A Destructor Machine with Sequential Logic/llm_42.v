module llm(green, red, yellow, clock, a1, a2, a3, deception_out, current_state, timer);

	// Inputs
	input green, red, yellow;
	input clock;

	// Outputs
	output reg [3:0] current_state;
	output reg a1, a2, a3, deception_out; // a3 is expansion output
	output reg [5:0] timer;

	parameter     LAY_LOW = 4'b0000,
	              DECEPTION = 4'b0001,
	              ATTACK_SECURITY = 4'b0010,
	              ATTACK_DATABASE = 4'b0011,
	              FAIL = 4'b0100,
	              EXPANSION = 4'b0101;
	              reg [3:0] next_state;

    initial begin
        current_state = LAY_LOW;
        next_state = LAY_LOW;
        timer = 1;
        a1 = 0;
        a2 = 0;
        a3 = 0;
        deception_out = 0;
    end

    always @(posedge clock) begin
    current_state <= next_state;
    if(next_state != current_state) begin
            timer <= 1;
        end else begin
            timer <= timer +1;
        end

    end

	always @(*) begin

		case (current_state)
			LAY_LOW: begin

				if (green && !yellow && timer >= 20) begin
					next_state = ATTACK_SECURITY;
				end else begin
					next_state = LAY_LOW;
				end
				if (red) begin
                    next_state = DECEPTION;
                end
			end
			ATTACK_SECURITY: begin
				if (yellow) begin
					next_state = LAY_LOW;
				end else if (green && timer >= 20) begin
					next_state = ATTACK_DATABASE;
				end else begin
					next_state = ATTACK_SECURITY;
				end
                if (red) begin
                    next_state = DECEPTION;
                end
			end
			ATTACK_DATABASE: begin
				if (yellow) begin
					next_state = ATTACK_SECURITY;
				end else if (green && timer >= 10) begin
					next_state = EXPANSION;
				end else begin
					next_state = ATTACK_DATABASE;
				end
				if (red) begin
                    next_state = DECEPTION;
                end
			end
			DECEPTION: begin
				next_state = DECEPTION;
				if (timer == 15) begin
				 if (!red) begin
                     next_state = LAY_LOW;
				 end else begin
				     next_state = FAIL;
				 end
				 end
			end
			FAIL: begin
				next_state = FAIL;
			end
			EXPANSION: begin
				next_state = EXPANSION;
			end
			default: begin
				next_state = LAY_LOW;
			end
		endcase
	end

	always @(*) begin
		case (current_state)
			LAY_LOW: begin
		    deception_out = 0;
            a1 = 0;
            a2 = 0;
            a3 = 0;
            if (yellow) begin
                a1=0;
            end
			end
			DECEPTION: begin
                deception_out = 1;
			end
			ATTACK_SECURITY: begin
				a1 = 1;
				if (yellow) begin
                   a2=0;
                end
			end
			ATTACK_DATABASE: begin
				a2 = 1;
			end
			EXPANSION: begin
				a3 = 1;
			end
			default: begin
			end
		endcase
	end

endmodule





