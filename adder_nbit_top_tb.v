`timescale 1us/1ns
module stimulus;
 localparam N =3;
    reg [N-1:0]i_a;
    reg [N-1:0]i_b; 
    wire [N:0]o_sum;  //  sum in binary 
    wire [6:0]o_HEX;  // sum in hexadecimal 
// instantiation of  first module which give output in binary
adder_nbit_top  #(.N(3)) TOP(i_a,i_b,o_sum,o_HEX);

initial begin
     $dumpfile("nbit_adder_top.vcd");
      $dumpvars(0, stimulus);
$monitor($time,"i_a = %d,    i_b = %d,    o_sum = %d,  segmented_display = %b",i_a,i_b,o_sum,o_HEX);
#1; i_a = 0; i_b = 0;
for (integer i = 0 ;i<2**N;i++) begin
    for (integer j  = 0;j<2**N ;j++) begin
        #1; i_a =i; i_b = j;
    end
end
end
endmodule

// iverilog -o adder_nbit_top_tb.out adder_nbit_top.v adder_nbit.v hex_7seg_decoder.v  adder_nbit_top_tb.v
// vvp adder_nbit_top_tb.out
// dumpfile("dump.vcd");
// dumpvars(0, stimulus);
// gtkwave nbit_adder_top.vcd
