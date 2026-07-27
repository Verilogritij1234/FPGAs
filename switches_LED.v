module switches_LED #(parameter N = 4)(i_switch,o_led);

    input [N-1:0] i_switch;
    output [N-1:0] o_led;
    assign  o_led = i_switch;
endmodule