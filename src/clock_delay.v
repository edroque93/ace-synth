module clock_delay (
    input wire clk,
    output reg clk_new = 0
);

parameter [31:0] max = 10_000_000; // edit

reg [31:0] counter = 32'b0;

always @(posedge clk) begin
    if (counter == max) begin
        counter <= 32'b0;
        clk_new <= ~clk_new;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
