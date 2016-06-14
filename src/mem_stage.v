module mem_stage (
	input wire clk,
	input wire reset,
	input wire flush, // Reset would reset cache as well
	input wire we,
	// Control signals
	// - Forward
	output reg [4:0]  reg_probe,
	output reg [31:0] data_probe,
	output reg        write_probe,
	// - Memory interface
	output reg        mem_read_req,
	output reg [31:0] mem_read_addr,
	input wire [31:0] mem_read_data,
	input wire        mem_read_ack,
	output reg        mem_write_req,
	output reg [31:0] mem_write_addr,
	output reg [31:0] mem_write_data,
	input wire        mem_write_ack,
	output reg stall,
	// Inputs
	input wire is_branch,
	input wire [31:0] pc_branch,
	input wire alu_zero,
	input wire mem_read,
	input wire mem_write,
	input wire mem_type,
	input wire mem_to_reg,
	input wire [31:0] alu_out,
	input wire [31:0] data_t,
	input wire [4:0] reg_addr,
	input wire reg_write,
	// Outputs
	output reg [31:0] reg_data,
	output reg [4:0] reg_addr_out,
	output reg reg_write_out,
	// Feedback
	output reg is_branch_out,
	output reg [31:0] pc_branch_out
);

localparam state_idle = 2'b00,
           state_read = 2'b01,
           state_write = 2'b10;

reg [1:0] state, state_next;

reg        mem_write_req_next;
reg [31:0] mem_write_addr_next;
reg [31:0] mem_write_data_next;
reg        mem_read_req_next;
reg [31:0] mem_read_addr_next;

reg stall_next;

reg [31:0] reg_data_next;
reg [4:0]  reg_addr_next;
reg        reg_write_next;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		is_branch_out <= 1'b0;
		pc_branch_out <= 32'h00000000;
		reg_data      <= 32'h00000000;
		reg_addr_out  <= 5'b00000;
		reg_write_out <= 1'b0;
		stall <= 1'b0;
		state <= state_idle;
		mem_write_req  <= 1'b0;
		mem_write_addr <= 32'h00000000;
		mem_write_data <= 32'h00000000;
		mem_read_req   <= 1'b0;
		mem_read_addr  <= 32'h00000000;
	end else begin
		state <= state_next;
		mem_write_req  <= 0; //mem_write_req_next;
		mem_write_addr <= mem_write_addr_next;
		mem_write_data <= mem_write_data_next;
		mem_read_req   <= 0; //mem_read_req_next;
		mem_read_addr  <= mem_read_addr_next;
		if (flush) begin
			is_branch_out <= 1'b0;
			is_branch_out <= 1'b0;
			pc_branch_out <= 32'h00000000;
			reg_data      <= 32'h00000000;
			reg_addr_out  <= 5'b00000;
			reg_write_out <= 1'b0;
			stall <= 1'b0;
		end else if (we) begin
			is_branch_out <= alu_zero & is_branch;
			pc_branch_out <= pc_branch;
			reg_data      <= reg_data_next;
			reg_addr_out  <= reg_addr_next;
			reg_write_out <= reg_write_next;
			stall <= stall_next;
		end
	end
end

// assigns really
always @* begin
	reg_probe   = reg_addr_next;
	data_probe  = reg_data_next;
	write_probe = reg_write_next;
end

always @* begin
	state_next = state_idle;
	reg_data_next  = 32'h00000000;
	reg_addr_next  = reg_addr;
	reg_write_next = reg_write;
	stall_next = 1'b0;
	case (state)
		state_idle: begin
			if (mem_to_reg & mem_read) begin
				mem_read_req_next  = 1'b1;
				mem_read_addr_next = alu_out;
				stall_next = 1'b1;
				state_next = state_read;
			end else if (mem_write) begin
				mem_write_req_next  = 1'b1;
				mem_write_addr_next = alu_out;
				mem_write_data_next = data_t;
				stall_next = 1'b1;
				state_next = state_write;
			end else begin
				reg_data_next  = alu_out;
			end
		end
		state_read: begin
			if (mem_read_ack) begin
				reg_data_next = mem_read_data;
				mem_read_req_next = 1'b0;
				mem_read_addr_next = 32'h00000000;
				stall_next = 1'b0;
				state_next = state_idle;
			end else begin
				stall_next = 1'b1;
				state_next = state_read;
			end
		end
		state_write: begin
			if (mem_write_ack) begin
				mem_write_req_next = 1'b0;
				mem_write_addr_next = 32'h00000000;
				mem_write_data_next = 32'h00000000;
				stall_next = 1'b0;
				state_next = state_idle;
			end else begin
				stall_next = 1'b1;
				state_next = state_write;
			end
		end
	endcase
end

endmodule
