module hamming_secded_top(
    input [3:0]i_secded, 
    input [4:0]i_noise,
    output [6:0]o_7seg,
    output [3:0] o_secded,
    output  o_1bit_error,
    output o_2bit_error,
    output o_parity_error
);
// internal loguic(glue logic)
wire [6:0]enc_hamming_code;  // output of the hamming encoder
wire enc_parity;

wire [6:0] o_noise_hamming_code;  // output of the noise module 
wire    o_noise_parity;

wire [6:0] o_syndrome;  // output of the hamming decoder
wire [2:0]in_7seg;  // input for the 7segment display decoder

// instantiate 74_hamming encoder
 hamming_74_enco  m1(.i_data(i_secded),.o_hamming_code(enc_hamming_code),.o_parity(enc_parity));

// instantiate a noise  adder module 
 noise_adder  m2(.i_data({enc_parity,enc_hamming_code}),
 .i_noise(i_noise),
 .o_data({o_noise_parity,o_noise_hamming_code}));


// instantiate a hamming 74 decoder 
 hamming_74_dec m3(
.i_data(o_noise_hamming_code),
.i_parity(o_noise_parity),
.o_syndrome(o_syndrome),
.o_data(o_secded),
.o_1bit_error(o_1bit_error),
.o_2bit_error(o_2bit_error),
.o_parity_error(o_parity_error)
 );

// instantiate a 8_to_3 priority encoder
 priority_encoder m4(
.d({1'b0,o_syndrome}),
.q(in_7seg),
.v()   // left floating we don't use it 
);

// instantiate a HEX 7 SEGMENT decoder 
hex_7seg_decoder m5(
// // #(parameter COMMON_ANODE_CATHODE = 1) (in,o_a,o_b,o_c,o_d,o_e,o_f,o_g); // 0 for common anode and 1 for common cathode
.in({1'b0,in_7seg}),
.o_a(o_7seg[0]),
.o_b(o_7seg[1]),
.o_c(o_7seg[2]),
.o_d(o_7seg[3]),
.o_e(o_7seg[4]),
.o_f(o_7seg[5]),
.o_g(o_7seg[6])
);

endmodule 

