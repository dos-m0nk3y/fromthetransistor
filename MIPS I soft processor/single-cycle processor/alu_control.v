module alu_control (
    input  wire [1:0] opcode_i,
    input  wire [5:0] funct_i,
    output reg  [4:0] operation_o
);

  always @(*) begin
    case (opcode_i)
      2'b00: begin
        case (funct_i)
          6'b100001: operation_o = 5'b00100;
          6'b100011: operation_o = 5'b01100;
          6'b100100: operation_o = 5'b00000;
          6'b100101: operation_o = 5'b00001;
          6'b100110: operation_o = 5'b00010;
          6'b100111: operation_o = 5'b11000;
          6'b101011: operation_o = 5'b01011;
          default:   operation_o = 5'b00000;
        endcase
      end
      default: operation_o = 5'b00000;
    endcase
  end

endmodule
