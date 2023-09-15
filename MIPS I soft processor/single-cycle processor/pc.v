module pc (
    input wire CLK100MHZ,
    input wire ck_rst,
    input wire [31:0] pc_i,
    output reg [31:0] pc_o
);

  always @(posedge CLK100MHZ or negedge ck_rst) begin
    if (!ck_rst) pc_o <= 32'h00000000;
    else pc_o <= pc_i;
  end

endmodule
