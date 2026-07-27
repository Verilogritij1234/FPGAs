`define ERROR  1
`define NO_ERROR  0
`timescale 1ns/1ps

module stimulus;

    reg [3:0]i_secded;
    reg [4:0]i_noise;
    wire [6:0]o_7seg;
    wire  [3:0] o_secded;
    wire   o_1bit_error;
    wire  o_2bit_error;
    wire o_parity_error;

    integer success_count = 0, error_count = 0, test_count = 0,  i = 0;


integer  idx;
integer seed;
initial seed = 32'hDEADBEEF; // any integer seed

    hamming_secded_top uut(
    i_secded,
    i_noise,
    o_7seg,
    o_secded,
    o_1bit_error,
    o_2bit_error,
    o_parity_error
    );

    initial begin
        $display($time,"TEST START");
        $display($time,"\n TEST1: no bit error");
        for (i = 0;i<16 ;i++ ) begin
            i_secded = i[3:0]; i_noise = 0;
            #1; 
            compare_data(i_secded, o_secded,
             `NO_ERROR, `NO_ERROR, `NO_ERROR,
             o_1bit_error, o_2bit_error, o_parity_error);      
        end



#10;
$display("%0t: TEST2: 1 bit error", $time);
for (i = 0; i < 16; i = i + 1) begin
  i_secded = i[3:0];
  idx = $random(seed) % 4;
  case (idx)
    0: i_noise = 7'b0000100; // flip bit 2
    1: i_noise = 7'b0001000; // flip bit 3
    2: i_noise = 7'b0010000; // flip bit 4
    3: i_noise = 7'b0100000; // flip bit 5
  endcase
  #1;
  compare_data(i_secded, o_secded,
               `ERROR, `NO_ERROR, `NO_ERROR,
               o_1bit_error, o_2bit_error, o_parity_error);
end
        #10;
  $display($time,"\n TEST3:  2 bit error");
        for (i = 0;i<16 ;i++ ) begin
            i_secded = i[3:0];
          i_noise = (1 << 3) | (1 << ($random(seed) % 3));

            #1;
        
            compare_data(i_secded, o_secded,
             `NO_ERROR, `ERROR, `NO_ERROR,
             o_1bit_error, o_2bit_error, o_parity_error);
        end



     #10;
  $display($time,"\n TEST4:  parity altered +2bit error = 3bit error(not correctable,partially detectable)");
            i_secded = 4'd8;
         i_noise = (1 << 4) | (1 << 3) | (1 << ($random(seed) % 3));

            #1; i_secded = 0; i_noise = 0;
        


             #10;
  $display($time,"\n TEST5:  2 bit error (again)");
        
            i_secded = 4'b1010; i_noise = 0;
           i_noise = (1 << 3) | (1 << ($random(seed) % 3));

            #1;
        
        compare_data(i_secded, o_secded,
             `NO_ERROR, `ERROR, `NO_ERROR,
             o_1bit_error, o_2bit_error, o_parity_error);  

        #10;
        

        $display($time,"TEST STOP.\n\t\t RESULTS success_count = %0d,error_count = %0d,test_count  = %0d",success_count,error_count,test_count);
#20 $finish;
    end

        
task compare_data;
  input  [3:0] in_secded;
  input  [3:0] out_secded;
  input        exp_1bit_error;
  input        exp_2bit_error;
  input        exp_parity_error;
  input        dut_1bit_error;
  input        dut_2bit_error;
  input        dut_parity_error;
begin
  if (!exp_2bit_error) begin
    if ((in_secded === out_secded) &&
        (exp_1bit_error === dut_1bit_error) &&
        (exp_parity_error === dut_parity_error)) begin
      $display("%0t: SUCCESS  i_secded=%b o_secded=%b 1bit=%b parity=%b",
               $time, in_secded, out_secded, dut_1bit_error, dut_parity_error);
      success_count = success_count + 1;
    end else begin
      $display("%0t: ERROR    i_secded=%b o_secded=%b 1bit_exp=%b 1bit_dut=%b parity_exp=%b parity_dut=%b",
               $time, in_secded, out_secded, exp_1bit_error, dut_1bit_error, exp_parity_error, dut_parity_error);
      error_count = error_count + 1;
    end
  end else begin
    // expecting a 2-bit error: check DUT's 2-bit flag
    if (exp_2bit_error === dut_2bit_error) begin
      $display("%0t: SUCCESS  i_secded=%b o_secded=%b 2bit=%b",
               $time, in_secded, out_secded, dut_2bit_error);
      success_count = success_count + 1;
    end else begin
      $display("%0t: ERROR    i_secded=%b o_secded=%b 2bit_exp=%b 2bit_dut=%b",
               $time, in_secded, out_secded, exp_2bit_error, dut_2bit_error);
      error_count = error_count + 1;
    end
  end

  test_count = test_count + 1;
end
endtask
initial begin
     $dumpfile("hamming_secded_top.vcd");
$dumpvars(0, stimulus);
end
endmodule  



// iverilog -o hamming_secded_top_tb.out hamming_secded_top.v  hamming_74_enco.v hamming_74_dec.v hex_7seg_decoder.v noise_adder.v priority_encoder.v  hamming_secded_top_tb.v
// vvp hamming_secded_top_tb.out

// gtkwave hamming_secded_top.vcd

