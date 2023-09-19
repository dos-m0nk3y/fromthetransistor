module alu (
    input  wire [ 4:0] operation_i,
    input  wire [31:0] reg1_data_i,
    input  wire [31:0] reg2_data_i,
    output reg  [31:0] res_o
);

  always @(*) begin
    case (operation_i)
      5'b00000: res_o = reg1_data_i & reg2_data_i;
      5'b00001: res_o = reg1_data_i | reg2_data_i;
      5'b00010: res_o = reg1_data_i ^ reg2_data_i;
      5'b00100: res_o = reg1_data_i + reg2_data_i;
      5'b01011: res_o = reg1_data_i < reg2_data_i;
      5'b01100: res_o = reg1_data_i - reg2_data_i;
      5'b11000: res_o = ~(reg1_data_i | reg2_data_i);
      default:  res_o = 32'h00000000;
    endcase
  end

endmodule
