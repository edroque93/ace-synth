module cpu (
	input wire clk,
	input wire reset,

	output wire mem_read,
	output wire mem_write,
	input wire mem_ack,
	output wire [31:0] mem_addr,
	input wire [31:0] mem_read_data,
	output wire [31:0] mem_write_data,
	 // debug xdddd
	output wire [6:0] hex0,
	output wire [6:0] hex1,
	output wire [6:0] hex2,
	output wire [6:0] hex3,
	output wire [6:0] hex4,
	output wire [6:0] hex5,
	output wire [6:0] hex6,
	output wire [6:0] hex7
);

wire [31:0] debug_hex;
wire enable_hex = 1'b1;

wire ic_read_ack;
wire [31:0] ic_read_data;
reg [31:0] ic_read_addr;

arbiter arbiter(
	.clk(clk),
	.reset(reset),
	// IF Stage (ic)
	.ic_read_req(1),
	.ic_read_ack(ic_read_ack),
	.ic_read_addr(ic_read_addr),
	.ic_read_data(ic_read_data),
	// MEM Stage (dc)
	.dc_read_req(0),
	//output reg dc_read_ack,
	.dc_read_addr(0),
	//output reg [31:0] dc_read_data,
	.dc_write_req(0),
	//output reg dc_write_ack,
	.dc_write_addr(0),
	.dc_write_data(0),
	// IOCTRL Interface
	.mem_read(mem_read),
	.mem_write(mem_write),
	.mem_ack(mem_ack),
	.mem_addr(mem_addr),
	.mem_data_write(mem_write_data),
	.mem_data_read(mem_read_data)
);

always @(posedge clk or posedge reset) begin
	if (reset) begin
		ic_read_addr <= 0;
	end else begin
		if (ic_read_ack) begin
			ic_read_addr <= ic_read_addr + 32'd4;
		end
	end
end

assign debug_hex = ic_read_addr;

//pc pc (
//	.clk(clk),
//	.reset(reset),
//	.we(pc_we),
//	.is_jump(ex_isjump),
//	.is_kernel(cop_reset),
//	.is_branch(pc_take_branch & ~mem_bp_opinion),
//	.is_eret(ex_exc_ret),
//	.is_bpredictor(if_bp_opinion & if_bp_btaken),
//	.is_misspred(bp_misspredicted),
//	.dst_nextpc(if_pc_next),
//	.dst_jump(dst_jump),
//	.dst_branch(mem_pc_branch),
//	.dst_kernel(address_kernel),
//	.dst_eret(epc),
//	.dst_prediction(if_bp_addr),
//	.dst_misspred(bp_misspredicted_addr),
//	.initial_pc(32'd0),
//	.pc_out(pc_out)
//);
//
//if_stage if_stage (
//	.clk(clk),
//	.reset(if_reset),
//	// Inputs
//	.pc(),
//	// Outputs
//	.instr(),
//	.pc_next()
//	// Shared
//	.addr(),
//	.data()
//);
//
//id_stage id_stage (
//	.clk(clk),
//	.reset(id_reset),
//	// Inputs
//	.instr(),
//	.pc_next_in(),
//	// Outputs
//	.pc_next_out(),
//);
//
//ex_stage ex_stage (
//	.clk(clk),
//	.reset(ex_reset),
//	// Inputs
//	.pc_next(),
//	// Outputs
//);
//
//mem_stage mem_stage (
//	.clk(clk),
//	.reset(mem_reset),
//	// Inputs
//	// Outputs
//);
//
//wb_stage wb_stage (
//	.clk(clk),
//	.reset(wb_reset),
//	// Inputs
//	// Outputs
//);


segments_converter data_conv0 (
	.enable(enable_hex),
	.value(debug_hex[3:0]),
	.value_converted(hex0)
);

segments_converter data_conv1 (
	.enable(enable_hex),
	.value(debug_hex[7:4]),
	.value_converted(hex1)
);

segments_converter data_conv2 (
	.enable(enable_hex),
	.value(debug_hex[11:8]),
	.value_converted(hex2)
);

segments_converter data_conv3 (
	.enable(enable_hex),
	.value(debug_hex[15:12]),
	.value_converted(hex3)
);

segments_converter data_conv4 (
	.enable(enable_hex),
	.value(debug_hex[19:16]),
	.value_converted(hex4)
);

segments_converter data_conv5 (
	.enable(enable_hex),
	.value(debug_hex[23:20]),
	.value_converted(hex5)
);

segments_converter addr_conv6 (
	.enable(enable_hex),
	.value(debug_hex[27:24]),
	.value_converted(hex6)
);

segments_converter addr_conv7 (
	.enable(enable_hex),
	.value(debug_hex[31:28]),
	.value_converted(hex7)
);

endmodule
