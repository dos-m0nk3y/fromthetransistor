module pc (
    input wire clk,
    input wire rst,
    input wire [31:0] pc_i,
    output reg [31:0] pc_o
);

  always @(posedge clk) begin
    if (!rst) pc_o <= 32'h00000000;
    else pc_o <= pc_i;
  end

endmodule
