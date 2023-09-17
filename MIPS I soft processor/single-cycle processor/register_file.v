module register_file (
    input wire clk,
    input wire rst,
    input wire wr_en_i,
    input wire [4:0] rd_reg1_num_i,
    input wire [4:0] rd_reg2_num_i,
    input wire [4:0] wr_reg_num_i,
    input wire [31:0] wr_data_i,
    output wire [31:0] reg1_data_o,
    output wire [31:0] reg2_data_o
);

  reg [31:0] registers[0:31];

  assign reg1_data_o = registers[rd_reg1_num_i];
  assign reg2_data_o = registers[rd_reg2_num_i];

  integer i;
  always @(posedge clk) begin
    if (!rst) begin
      for (i = 0; i < 32; i = i + 1) registers[i] <= 32'h00000000;
    end else if (wr_en_i && wr_reg_num_i) registers[wr_reg_num_i] <= wr_data_i;
  end

endmodule
