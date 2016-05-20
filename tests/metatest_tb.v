`include "test_macros.v"

module metatest_tb();

initial begin
	`TEST_SUITE(("These tests should all work"))
	`ASSERT_OK(0 == 0, ("Zero equals zero"))
	`ASSERT_OK(1 == 1, ("One equals one"))
	`ASSERT_OK(0 != 1, ("Zero is different than one"))
	`ASSERT_OK(1+1 == 2, ("One plus one is two"))

	`TEST_SUITE(("These tests should all fail"))
	`ASSERT_OK(0 != 0, ("Zero is different than zero"))
	`ASSERT_OK(1 != 1, ("One is different than one"))
	`ASSERT_OK(0 == 1, ("Zero equals one"))
	`ASSERT_OK(1+1 != 2, ("One plus one is different than two"))
	$finish;
end

endmodule
