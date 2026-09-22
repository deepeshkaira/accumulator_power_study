/// accumulator with OVERFLOW
`timescale 1ns/1ps

module accumulator_clock_gated (
    input  logic        clk,
    input  logic        rst_n,
    input  logic        enable,
    input  logic [31:0] data_in,
    output logic [31:0] acc_out,
    output logic        overflow
);

	logic gated_clk;
	logic gate_request;
	logic [31:0] data_in_gated;
	logic [32:0] extended_sum;

	assign data_in_gated = enable ? data_in : '0;

	assign acc_out = extended_sum[31:0];
	assign overflow = extended_sum[32];

	assign gate_request = enable | overflow;

	gated_clk u_gate(
	.clk_i(clk),
	.en_i(gate_request),
	.clk_gated_o(gated_clk)
	);

    always_ff @(posedge gated_clk or negedge rst_n) begin
        if (!rst_n) begin
		extended_sum <= 33'b0;
        end else if (enable) begin
		extended_sum <= {1'b0, extended_sum[31:0]} + {1'b0, data_in_gated};
        end else begin
            	extended_sum <= {1'b0, extended_sum [31:0]};
        end
    end

endmodule



// gated clock
module gated_clk (
    input  logic clk_i,
    input  logic en_i,

    output logic clk_gated_o
);

    logic en_latched;

    always_latch begin
        if (!clk_i) begin
            en_latched <= en_i;
        end
    end

	assign clk_gated_o = clk_i & en_latched;

endmodule
