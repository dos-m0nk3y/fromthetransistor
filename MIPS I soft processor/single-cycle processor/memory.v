module memory (
    input wire clk,
    input wire rd_en_i,
    input wire wr_en_i,
    input wire [31:0] mem_addr_i,
    input wire [31:0] wr_data_i,
    output wire [31:0] rd_data_o
);

  reg [3:0] wea;

  bram i_bram (
      .clka (clk),
      .wea  (wea),
      .addra(mem_addr_i),
      .dina (wr_data_i),
      .douta(rd_data_o)
  );

  always @(posedge clk) begin
    if (rd_en_i) wea <= 4'b0000;
    else if (wr_en_i) wea <= 4'b1111;
  end

endmodule
