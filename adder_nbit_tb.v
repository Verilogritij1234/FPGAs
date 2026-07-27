`timescale 1us/1ns
module stimulus;
 parameter ADDER_WIDTH=10;

reg[ADDER_WIDTH-1:0]a;
reg [ADDER_WIDTH-1:0]b;
wire [ADDER_WIDTH:0]sum;
nbit_adder  #(.N(ADDER_WIDTH)) uut(.a(a),.b(b),.sum(sum));

initial begin
$monitor($time,"a = %d, b = %d, sum = %d",a,b,sum);

#1 a = 0; b = 0;
#5 a = 1; b = 99;
#5 a = 33; b = 66;
#5 a = 100; b = 47;
#10 $finish;
end
endmodule

// iverilog -o adder_nbit_tb.out adder_nbit.v adder_nbit_tb.v
// vvp adder_nbit_tb.out
// dumpfile("dump.vcd");
// dumpvars(0, stimulus);
// gtkwave dump.vcd



