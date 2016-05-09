// ================================
// IO Controller for Altera DE2-115
// ================================

// ================================
// Logical address space map
// ================================
// 0x00000000
//      .
//      .
//      .
// 0x000FFFFC [R/W] SRAM Memory
// 0x00100000 [R]   Switches
// 0x00100004 [R]   Keys
// 0x00100008 [R/W] Green LEDs
// 0x0010000C [R/W] Red LEDs
// ================================

module io_ctrl(
	// =============================
	// Interface with Altera DE2-115
	// =============================
	input wire clk,
	input wire reset,
	// Switches
	input wire [17:0] sw,
	// SRAM
	output reg [19:0] sram_addr,
	inout wire [15:0] sram_dq,
	output reg sram_we_n,
	output reg sram_oe_n,
	output wire sram_ub_n,
	output wire sram_lb_n,
	output wire sram_ce_n,
	// 7-Segment display
	output reg [6:0] hex0,
	output reg [6:0] hex1,
	output reg [6:0] hex2,
	output reg [6:0] hex3,
	output reg [6:0] hex4,
	output reg [6:0] hex5,
	output reg [6:0] hex6,
	output reg [6:0] hex7,
	// Buttons
	input wire [2:0] key,
	// Red LEDs
	output reg [17:0] ledr,
	// Green LEDs
	output reg [8:0] ledg,
	// ===========================
	// Interface with ACE Core
	// ===========================
	input wire mem_read,
	input wire mem_write,
	output reg mem_ack,
	input wire [31:0] mem_addr,
	output reg [31:0] mem_read_data,
	input wire [31:0] mem_write_data,
	 output reg [2:0] state
);

// Sync registers
reg [19:0] real_addr;
reg [15:0] memwr_buffer;
reg [31:0] word;
reg [19:0] addr_next;
reg [15:0] wr_buffer;
reg [15:0] wr_next;
reg [2:0]  state_next;
reg [17:0] ledr_next;
reg [8:0]  ledg_next;

reg we_next;
reg oe_next;
reg ack_next;
reg select;
reg select_next;

// Sync state
always @(posedge clk or posedge reset) begin
	if (reset) begin
		state         <= state_idle;
		sram_we_n     <= 1'b1;
		sram_oe_n     <= 1'b1;
		mem_ack       <= 1'b0;
		mem_read_data <= 32'hFFFFFFFF;
		wr_buffer     <= 16'hFFFF;
		select        <= 1'b0;
		ledr          <= 18'b0;
		ledg          <= 9'b0;
	end else begin
		mem_ack       <= ack_next;
		mem_read_data <= word;
		state         <= state_next;
		sram_addr     <= addr_next;
		sram_oe_n     <= oe_next;
		sram_we_n     <= we_next;
		wr_buffer     <= wr_next;
		select        <= select_next;
		ledr          <= ledr_next;
		ledg          <= ledg_next;
	end
end

// State machine
localparam [2:0] state_idle     = 3'b000,
                 state_read_lo  = 3'b010,
                 state_read_hi  = 3'b011,
                 state_write_lo = 3'b110,
                 state_write_hi = 3'b111;

// Combinatorial logic of the state machine
always @* begin
	if (reset) begin
		ledr_next = 18'b0;
		ledg_next = 9'b0;
	end
	state_next   = state_idle;
	select_next  = 1'b0;
	we_next      = 1'b1;
	oe_next      = 1'b1;
	ack_next     = 1'b0;
	case (state)
		state_idle: begin
			ack_next = 1'b0;
			if (mem_read) begin
				if (mem_addr >> 20) begin
					ack_next = 1'b1;
					case (mem_addr)
						32'h00100000: begin
							word <= {{14{1'b0}}, sw};
						end
						32'h00100004: begin
							word <= {{29{1'b0}}, ~key};
						end
						32'h00100008: begin
							word <= {{23{1'b0}}, ledg};
						end
						32'h0010000C: begin
							word <= {{14{1'b0}}, ledr};
						end
						default: begin
							word <= 32'h0;
						end
					endcase
				end else begin
					real_addr   = mem_addr[19:0] >> 1;
					addr_next   = mem_addr[19:0] >> 1;
					select_next = 1'b0;
					we_next     = 1'b1;
					oe_next     = 1'b0;
					wr_next     = {16{1'bz}};
					state_next = state_read_hi;
				end
			end else if (mem_write) begin
				if (mem_addr >> 20) begin
					ack_next = 1'b1;
					case (mem_addr)
						32'h00100008: begin
							ledg_next <= mem_write_data [8:0];
						end
						32'h0010000C: begin
							ledr_next <= mem_write_data [17:0];
						end
						default: begin
							word <= 32'h0;
						end
					endcase
				end else begin
					real_addr    = mem_addr[19:0] >> 1;
					addr_next    = mem_addr[19:0] >> 1;
					select_next  = 1'b1;
					we_next      = 1'b0;
					oe_next      = 1'b1;
					memwr_buffer = mem_write_data[15:0];
					wr_next      = mem_write_data[31:16];
					state_next   = state_write_hi;
				end
			end
		end
		state_read_hi: begin
			addr_next    = real_addr + 20'd1;
			select_next  = 1'b0;
			we_next      = 1'b1;
			oe_next      = 1'b0;
			ack_next     = 1'b0;
			word [31:16] = sram_dq;
			state_next   = state_read_lo;
		end
		state_read_lo: begin
			select_next = 1'b0;
			we_next     = 1'b1;
			oe_next     = 1'b1;
			ack_next    = 1'b1;
			word [15:0] = sram_dq;
			state_next  = state_idle;
		end
		state_write_hi: begin
			addr_next   = real_addr + 20'd1;
			select_next = 1'b1;
			we_next     = 1'b0;
			oe_next     = 1'b1;
			ack_next    = 1'b0;
			wr_next     = memwr_buffer;
			state_next  = state_write_lo;
		end
		state_write_lo: begin
			select_next = 1'b0;
			we_next     = 1'b1;
			oe_next     = 1'b1;
			ack_next    = 1'b1;
			state_next  = state_idle;
		end
		default: begin
			state_next = state_idle;
		end
	endcase
end

// select == 0 => read
// select == 1 => write
// connect to high impedance while reading
assign sram_dq = (select) ? wr_buffer : {16{1'bz}};
assign sram_ub_n = 1'b0;
assign sram_lb_n = 1'b0;
assign sram_ce_n = 1'b0;

endmodule
