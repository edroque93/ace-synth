module ace (
    input wire clock_50,
    // Switches
    input wire [9:0] sw,
    // DRAM
    output wire [11:0] dram_addr,
    output wire [1:0] dram_ba,
    output wire dram_cas_n,
    output wire dram_cke,
    output wire dram_clk,
    output wire dram_cs_n,
    inout  wire [15:0] dram_dq,
    output wire dram_ldqm,
    output wire dram_udqm,
    output wire dram_ras_n,
    output wire dram_we_n,
    // 7-Segment display
    output wire [6:0] hex0,
    output wire [6:0] hex1,
    output wire [6:0] hex2,
    output wire [6:0] hex3,
    // Buttons
    input wire [3:0] key,
    // Red LEDs
    output wire [9:0] ledr,
    // Green LEDs
    output wire [7:0] ledg
);

// TODO

endmodule
