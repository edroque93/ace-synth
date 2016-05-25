module flow_ctrl(
		 input wire reset,
		 input wire dc_stall,
		 input wire is_branch,
		 input wire is_jump,
		 input wire hzd_stall,
		 input wire ic_stall,
		 output reg pc_we,
		 output reg pc_reset,
		 output reg if_we,
		 output reg if_reset,
		 output reg id_we,
		 output reg id_reset,
		 output reg ex_we,
		 output reg ex_reset,
		 output reg mem_we,
		 output reg mem_reset,
		 output reg wb_we,
		 output reg wb_reset
		 );

   always @* begin
      if (reset) begin
	 pc_reset     <= 1'b1;
	 pc_we        <= 1'b1;
	 if_reset  <= 1'b1;
	 if_we     <= 1'b1;
	 id_reset  <= 1'b1;
	 id_we     <= 1'b1;
	 ex_reset <= 1'b1;
	 ex_we    <= 1'b1;
	 mem_reset <= 1'b1;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b1;
	 wb_we    <= 1'b1;
      end else if (dc_stall) begin
	 pc_reset     <= 1'b0;
	 pc_we        <= 1'b0;
	 if_reset  <= 1'b0;
	 if_we     <= 1'b0;
	 id_reset  <= 1'b0;
	 id_we     <= 1'b0;
	 ex_reset <= 1'b0;
	 ex_we    <= 1'b0;
	 mem_reset <= 1'b1;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b0;
	 wb_we    <= 1'b0;
      end else if (is_branch) begin
	 pc_reset     <= 1'b0;
	 pc_we        <= 1'b1;
	 if_reset  <= 1'b1;
	 if_we     <= 1'b1;
	 id_reset  <= 1'b1;
	 id_we     <= 1'b1;
	 ex_reset <= 1'b1;
	 ex_we    <= 1'b1;
	 mem_reset <= 1'b0;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b0;
	 wb_we    <= 1'b1;
      end else if (is_jump) begin
	 pc_reset     <= 1'b0;
	 pc_we        <= 1'b1;
	 if_reset  <= 1'b1;
	 if_we     <= 1'b1;
	 id_reset  <= 1'b1;
	 id_we     <= 1'b1;
	 ex_reset <= 1'b0;
	 ex_we    <= 1'b1;
	 mem_reset <= 1'b0;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b0;
	 wb_we    <= 1'b1;
      end else if (hzd_stall) begin
	 pc_reset     <= 1'b0;
	 pc_we        <= 1'b0;
	 if_reset  <= 1'b0;
	 if_we     <= 1'b0;
	 id_reset  <= 1'b1;
	 id_we     <= 1'b1;
	 ex_reset <= 1'b0;
	 ex_we    <= 1'b1;
	 mem_reset <= 1'b0;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b0;
	 wb_we    <= 1'b1;
      end  else if (ic_stall) begin
	 pc_reset     <= 1'b0;
	 pc_we        <= 1'b0;
	 if_reset  <= 1'b1;
	 if_we     <= 1'b1;
	 id_reset  <= 1'b0;
	 id_we     <= 1'b1;
	 ex_reset <= 1'b0;
	 ex_we    <= 1'b1;
	 mem_reset <= 1'b0;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b0;
	 wb_we    <= 1'b1;
      end else begin
	 pc_reset     <= 1'b0;
	 pc_we        <= 1'b1;
	 if_reset  <= 1'b0;
	 if_we     <= 1'b1;
	 id_reset  <= 1'b0;
	 id_we     <= 1'b1;
	 ex_reset <= 1'b0;
	 ex_we    <= 1'b1;
	 mem_reset <= 1'b0;
	 mem_we    <= 1'b1;
	 wb_reset <= 1'b0;
	 wb_we    <= 1'b1;
      end
   end

endmodule
