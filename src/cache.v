module cache(
	input wire clk,
	input wire reset,

	input wire mem_read,
	input wire mem_write,
	input wire mem_type,

	input wire [31:0] addr,
	input wire [31:0] data_in,
	output reg [31:0] data_out, // async
	output reg hit, // async

	// Memory ports
	output reg mem_write_req,
	output reg [31:0] mem_write_addr,
	output reg [WIDTH-1:0] mem_write_data,
	input wire mem_write_ack,
	output reg mem_read_req,
	output reg [31:0] mem_read_addr,
	input wire [WIDTH-1:0] mem_read_data,
	input wire mem_read_ack
);

parameter WIDTH = 128;
parameter DEPTH = 4;
parameter WB = 4; // Width bits 2^4+3 = 128
parameter DB = 2; // Depth bits 2^2 = 4

// For some reason wires give zzzz..
reg [WB-1:0]     offset;
reg [DB-1:0]     index;
reg [31-WB-DB:0] tag;
reg [31:0]       addr_save;
reg [WB-1:0]     offset_save;
reg [DB-1:0]     index_save;
reg [31-WB-DB:0] tag_save;


reg [DEPTH-1:0]  validbits;
reg [DEPTH-1:0]  dirtybits;
reg [31-WB-DB:0] tags [0:DEPTH-1];
reg [WIDTH-1:0]  lines [0:DEPTH-1];

localparam state_idle  = 2'b00, // No memory interaction, => state_evict | state_read
           state_read  = 2'b01, // Reading from cache, => state_evict
           state_evict = 2'b10; // Writing back to memory, => state_read

localparam mem_type_byte = 1'b0,
           mem_type_word = 1'b1;

reg [1:0] state, state_next;

reg             mem_write_req_next;
reg [31:0]      mem_write_addr_next;
reg [WIDTH-1:0] mem_write_data_next;
reg             mem_read_req_next;
reg [31:0]      mem_read_addr_next;

always @(posedge clk or posedge reset) begin
	if (reset) begin
		state    <= state_idle;
		data_out <= 32'h00000000;
		hit      <= 1'b0;
		mem_write_req  <= 1'b0;
		mem_write_addr <= 32'h00000000;
		mem_write_data <= 32'h00000000;
		mem_read_req   <= 1'b0;
		mem_read_addr  <= 32'h00000000;
		// Reset memory
		validbits <= {DEPTH{1'b0}};
		dirtybits <= {DEPTH{1'b0}};
	end else begin
		state    <= state_next;
		mem_write_addr <= mem_write_addr_next;
		mem_write_data <= mem_write_data_next;
		mem_write_req  <= mem_write_req_next;
		mem_read_addr  <= mem_read_addr_next;
		mem_read_req   <= mem_read_req_next;
		if (mem_write & hit) begin
			// Write data
			case (mem_type)
				mem_type_byte: begin
					lines[index][(offset+1)*8-1-:8] = data_in[7:0];
				end
				mem_type_word: begin
					if (WIDTH == 32) lines[index] = data_in;
					else lines[index][(addr[WB-1:2]+1)*32-1-:32] = data_in;
				end
			endcase
			dirtybits[index] = 1'b1; // Mark line as dirty
		end
	end
end

// Update internal register
always @* begin
	// Wires don't work
	offset = addr[WB-1:0];
	index  = addr[WB+DB-1:WB];
	tag    = addr[31:WB+DB];
	offset_save = addr_save[WB-1:0];
	index_save  = addr_save[WB+DB-1:WB];
	tag_save    = addr_save[31:WB+DB];
	if (validbits[index]) begin
		hit = (tags[index] == tag);
	end else begin
		hit = 1'b0;
	end
end

// Update outputs
always @* begin
	data_out = 32'h00000000;
	// Handle data request
	// If the requested line is already in the cache => respond
	// This works independent on the current state
	if (mem_read | mem_write) begin
		if (hit) begin
			if (mem_read) begin
				// Read data
				case (mem_type)
					mem_type_byte: begin
						data_out = lines[index][(offset+1)*8-1-:8];
					end
					mem_type_word: begin
						if (WIDTH == 32) data_out = lines[index];
						else data_out = lines[index][(addr[WB-1:2]+1)*32-1-:32];
					end
				endcase
			end else begin
				data_out = data_in;
			end
		end
	end
end

// Update state
always @* begin
	state_next = state_idle;
	case (state)
		state_idle: begin
			// Handle cache misses
			if ((mem_read | mem_write) & !hit) begin
				addr_save = addr;
				if (validbits[index] & dirtybits[index]) begin
					// We need to save the old cache line
					state_next = state_evict;
					// Prepare memory write request
					mem_write_req_next = 1'b1;
					mem_write_addr_next = {tags[index], index, {WB{1'b0}}};
					mem_write_data_next = lines[index];
					// Invalidate line, so we can't use it anymore
					validbits[index] = 1'b0;
				end else begin
					state_next = state_read;
					// Prepare memory read request
					mem_read_req_next = 1'b1;
					mem_read_addr_next = {tag, index, {WB{1'b0}}};
				end
			end
		end
		state_read: begin
			if (mem_read_ack) begin
				state_next = state_idle;
				// Invalidate request
				mem_read_req_next = 1'b0;
				mem_read_addr_next = 32'h00000000;
				// Write line
				lines[index_save] = mem_read_data;
				tags[index_save] = tag_save;
				validbits[index_save] = 1'b1;
				dirtybits[index_save] = 1'b0;
			end else begin
				state_next = state_read; // Busy-wait
			end
		end
		state_evict: begin
			if (mem_write_ack) begin
				state_next = state_read;
				// Invalidate request
				mem_write_req_next = 1'b0;
				mem_write_addr_next = 32'h00000000;
				mem_write_data_next = 32'h00000000;
				// Prepare memory read request
				mem_read_req_next = 1'b1;
				mem_read_addr_next = {tag_save, index_save, {WB{1'b0}}};
			end else begin
				state_next = state_evict; // Busy-wait
			end
		end
	endcase
end

endmodule
