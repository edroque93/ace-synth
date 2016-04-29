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
    .mem_write_data(mem_write_data),
	 .state(cpu_state)
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

assign hex0 = 127;
assign hex1 = 127;
assign hex2 = 127;
assign hex3 = 127;
assign hex4 = 127;
assign hex5 = 127;
assign hex6 = 127;
assign hex7 = 127;
assign ledr[7:3] = 0;
assign ledr[2:0] = io_state;
assign ledg[8:2] = 0;
assign ledg[1:0] = cpu_state;

assign ledr[17-:8] = mem_read_data[7:0];

endmodule
