// Interface between ACE Processor and Altera DE2
module ace (
    input wire clock_50,
    // Switches
    input wire [9:0] sw,
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

clock_delay clock_delay (
	.clk(clock_50),
	.clk_new(better_clock)
);

cpu cpu (
    .clk(better_clock),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .mem_ack(mem_ack),
    .mem_addr(mem_addr),
    .mem_read_data(mem_read_data),
    .mem_write_data(mem_write_data)
);

io_ctrl io_ctrl (
    .clk(better_clock),
    .sw(sw),
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

segments_converter addr_conv_lo (
	.value(mem_addr[3:0]),
	.value_converted(hex6)
);

segments_converter addr_conv_hi (
	.value(mem_addr[7:4]),
	.value_converted(hex7)
);

segments_converter addr_conv_lolo (
	.value(mem_read_data[3:0]),
	.value_converted(hex0)
);

segments_converter addr_conv_lohi (
	.value(mem_read_data[7:4]),
	.value_converted(hex1)
);

segments_converter addr_conv_hilo (
	.value(mem_read_data[11:8]),
	.value_converted(hex2)
);

segments_converter addr_conv_hihi (
	.value(mem_read_data[15:12]),
	.value_converted(hex3)
);

assign hex4 = 127;
assign hex5 = 127;
assign ledr[17:5] = 0;
assign ledg[5:1] = 0;

assign ledr[4] = mem_read;
assign ledr[3] = !sram_oe_n;
assign ledr[2] = mem_write;
assign ledr[1] = !sram_we_n;
assign ledr[0] = mem_ack;

assign ledg[7:6] = io_state;

assign ledg[0] = better_clock;

endmodule
