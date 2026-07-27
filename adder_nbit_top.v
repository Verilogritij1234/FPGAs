module adder_nbit_top #(parameter N = 3)(
    input [N-1:0]i_a,
    input [N-1:0]i_b, 
    output [N:0]o_sum,  //  sum in binary 
    output [6:0]O_HEX  // sum in hexadecimal 
);
// instantiation of  first module which give output in binary
adder_nbit #(.N(N)) m1(.a(i_a),.b(i_b),.sum(o_sum));

  // Internal wire for seven-seg outputs
  wire [6:0] seg_out;
// instantiation of second  module which give output in hexadecimal 
 hex_7seg_decoder #(.COMMON_ANODE_CATHODE(1)) m2(
 .in(o_sum[3:0]),
.o_a(seg_out[6]),
.o_b(seg_out[5]),
.o_c(seg_out[4]),
.o_d(seg_out[3]),
.o_e(seg_out[2]),
.o_f(seg_out[1]),
.o_g(seg_out[0])
);

// Drive top-level output
  assign O_HEX = seg_out;

endmodule
