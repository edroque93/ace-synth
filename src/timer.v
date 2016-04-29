// 
// Timer info & pinout
// 
// Description:
//
// This unit is synchronous. It raises a signal for one cycle
// after the count is completed.
// 
// Ports:
// clk - clock signal for the timer
// match - match register
// signal - output signal
// 
module timer(
	input wire clk,
	input wire [N-1:0] match,
	output reg signal = 1'd0
);

parameter N = 32;
reg [N-1:0] count = {N{1'd0}};

always @(posedge clk) begin
	if (count == match) begin
		count <= {N{1'd0}};
		signal <= ~signal;
	end else begin
		count <= count + 1;
	end
end

endmodule
