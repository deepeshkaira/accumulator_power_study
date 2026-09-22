/// accumulator with OVERFLOW
`timescale 1ns/1ps

module accumulator_power_gated (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        enable,
    input  logic [31:0] data_in,
    output logic [31:0] acc_out,
    output logic        overflow
);

    logic [32:0] extended_sum;
    logic [31:0] data_in_gated;
	
	assign data_in_gated = enable ? data_in : '0;

    // carry beyond unsinged.
    assign extended_sum = {1'b0, acc_out} + {1'b0, data_in_gated};

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            acc_out  <= 32'b0;
            overflow <= 1'b0;
        end else if (enable) begin
            acc_out  <= extended_sum[31:0];
            overflow <= extended_sum[32];
        end else begin
            overflow <= 1'b0;
        end
    end

endmodule
