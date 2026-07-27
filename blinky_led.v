module blinky_led 
#(parameter CLOCK_FREQ = 50_000_000,
  parameter LED_FREQ = 2,
  parameter BUS_WIDTH = 4)
  (
input clk,
input rst_n,
output [BUS_WIDTH-1:0]o_LED
);


// following parameters will help us calculate the width of the counter 
function integer clogb2(input[31:0]value);    // function used instead of $log2 
integer i;
begin
    clogb2 = 0;
    for ( i= 0;2**i<value ;i = i+1 ) begin
        clogb2 = i+1;
    end
end
endfunction
localparam FREQ_RATIO =(CLOCK_FREQ+LED_FREQ-1)/LED_FREQ; // equivalent of $ceil(CLOCK_FREQ/LED_FREQ)
localparam CNT_WIDTH = clogb2(FREQ_RATIO);
localparam CNT_MAX = (FREQ_RATIO>>1)-1; //from 0 to 99 there are 100 clocks

// internal logic
reg [CNT_WIDTH-1:0]counter;
reg [BUS_WIDTH-1:0]LED;

wire counter_max;
assign counter_max = (counter == CNT_MAX);  // comparator for the max value 

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
    counter <=0;
    else if(counter_max)
    counter  <= 0;
    else
    counter <= counter+1'b1;

end

// Register used to toggle the LEDs
always @(posedge clk or negedge rst_n) begin
    if(!rst_n)
    LED<=0;
    else if (counter_max)
    LED <= ~LED;
end
assign o_LED = ~LED;  // connect output port with internal register 
endmodule 