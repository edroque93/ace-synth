module cpu (
    input wire clk,
    input wire reset,

    output reg mem_read,
    output reg mem_write,
    input wire mem_ack,
    output reg [31:0] mem_addr,
    input wire [31:0] mem_read_data,
    output reg [31:0] mem_write_data,
	 output reg [1:0] state
);

localparam [1:0] state_pre_write   = 2'b00,
                 state_write       = 2'b01,
                 state_pre_read  = 2'b10,
                 state_read      = 2'b11;

always @(posedge clk) begin
    case (state)
        state_pre_write: begin
            state <= state_write;
            mem_write <= 1;
        end
        state_write: begin
            if (mem_ack) begin
                state <= state_pre_read;
                mem_write <= 0;
                mem_read <= 0;
            end
        end
        state_pre_read: begin
            state <= state_read;
            mem_read <= 1;
        end
        state_read: begin
            if (mem_ack) begin
                state <= state_pre_write;
                mem_write <= 0;
                mem_read <= 0;
                mem_addr <= mem_addr + 4;
                mem_write_data <= mem_write_data + 4;
            end
        end
    endcase
end

endmodule
