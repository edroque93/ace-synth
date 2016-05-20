
`define TEST_SUITE(MSG) begin $display MSG ; end

`define ASSERT_OK(COND, MSG) begin if (!(COND)) begin $write("- Assertion failed: "); $display MSG ; end end

