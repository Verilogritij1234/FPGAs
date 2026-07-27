// 2_to_1 multiplexer
module multiplexer_to_led #(parameter N = 4)(i_a,i_b,i_sel,o_y);
input [N-1:0]i_a;
input [N-1:0]i_b;
input i_sel;
output [N-1:0]o_y;
assign o_y = i_sel ? i_b:i_a;  // ternary operator
endmodule 





