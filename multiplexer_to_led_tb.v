`timescale 1us/1ns
module stimulus;
parameter N = 4;
reg [N-1:0]i_a;
reg [N-1:0]i_b;
reg i_sel;
wire [N-1:0]o_y;

multiplexer_to_led #(N) uut(i_a,i_b,i_sel,o_y);


  initial begin
$dumpfile("mmultiplexer_to_led.vcd");
 $dumpvars(0, stimulus);
$monitor($time,"A = %d, B = %d, SELECT = %d, Y = %d",i_a,i_b,i_sel,o_y);
#5 i_sel = 0; i_a = 4'b0;  i_b = ~i_a;
for (integer i  = 0;i<8;i++) begin
    #5; i_sel = ~i_sel; i_a = $random; i_b = $random;
end
end
endmodule


// iverilog -o multiplexer_to_led_tb.out multiplexer_to_led.v multiplexer_to_led_tb.v
// vvp multiplexer_to_led_tb.out
// dumpfile("dump.vcd");
// dumpvars(0, stimulus);
// gtkwave mmultiplexer_to_led.vcd
