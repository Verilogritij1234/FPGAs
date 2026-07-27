`timescale 1us/1ns
module stimulus;
reg [3:0]in;
wire a,b,c,d,e,f,g;
integer i;  //  will used in for loop 
hex_7seg_decoder uut(
.in(in),
.o_a(a),
.o_b(b),
.o_c(c),
.o_d(d),
.o_e(e),
.o_f(f),
.o_g(g)
);

wire [6:0] seven_seg_code;
assign seven_seg_code = {a,b,c,d,e,f,g};

initial begin
  $monitor($time,"in = %d, seven_seg_code = %7b", in, seven_seg_code);
#5; in = 0;
    for (i = 0;i<16;i = i+1) begin
        #5; in <= i;
    end
end
endmodule

// iverilog -o hex_7seg_decoder_tb.out hex_7seg_decoder.v hex_7seg_decoder_tb.v
// vvp hex_7seg_decoder_tb.out
// dumpfile("dump.vcd");
// dumpvars(0, stimulus);
// gtkwave dump.vcd
