// Interface between ACE Processor and Altera DE2
module ace (
    input wire clock_50,
    // Switches
    input wire [17:0] sw,
    // SRAM
    output wire [19:0] sram_addr,
    inout  wire [15:0] sram_dq,
    output wire sram_we_n,
    output wire sram_oe_n,
    output wire sram_ub_n,
    output wire sram_lb_n,
    output wire sram_ce_n,
    // 7-Segment display
    output wire [6:0] hex0,
    output wire [6:0] hex1,
    output wire [6:0] hex2,
    output wire [6:0] hex3,
    output wire [6:0] hex4,
    output wire [6:0] hex5,
    output wire [6:0] hex6,
    output wire [6:0] hex7,
    // Buttons
    input wire [3:0] key,
    // Red LEDs
    output wire [17:0] ledr,
    // Green LEDs
    output wire [8:0] ledg
);

// TODO
// Instantiate Processor Core and Memory Controller

wire mem_read;
wire mem_write;
wire mem_ack;
wire [31:0] mem_addr;
wire [31:0] mem_read_data;
wire [31:0] mem_write_data;

wire [2:0] io_state;
wire [1:0] cpu_state;

wire better_clock;
wire reset_reseter;

clock_delay clock_delay (
	.clk(clock_50),
	.clk_new(better_clock)
);

reseter reseter (
	.clk(better_clock),
	.reset(reset_reseter)
);

cpu cpu (
	.clk(clock_50),
	.reset(!key[0]  | reset_reseter),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_ack(mem_ack),
	.mem_addr(mem_addr),
	.mem_read_data(mem_read_data),
	.mem_write_data(mem_write_data),
	// debug
	.hex0(hex0),
	.hex1(hex1),
	.hex2(hex2),
	.hex3(hex3),
	.hex4(hex4),
	.hex5(hex5),
	.hex6(hex6),
	.hex7(hex7)
);

io_ctrl io_ctrl (
	.clk(clock_50),
	.reset(!key[0] | reset_reseter),
	.sw(sw),
	.key(key[3:1]),
	.ledr(ledr),
	.sram_addr(sram_addr),
	.sram_dq(sram_dq),
	.sram_we_n(sram_we_n),
	.sram_oe_n(sram_oe_n),
	.sram_ub_n(sram_ub_n), 
	.sram_lb_n(sram_lb_n), 
	.sram_ce_n(sram_ce_n),
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_ack(mem_ack),
	.mem_addr(mem_addr),
	.mem_read_data(mem_read_data),
	.mem_write_data(mem_write_data),
	.state(io_state)
);

// Secuestrados.... MUAHAHAHHAHA
assign ledg[7:4] = 0;
assign ledg[3] = mem_read;
assign ledg[2] = mem_write;
assign ledg[1] = !key[0] | reset_reseter;
assign ledg[0] = better_clock;

endmodule
