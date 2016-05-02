// ============================
// IO Controller for Altera DE2
// ============================

module io_ctrl(
    // =========================
    // Interface with Altera DE2
    // =========================
    input wire clk,
    input wire reset,
    // Switches
    input wire [9:0] sw,
    // SRAM
    output reg [19:0] sram_addr,
    inout wire [15:0] sram_dq,
    output wire sram_we_n,
    output wire sram_oe_n,
    output wire sram_ub_n,
    output wire sram_lb_n,
    output wire sram_ce_n,
    // 7-Segment display
    output reg [6:0] hex0,
    output reg [6:0] hex1,
    output reg [6:0] hex2,
    output reg [6:0] hex3,
    output reg [6:0] hex4,
    output reg [6:0] hex5,
    output reg [6:0] hex6,
    output reg [6:0] hex7,
    // Buttons
    input wire [3:0] key,
    // Red LEDs
    output reg [17:0] ledr,
    // Green LEDs
    output reg [8:0] ledg,
    // =======================
    // Interface with ACE Core
    // =======================
    input wire mem_read,
    input wire mem_write,
    output reg mem_ack,
    input wire [31:0] mem_addr,
    output reg [31:0] mem_read_data,
    input wire [31:0] mem_write_data,
    output reg [1:0] state
);

localparam [1:0] state_idle  = 2'b00,
                 state_read  = 2'b01,
                 state_write = 2'b10;

localparam select_read  = 1'b0,
           select_write = 1'b0;

reg [1:0] state_next;

reg [31:0] addr_next;
reg we_next, oe_next, ce_next;
reg sram_we, sram_oe;
reg ack_next;
reg [31:0] read_data_next;
reg [15:0] write_data, write_data_next;
reg select, select_next;

always @(posedge clk) begin
    state <= state_next;
    sram_addr <= addr_next;
    select <= select_next;
    mem_ack <= ack_next;
    mem_read_data <= read_data_next;
    write_data <= write_data_next;
	 sram_oe <= oe_next;
	 sram_we <= we_next;
end

always @* begin
    case (state)
        state_idle: begin
            ack_next <= 1'b0; // Acknowledgement is maintained during one cycle
            read_data_next <= 32'b0;
            if (mem_read) begin
                state_next <= state_read;
                addr_next <= mem_addr[19:0];
                select_next <= select_read;
                oe_next <= 1'b1;
            end else if (mem_write) begin
                state_next <= state_write;
                addr_next <= mem_addr[19:0];
                select_next <= select_write;
                write_data_next <= mem_write_data[15:0];
                we_next <= 1'b1;
            end
        end
        state_read: begin
            state_next <= state_idle;
            read_data_next[15:0] <= sram_dq;
            addr_next <= 20'b0;
            ack_next <= 1'b1;
            oe_next <= 1'b0;
        end
        state_write: begin
            state_next <= state_idle;
            addr_next <= 20'b0;
            ack_next <= 1'b1;
            write_data_next <= 16'b0;
            we_next <= 1'b0;
        end
    endcase
end

// select == 0 => read
// select == 1 => write
// connect to high impedance while reading
assign sram_dq = select ? write_data : 16'bz;
assign sram_ub_n = 0;
assign sram_lb_n = 0;
assign sram_ce_n = 0;
assign sram_we_n = ~sram_we;
assign sram_oe_n = ~sram_oe;

endmodule
