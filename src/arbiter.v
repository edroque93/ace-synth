module arbiter (
	input wire clk,
	input wire reset,
	// IF Stage (ic)
	input wire ic_read_req,
	output reg ic_read_ack,
	input wire [31:0] ic_read_addr,
	output reg [31:0] ic_read_data,
	// MEM Stage (dc)
	input wire dc_read_req,
	output reg dc_read_ack,
	input wire [31:0] dc_read_addr,
	output reg [31:0] dc_read_data,
	input wire dc_write_req,
	output reg dc_write_ack,
	input wire [31:0] dc_write_addr,
	input wire [31:0] dc_write_data,
	// IOCTRL Interface
	output reg mem_read,
	output reg mem_write,
	input wire mem_ack,
	output reg [31:0] mem_addr,
	output reg [31:0] mem_data_write,
	input wire [31:0] mem_data_read
);

// Sync registers
reg [1:0] state, state_next;
reg ic_read_ack_next;
reg [31:0] ic_read_data_next;
reg dc_read_ack_next;
reg [31:0] dc_read_data_next;
reg dc_write_ack_next;
reg mem_read_next;
reg mem_write_next;
reg [31:0] mem_addr_next;
reg [31:0] mem_data_write_next;


// Sync state
always @(posedge clk or posedge reset) begin
	if (reset) begin
		state          <= state_idle;
		ic_read_ack    <= 0;
		ic_read_data   <= 32'd0;
		dc_read_ack    <= 0;
		dc_read_data   <= 32'd0;
		dc_write_ack   <= 0;
		mem_read       <= 0;
		mem_write      <= 0;
		mem_addr       <= 32'd0;
		mem_data_write <= 32'd0;
	end else begin
		state          <= state_next;
		ic_read_ack    <= ic_read_ack_next;
		ic_read_data   <= ic_read_data_next;
		dc_read_ack    <= dc_read_ack_next;
		dc_read_data   <= dc_read_data_next;
		dc_write_ack   <= dc_write_ack_next;
		mem_read       <= mem_read_next;
		mem_write      <= mem_write_next;
		mem_addr       <= mem_addr_next;
		mem_data_write <= mem_data_write_next;
	end
end

// State machine
localparam [1:0] state_idle     = 2'b00,
                 state_ic_read  = 2'b01,
                 state_dc_read  = 2'b10,
                 state_dc_write = 2'b11;

// Combinatorial logic of the state machine
always @* begin
	state_next        = state_idle;
	mem_write_next    = 0;
	mem_read_next     = 0;
	dc_write_ack_next = 0;
	dc_read_ack_next  = 0;
	ic_read_ack_next  = 0;

	case (state)
		state_idle: begin
			if (dc_write_req) begin
				mem_addr_next       = dc_write_addr;
				mem_data_write_next = dc_write_data;
				mem_read_next       = 0;
				mem_write_next      = 1;
				state_next          = state_dc_write;
			end else if (dc_read_req) begin
				mem_addr_next  = dc_read_addr;
				mem_read_next  = 1;
				mem_write_next = 0;
				state_next     = state_dc_read;
			end else if (ic_read_req) begin
				mem_addr_next  = ic_read_addr;
				mem_read_next  = 1;
				mem_write_next = 0;
				state_next     = state_ic_read;
			end
		end
		state_ic_read: begin
			if (mem_ack) begin
				ic_read_ack_next  = 1;
				ic_read_data_next = mem_data_read;
				state_next        = state_idle;
			end else begin
				state_next = state_ic_read;
			end
		end
		state_dc_read: begin
			if (mem_ack) begin
				dc_read_ack_next  = 1;
				dc_read_data_next = mem_data_read;
				state_next        = state_idle;
			end else begin
				state_next = state_dc_read;
			end
		end
		state_dc_write: begin
			if (mem_ack) begin
				dc_write_ack_next = 1;
				state_next        = state_idle;
			end else begin
				state_next = state_dc_write;
			end
		end
	endcase
end

ndmodule
