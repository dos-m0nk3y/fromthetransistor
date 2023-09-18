module cpu_control (
    input wire [5:0] cpu_opcode_i,
    output reg wr_reg_sel_o,
    output reg reg_wr_en_o,
    output reg [1:0] alu_opcode_o
);

  always @(*) begin
    case (cpu_opcode_i)
      6'b000000: begin
        wr_reg_sel_o = 1;
        reg_wr_en_o  = 1;
        alu_opcode_o = 2'b00;
      end
      default: begin
        wr_reg_sel_o = 0;
        reg_wr_en_o  = 0;
        alu_opcode_o = 2'b00;
      end
    endcase
  end

endmodule
