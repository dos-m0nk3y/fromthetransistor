module mux2 #(
    parameter integer WIDTH = 32
) (
    input wire sel_i,
    input wire [WIDTH - 1:0] data0_i,
    input wire [WIDTH - 1:0] data1_i,
    output wire [WIDTH - 1:0] data_o
);

  assign data_o = sel_i == 0 ? data0_i : data1_i;

endmodule
