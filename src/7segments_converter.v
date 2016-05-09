module segments_converter(
	input wire enable,
	input wire [3:0] value,
	output reg [6:0] value_converted
);

always @* begin
	if (enable) begin
		case(value)
			0: value_converted <= 7'b1000000;
			1: value_converted <= 7'b1111001;
			2: value_converted <= 7'b0100100;
			3: value_converted <= 7'b0110000;
			4: value_converted <= 7'b0011001;
			5: value_converted <= 7'b0010010;
			6: value_converted <= 7'b0000010;
			7: value_converted <= 7'b1111000;
			8: value_converted <= 7'b0000000;
			9: value_converted <= 7'b0011000;
			10: value_converted <= 7'b0001000; // A
			11: value_converted <= 7'b0000011; // B
			12: value_converted <= 7'b1000110; // C
			13: value_converted <= 7'b0100001; // D
			14: value_converted <= 7'b0000110; // E
			15: value_converted <= 7'b0001110; // F
			default: value_converted <= 7'b1111111;
		endcase
	end else begin
		value_converted <= 7'b1111111;
	end
end

endmodule
