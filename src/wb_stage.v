module wb_stage (
	input wire clk,
	input wire reset,
	input wire we,
	// Control signals
	// - Forward
	output reg [4:0]  reg_probe,
	output reg [31:0] data_probe,
	output reg 	  write_probe,
	// Inputs
	input wire [31:0] reg_data,
	input wire [4:0]  reg_addr,
	input wire 	  reg_write,
	// Feedback
	output reg [31:0] reg_data_out,
	output reg [4:0]  reg_addr_out,
	output reg 	  reg_write_out
);

always @(posedge clk) begin
   if(reset) begin
      reg_probe <= 0;
      data_probe <= 0;
      write_probe <= 0;
      reg_data_out <= 0;
      reg_addr_out <= 0;
      reg_write_out <= 0;
   end else begin
	 if(we) begin
	    reg_probe <= reg_addr;
	    data_probe <= reg_data;
	    write_probe <= reg_write;
	    reg_data_out <= reg_data;
	    reg_addr_out <= reg_addr;
	    reg_write_out <= reg_write;
      end
   end
end

endmodule
