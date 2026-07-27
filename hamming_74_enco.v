module hamming_74_enco(i_data,o_hamming_code,o_parity);
input [3:0]i_data;
output  [6:0]o_hamming_code;
output o_parity;
reg p4,p2,p1;   //  as i am using it in the always statements
always @(*)  begin
 p1 = i_data[0]^i_data[1]^i_data[3];
 p2 = i_data[0]^i_data[2]^i_data[3];
 p4 = i_data[1]^i_data[2]^i_data[3];

end
assign o_hamming_code = {i_data[3:1],p4,i_data[0],p2,p1};

assign o_parity = ^o_hamming_code;
endmodule 