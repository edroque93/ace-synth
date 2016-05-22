`include "/home/quique/Documents/15-16/PD/ace-synth/src/defines.v"

module regfile(
	input wire clk,
	input wire reset,
	input wire [ADDR-1:0] rreg1, rreg2,
	output reg [WIDTH-1:0] rdata1 = {WIDTH{1'b0}},
	output reg [WIDTH-1:0] rdata2 = {WIDTH{1'b0}},
	input wire enable,
	input wire [ADDR-1:0] wreg,
	input wire [WIDTH-1:0] wdata
);

parameter WIDTH = 32;
parameter DEPTH = 32;
// Bits used to address a register
localparam ADDR = $clog2(DEPTH);
integer i;

reg [WIDTH-1:0] mem [DEPTH-1:0];

always @* begin
	if (rreg1 == {ADDR{1'b0}})
		rdata1 <= {WIDTH{1'b0}};
	else
		rdata1 <= mem[rreg1][WIDTH-1:0];
end

always @* begin
	if (rreg2 == {ADDR{1'b0}})
		rdata2 <= {WIDTH{1'b0}};
	else
		rdata2 <= mem[rreg2][WIDTH-1:0];
end

always @(posedge clk) begin
	if (reset) begin
		for (i = 0; i < DEPTH; i = i+1) begin
			mem[i] <= {WIDTH{1'b0}};
		end
	end else if (enable && wreg != {ADDR{1'b0}}) begin
		mem[wreg] <= wdata;
	end
end

endmodule

