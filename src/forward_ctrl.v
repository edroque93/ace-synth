module forward_ctrl (
	input wire [4:0] rs,
	input wire [4:0] rt,
	input wire [4:0] ex_reg,
	input wire [4:0] mem_reg,
	input wire [4:0] wb_reg,
	input wire ex_write,
	input wire mem_write,
	input wire wb_write,
	output reg [1:0] ctrl_rs,
	output reg [1:0] ctrl_rt
);

// 00 -> Regfile
// 01 -> Ex data
// 10 -> Mem data
// 11 -> Wb data

always @* begin
	// Default
    
	ctrl_rs = 2'b0;
	ctrl_rt = 2'b0;

	// WB hazards

	if (wb_write && (wb_reg != 5'b0) && (wb_reg == rs)) 
		ctrl_rs = 2'b11;

	if (wb_write && (wb_reg != 5'b0) && (wb_reg == rt))
		ctrl_rt = 2'b11;

	// MEM hazards

	if (mem_write && (mem_reg != 5'b0) && (mem_reg == rs))
		ctrl_rs = 2'b10;

	if (mem_write && (mem_reg != 5'b0) && (mem_reg == rt))
		ctrl_rt = 2'b10;

	// EX hazards
	
	if (ex_write && (ex_reg != 5'b0) && (ex_reg == rs))
		ctrl_rs = 2'b01;

	if (ex_write && (ex_reg != 5'b0) && (ex_reg == rt))
		ctrl_rt = 2'b01;

end

endmodule
