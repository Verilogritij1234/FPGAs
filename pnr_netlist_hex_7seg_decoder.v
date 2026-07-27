module hex_7seg_decoder (o_a,
    o_b,
    o_c,
    o_d,
    o_e,
    o_f,
    o_g,
    in);
 output o_a;
 output o_b;
 output o_c;
 output o_d;
 output o_e;
 output o_f;
 output o_g;
 input [3:0] in;

 wire _29_;
 wire _30_;
 wire _31_;
 wire _32_;
 wire _33_;
 wire _34_;
 wire _35_;
 wire _36_;
 wire _37_;
 wire _38_;
 wire _39_;
 wire _40_;
 wire _41_;
 wire _42_;
 wire _43_;
 wire _44_;
 wire _45_;
 wire _46_;
 wire _47_;
 wire _48_;
 wire _49_;
 wire _50_;
 wire _51_;
 wire _52_;
 wire _53_;
 wire _54_;
 wire _55_;

 sky130_fd_sc_hd__clkinv_1 _56_ (.A(in[2]),
    .Y(_29_));
 sky130_fd_sc_hd__lpflow_isobufsrc_1 _57_ (.A(in[2]),
    .SLEEP(in[1]),
    .X(_30_));
 sky130_fd_sc_hd__nand2_1 _58_ (.A(in[3]),
    .B(_30_),
    .Y(_31_));
 sky130_fd_sc_hd__a21boi_0 _59_ (.A1(in[1]),
    .A2(in[0]),
    .B1_N(in[2]),
    .Y(_32_));
 sky130_fd_sc_hd__and3_1 _60_ (.A(in[2]),
    .B(in[1]),
    .C(in[0]),
    .X(_33_));
 sky130_fd_sc_hd__nor2_1 _61_ (.A(in[2]),
    .B(in[1]),
    .Y(_34_));
 sky130_fd_sc_hd__nor2_1 _62_ (.A(_33_),
    .B(_34_),
    .Y(_35_));
 sky130_fd_sc_hd__o22a_1 _63_ (.A1(in[0]),
    .A2(_31_),
    .B1(_35_),
    .B2(in[3]),
    .X(_55_));
 sky130_fd_sc_hd__nand3_1 _64_ (.A(in[0]),
    .B(in[3]),
    .C(_30_),
    .Y(_36_));
 sky130_fd_sc_hd__nor2_1 _65_ (.A(in[1]),
    .B(in[0]),
    .Y(_37_));
 sky130_fd_sc_hd__o31a_1 _66_ (.A1(in[3]),
    .A2(_32_),
    .A3(_37_),
    .B1(_36_),
    .X(_54_));
 sky130_fd_sc_hd__o21ai_0 _67_ (.A1(in[2]),
    .A2(in[1]),
    .B1(in[3]),
    .Y(_38_));
 sky130_fd_sc_hd__o21ai_0 _68_ (.A1(in[0]),
    .A2(_30_),
    .B1(_38_),
    .Y(_53_));
 sky130_fd_sc_hd__nor3b_1 _69_ (.A(in[2]),
    .B(in[0]),
    .C_N(in[1]),
    .Y(_39_));
 sky130_fd_sc_hd__o21ai_0 _70_ (.A1(_33_),
    .A2(_39_),
    .B1(in[3]),
    .Y(_40_));
 sky130_fd_sc_hd__nand2b_1 _71_ (.A_N(in[1]),
    .B(in[0]),
    .Y(_41_));
 sky130_fd_sc_hd__a21oi_1 _72_ (.A1(_29_),
    .A2(_41_),
    .B1(in[3]),
    .Y(_42_));
 sky130_fd_sc_hd__o21ai_0 _73_ (.A1(in[1]),
    .A2(in[0]),
    .B1(in[2]),
    .Y(_43_));
 sky130_fd_sc_hd__a21oi_1 _74_ (.A1(in[1]),
    .A2(in[0]),
    .B1(_43_),
    .Y(_44_));
 sky130_fd_sc_hd__o21ai_0 _75_ (.A1(in[1]),
    .A2(in[0]),
    .B1(_32_),
    .Y(_45_));
 sky130_fd_sc_hd__a21boi_0 _76_ (.A1(_42_),
    .A2(_45_),
    .B1_N(_40_),
    .Y(_52_));
 sky130_fd_sc_hd__a21bo_1 _77_ (.A1(in[2]),
    .A2(_41_),
    .B1_N(in[3]),
    .X(_46_));
 sky130_fd_sc_hd__o21ai_0 _78_ (.A1(in[3]),
    .A2(_39_),
    .B1(_46_),
    .Y(_51_));
 sky130_fd_sc_hd__a21oi_1 _79_ (.A1(in[1]),
    .A2(in[0]),
    .B1(in[2]),
    .Y(_47_));
 sky130_fd_sc_hd__nand2_1 _80_ (.A(in[3]),
    .B(_47_),
    .Y(_48_));
 sky130_fd_sc_hd__o211ai_1 _81_ (.A1(in[3]),
    .A2(_44_),
    .B1(_48_),
    .C1(_36_),
    .Y(_50_));
 sky130_fd_sc_hd__a2bb2oi_1 _82_ (.A1_N(_47_),
    .A2_N(_46_),
    .B1(_43_),
    .B2(_42_),
    .Y(_49_));
 assign o_a = _49_;
 assign o_b = _50_;
 assign o_c = _51_;
 assign o_d = _52_;
 assign o_e = _53_;
 assign o_f = _54_;
 assign o_g = _55_;
endmodule
