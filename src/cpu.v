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



// DEBUG every time you use this to debug a kitten dies

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
