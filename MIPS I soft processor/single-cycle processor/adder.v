module adder (
    input  wire [31:0] a_i,
    input  wire [31:0] b_i,
    output wire [31:0] s_o
);

  assign s_o = a_i + b_i;

endmodule
