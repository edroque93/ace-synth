library verilog;
use verilog.vl_types.all;
entity ace is
    port(
        clock_50        : in     vl_logic;
        sw              : in     vl_logic_vector(17 downto 0);
        sram_addr       : out    vl_logic_vector(19 downto 0);
        sram_dq         : inout  vl_logic_vector(15 downto 0);
        sram_we_n       : out    vl_logic;
        sram_oe_n       : out    vl_logic;
        sram_ub_n       : out    vl_logic;
        sram_lb_n       : out    vl_logic;
        sram_ce_n       : out    vl_logic;
        hex0            : out    vl_logic_vector(6 downto 0);
        hex1            : out    vl_logic_vector(6 downto 0);
        hex2            : out    vl_logic_vector(6 downto 0);
        hex3            : out    vl_logic_vector(6 downto 0);
        hex4            : out    vl_logic_vector(6 downto 0);
        hex5            : out    vl_logic_vector(6 downto 0);
        hex6            : out    vl_logic_vector(6 downto 0);
        hex7            : out    vl_logic_vector(6 downto 0);
        key             : in     vl_logic_vector(3 downto 0);
        ledr            : out    vl_logic_vector(17 downto 0);
        ledg            : out    vl_logic_vector(8 downto 0)
    );
end ace;
