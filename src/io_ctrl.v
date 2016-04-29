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
    output reg [19:0] sram_addr = 0,
    inout wire [15:0] sram_dq,
    output reg sram_we_n = 1,
    output reg sram_oe_n = 1,
    output wire sram_ub_n,
    output wire sram_lb_n,
    output wire sram_ce_n,
    // 7-Segment display
    output reg [6:0] hex0 = 0,
    output reg [6:0] hex1 = 0,
    output reg [6:0] hex2 = 0,
    output reg [6:0] hex3 = 0,
    output reg [6:0] hex4 = 0,
    output reg [6:0] hex5 = 0,
    output reg [6:0] hex6 = 0,
    output reg [6:0] hex7 = 0,
    // Buttons
    input wire [3:0] key,
    // Red LEDs
    output reg [17:0] ledr = 0,
    // Green LEDs
    output reg [8:0] ledg = 0,
    // =======================
    // Interface with ACE Core
    // =======================
    input wire mem_read,
    input wire mem_write,
    output reg mem_ack,
    input wire [31:0] mem_addr,
    output reg [31:0] mem_read_data,
    input wire [31:0] mem_write_data,
	 output reg [3:0] state
);

localparam [2:0] state_idle     = 3'b000,
                 state_read_lo  = 3'b010,
                 state_read_hi  = 3'b011,
                 state_write_lo = 3'b100,
                 state_write_hi = 3'b101;

localparam select_read  = 1'b0,
           select_write = 1'b0;

reg [3:0] state_next;

reg [31:0] addr_next;
reg we_next, oe_next, ce_next;
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
end

always @* begin
    case (state)
        state_idle: begin
            ack_next <= 1'b0; // Acknowledgement is maintained during one cycle
                read_data_next <= 32'b0;
            if (mem_read) begin
                state_next <= state_read_lo;
                addr_next <= mem_addr[19:0];
                select_next <= select_read;
                oe_next <= 1'b0;
                ce_next <= 1'b0;
            end else if (mem_write) begin
                state_next <= state_write_lo;
                addr_next <= mem_addr[19:0];
                select_next <= select_write;
                write_data_next <= mem_write_data[15:0];
                we_next <= 1'b0;
            end
        end
        state_read_lo: begin
            state_next <= state_read_hi;
            addr_next <= mem_addr[19:0] + 2;
            read_data_next[15:0] <= sram_dq;
        end
        state_read_hi: begin
            state_next <= state_idle;
            read_data_next[31:16] <= sram_dq;
            addr_next <= 20'b0;
            ack_next <= 1'b1;
            oe_next <= 1'b1;
        end
        state_write_lo: begin
            state_next <= state_write_hi;
            addr_next <= mem_addr[19:0] + 2;
            write_data_next <= mem_write_data[31:16];
        end
        state_write_hi: begin
            state_next <= state_idle;
            addr_next <= 20'b0;
            ack_next <= 1'b1;
            write_data_next <= 16'b0;
            we_next <= 1'b1;
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

endmodule
