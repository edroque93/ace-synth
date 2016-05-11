module if_stage (
	input wire clk,
	input wire reset,
	// Inputs
	input wire [31:0] pc_in,
	// Outputs
	output reg [31:0] instr,
	output reg [31:0] pc_out,
	output reg ready,
	// Shared
	output reg [31:0] fetch_addr,
	output reg        fetch_req,
	input wire [31:0] fetch_data,
	input wire        fetch_ack
);

localparam state_read = 0,
           state_wait = 1;

reg state, state_next;

reg [31:0] fetch_addr_next;
reg [31:0] fetch_req_next;

reg [31:0] instr_next;
reg [31:0] pc_next;
reg ready_next;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state      <= state_read;
		fetch_addr <= 32'h00000000;
		fetch_req  <= 1'b0;
		instr      <= 32'h00000000;
		pc_out     <= 32'h00000000;
		ready      <= 1'b1;
	end else begin
		state      <= state_next;
		fetch_addr <= fetch_addr_next;
		fetch_req  <= fetch_req_next;
		instr      <= instr_next;
		pc_out     <= pc_next;
		ready      <= ready_next;
	end
end

always @* begin
	state_next = state_read;
	case (state)
		state_read: begin
			state_next = state_wait;
			fetch_addr_next = pc_in;
			fetch_req_next  = 1'b1;
			instr_next = 32'h00000000;
			pc_next    = 32'h00000000;
			ready_next = 1'b0;
		end
		state_wait: begin
			if (fetch_ack) begin
				state_next = state_read;
				fetch_addr_next = 32'h000000000;
				fetch_req_next  = 1'b0;
				instr_next = fetch_data;
				pc_next    = fetch_addr;
				ready_next = 1'b1;
			end else begin
				state_next = state_wait;
			end
		end
	endcase
end

endmodule
