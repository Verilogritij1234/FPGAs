`timescale 1ns/1ps
module stimulus;
 parameter N = 4;
 reg [N-1:0] i_switch;
 wire [N-1:0] o_led;

 switches_to_LED #(N) uut(i_switch,o_led);

  initial begin
$dumpfile("dump.vcd");
 $dumpvars(0, stimulus);
$monitor($time,"i_switch = %b,o_led = %b",i_switch,o_led);

#5 i_switch = 4'b0000;
#5 i_switch = 4'b0100;
#5 i_switch = 4'b1010;
#5 i_switch = 4'b0101;
#5 i_switch = 4'b1010;
#10 $finish;
end
endmodule



// iverilog -o switches_LED_tb.out switches_LED.v switches_LED_tb.v
// vvp switches_LED_tb.out

// gtkwave dump.vcd
