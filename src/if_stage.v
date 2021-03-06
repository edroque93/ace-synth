module if_stage (
	input wire clk,
	input wire reset,
	input wire flush,
	input wire we,
	// Control signals
	// - Flow
	input wire pc_reset,
	input wire pc_we,
	// - Branch predictor (TODO)
	// - Kernel control (TODO)
	// - Branch control
	input is_jump,
	input is_branch,
	input wire [31:0] jump_addr,
	input wire [31:0] branch_addr,
	// - Arbiter Control
	output reg read_req,
	input wire read_ack,
	output reg [31:0] read_addr,
	input wire [31:0] read_data,
	// Outputs
	output reg [31:0] instruction,
	output reg [31:0] pc_next,
	output reg hit
);

reg [31:0] pc_interm, pc_real, pc_next_next;
reg state, state_next;
reg read_req_next;
reg [31:0] instruction_next;
reg hit_next;

always @(posedge clk) begin
	if (reset) begin
		state <= state_idle;
		read_req <= 0;
		read_addr <= 32'd0;
		instruction <= 32'd0;
		pc_next <= 32'd0;
	end else begin
		if(flush) begin
			instruction <= 32'd0;
			pc_next <= 32'd0;
		end else if (we) begin
			pc_next <= pc_next_next + 4;
			instruction <= instruction_next;
		end
		state <= state_next;
		read_req <= read_req_next;
		read_addr <= pc_next_next;
	end
end

always @* hit = hit_next;

// State machine
localparam state_idle = 0, state_read = 1;

always @* begin
	state_next   = state_idle;
	read_req_next = 1'b0;
	hit_next = 1'b0;
	case (state)
		state_idle: begin
			state_next = state_read;
			if (pc_reset) begin
				pc_next_next = 32'd0;
			end else if(pc_we) begin
				pc_interm = is_jump ? jump_addr : pc_next;
				pc_next_next = is_branch ? branch_addr : pc_interm;
			end
			read_req_next = 1'b1;
		end
		state_read: begin
			state_next = state_read;
			if(read_ack) begin
				instruction_next = read_data;
				read_req_next = 1'b0;
				state_next = state_idle;
				hit_next = 1'b1;
			end
		end
	endcase
end

endmodule
