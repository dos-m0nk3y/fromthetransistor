module clock (
    input  wire CLK100MHZ,
    input  wire rst,
    output wire CLK200MHZ,
    output reg  RST
);

  wire locked;
  bram_clk i_bram_clk (
      .clk_in (CLK100MHZ),
      .locked (locked),
      .clk_out(CLK200MHZ)
  );

  always @(posedge CLK100MHZ) RST <= locked & rst;

endmodule
