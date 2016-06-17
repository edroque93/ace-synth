module wb_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// Inputs
	input wire [31:0] reg_data,
	input wire [4:0]  reg_addr,
	input wire 	  reg_write,
	// Feedback
	output reg [31:0] reg_data_out,
	output reg [4:0]  reg_addr_out,
	output reg 	  reg_write_out
);

always @(*) begin
   if(reset) begin
      reg_data_out <= 0;
      reg_addr_out <= 0;
      reg_write_out <= 0;
   end else begin
	    reg_data_out <= reg_data;
	    reg_addr_out <= reg_addr;
	    reg_write_out <= reg_write;
   end
end

endmodule
