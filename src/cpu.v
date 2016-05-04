module cpu (
    input wire clk,
    input wire reset,

    output reg mem_read,
    output reg mem_write,
    input wire mem_ack,
    output reg [31:0] mem_addr,
    input wire [31:0] mem_read_data,
    output reg [31:0] mem_write_data,
	 output reg [1:0] state,
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

reg [1:0] next;
reg enable_hex;
reg [31:0] word_sram;
reg [31:0] addr_inc;

// Manual testing
//always @(posedge clk or posedge reset) begin
//	if (reset) begin
//		next       <= 1'd0;
//		enable_hex <= 1'd0;
//		word_sram  <= 32'hFFFFFFFF;
//		addr_inc   <= 32'h0010000C; // ledr
//		mem_read   <= 1'd0;
//		mem_write  <= 1'd0;
//	end else begin
//		if (next == 0) begin
//			mem_read   <= 1'd0;
//			mem_write  <= 1'd1;
//			mem_addr   <= addr_inc;
//			mem_write_data <= 32'b0101_0101_0101_0101_0101;
//			next       <= 1'd1;
//			enable_hex <= 1'd0;
//		end else begin
//			mem_write <= 1'd0;
//			mem_read  <= 1'd0;
//			if (mem_ack) begin	
//				word_sram  <= mem_read_data;
//				enable_hex <= 1'd0;
//			end
//		end
//	end
//end

// Write, read, show
always @(posedge clk or posedge reset) begin
	if (reset) begin
		next       <= 2'd0;
		enable_hex <= 1'd0;
		word_sram  <= 32'hFFFFFFFF;
		addr_inc   <= 32'h0010000C;
		mem_read   <= 1'd0;
		mem_write  <= 1'd0;
	end else begin
		if (next == 0) begin
			mem_read   <= 1'd0;
			mem_write  <= 1'd1;
			mem_addr   <= addr_inc;
			mem_write_data <= 32'h1337;
			next       <= 2'd1;
			enable_hex <= 1'd0;
		end else if (next == 1) begin
			mem_write <= 1'd0;
			mem_read  <= 1'd0;
			if (mem_ack) begin	
				word_sram  <= mem_read_data;
				enable_hex <= 1'd0;
				next <= 2'd2;
			end
		end else if (next == 2) begin
			mem_read   <= 1'd1;
			mem_write  <= 1'd0;
			mem_addr   <= addr_inc;
			next       <= 2'd3;
			enable_hex <= 1'd0;
		end else if (next == 3) begin
			mem_write <= 1'd0;
			mem_read  <= 1'd0;
			next <= 2'd3;
			if (mem_ack) begin	
				word_sram  <= mem_read_data;
				enable_hex <= 1'd1;
			end
		end
	end
end

segments_converter data_conv0 (
	.enable(enable_hex),
	.value(word_sram[3:0]),
	.value_converted(hex0)
);

segments_converter data_conv1 (
	.enable(enable_hex),
	.value(word_sram[7:4]),
	.value_converted(hex1)
);

segments_converter data_conv2 (
	.enable(enable_hex),
	.value(word_sram[11:8]),
	.value_converted(hex2)
);

segments_converter data_conv3 (
	.enable(enable_hex),
	.value(word_sram[15:12]),
	.value_converted(hex3)
);

segments_converter data_conv4 (
	.enable(enable_hex),
	.value(word_sram[19:16]),
	.value_converted(hex4)
);

segments_converter data_conv5 (
	.enable(enable_hex),
	.value(word_sram[23:20]),
	.value_converted(hex5)
);

segments_converter addr_conv6 (
	.enable(enable_hex),
	.value(word_sram[27:24]),
	.value_converted(hex6)
);

segments_converter addr_conv7 (
	.enable(enable_hex),
	.value(word_sram[31:28]),
	.value_converted(hex7)
);

endmodule
