// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Oct 27 11:14:06 2025
// Host        : LAPTOP-JOE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ mult_gen_0_sim_netlist.v
// Design      : mult_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "mult_gen_0,mult_gen_v12_0_16,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "mult_gen_v12_0_16,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (CLK,
    A,
    B,
    P);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF p_intf:b_intf:a_intf, ASSOCIATED_RESET sclr, ASSOCIATED_CLKEN ce, FREQ_HZ 10000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [3:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [3:0]B;
  (* x_interface_info = "xilinx.com:signal:data:1.0 p_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME p_intf, LAYERED_METADATA undef" *) output [7:0]P;

  wire [3:0]A;
  wire [3:0]B;
  wire CLK;
  wire [7:0]P;
  wire [47:0]NLW_U0_PCASC_UNCONNECTED;
  wire [1:0]NLW_U0_ZERO_DETECT_UNCONNECTED;

  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16 U0
       (.A(A),
        .B(B),
        .CE(1'b1),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_U0_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_U0_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule

(* C_A_TYPE = "1" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "1" *) 
(* C_B_VALUE = "10000001" *) (* C_B_WIDTH = "4" *) (* C_CCM_IMP = "0" *) 
(* C_CE_OVERRIDES_SCLR = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_SCLR = "0" *) 
(* C_HAS_ZERO_DETECT = "0" *) (* C_LATENCY = "1" *) (* C_MODEL_TYPE = "0" *) 
(* C_MULT_TYPE = "0" *) (* C_OPTIMIZE_GOAL = "1" *) (* C_OUT_HIGH = "7" *) 
(* C_OUT_LOW = "0" *) (* C_ROUND_OUTPUT = "0" *) (* C_ROUND_PT = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16
   (CLK,
    A,
    B,
    CE,
    SCLR,
    ZERO_DETECT,
    P,
    PCASC);
  input CLK;
  input [3:0]A;
  input [3:0]B;
  input CE;
  input SCLR;
  output [1:0]ZERO_DETECT;
  output [7:0]P;
  output [47:0]PCASC;

  wire \<const0> ;
  wire [3:0]A;
  wire [3:0]B;
  wire CLK;
  wire [7:0]P;
  wire [47:0]NLW_i_mult_PCASC_UNCONNECTED;
  wire [1:0]NLW_i_mult_ZERO_DETECT_UNCONNECTED;

  assign PCASC[47] = \<const0> ;
  assign PCASC[46] = \<const0> ;
  assign PCASC[45] = \<const0> ;
  assign PCASC[44] = \<const0> ;
  assign PCASC[43] = \<const0> ;
  assign PCASC[42] = \<const0> ;
  assign PCASC[41] = \<const0> ;
  assign PCASC[40] = \<const0> ;
  assign PCASC[39] = \<const0> ;
  assign PCASC[38] = \<const0> ;
  assign PCASC[37] = \<const0> ;
  assign PCASC[36] = \<const0> ;
  assign PCASC[35] = \<const0> ;
  assign PCASC[34] = \<const0> ;
  assign PCASC[33] = \<const0> ;
  assign PCASC[32] = \<const0> ;
  assign PCASC[31] = \<const0> ;
  assign PCASC[30] = \<const0> ;
  assign PCASC[29] = \<const0> ;
  assign PCASC[28] = \<const0> ;
  assign PCASC[27] = \<const0> ;
  assign PCASC[26] = \<const0> ;
  assign PCASC[25] = \<const0> ;
  assign PCASC[24] = \<const0> ;
  assign PCASC[23] = \<const0> ;
  assign PCASC[22] = \<const0> ;
  assign PCASC[21] = \<const0> ;
  assign PCASC[20] = \<const0> ;
  assign PCASC[19] = \<const0> ;
  assign PCASC[18] = \<const0> ;
  assign PCASC[17] = \<const0> ;
  assign PCASC[16] = \<const0> ;
  assign PCASC[15] = \<const0> ;
  assign PCASC[14] = \<const0> ;
  assign PCASC[13] = \<const0> ;
  assign PCASC[12] = \<const0> ;
  assign PCASC[11] = \<const0> ;
  assign PCASC[10] = \<const0> ;
  assign PCASC[9] = \<const0> ;
  assign PCASC[8] = \<const0> ;
  assign PCASC[7] = \<const0> ;
  assign PCASC[6] = \<const0> ;
  assign PCASC[5] = \<const0> ;
  assign PCASC[4] = \<const0> ;
  assign PCASC[3] = \<const0> ;
  assign PCASC[2] = \<const0> ;
  assign PCASC[1] = \<const0> ;
  assign PCASC[0] = \<const0> ;
  assign ZERO_DETECT[1] = \<const0> ;
  assign ZERO_DETECT[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_A_TYPE = "1" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "1" *) 
  (* C_B_VALUE = "10000001" *) 
  (* C_B_WIDTH = "4" *) 
  (* C_CCM_IMP = "0" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_ZERO_DETECT = "0" *) 
  (* C_LATENCY = "1" *) 
  (* C_MODEL_TYPE = "0" *) 
  (* C_MULT_TYPE = "0" *) 
  (* C_OUT_HIGH = "7" *) 
  (* C_OUT_LOW = "0" *) 
  (* C_ROUND_OUTPUT = "0" *) 
  (* C_ROUND_PT = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* c_optimize_goal = "1" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_mult_gen_v12_0_16_viv i_mult
       (.A(A),
        .B(B),
        .CE(1'b0),
        .CLK(CLK),
        .P(P),
        .PCASC(NLW_i_mult_PCASC_UNCONNECTED[47:0]),
        .SCLR(1'b0),
        .ZERO_DETECT(NLW_i_mult_ZERO_DETECT_UNCONNECTED[1:0]));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
HPMPLvpmoX7LOmPj78BMT9X1rCnPz6PdhVGZQ307N9haGfAdMGVirvGR3e0Glyn2ieoWqXA6qOQL
t0xn28+h0g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
Nxv/BnutRgdmHnLyK7kvDGjm7WGfFKW2mxQ6xUKF14zS4ziz5pSV0ueW4VqAzUyEPsErIAEuyV6F
m5KCqRBB197Q2NbZa7O7tdAqboX6tPAJzbB6u4U/MmNS1AQcSgtfj5srMbdBzDa5pR4V3HrI0MRj
0xhV1BWf725FYPP4av0=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
F5KGJgEDQsX2btdjtRUlSmNtuyodIhGXEa3/AXv1Y7qgSO8gknBfiqj5HcIaVA9b4npQpDnNcmq+
1ONAqLeLhdOm9TES+GsTAkh/lClvl89bzfqgOV33iqwQHYIHwSsWMRXT9JSUx+YWu+g6xKpT1Ycn
8BCPsq4QUJIqL6W16fheEHB/lkMgnespIWEYJJG6R6zvv2zG8GiU6cG8zHrRjdvAj8kOkhmiMvSd
YjGXJSMfjw7ojCPSUF+nb6WWhUEmoMA/6lgSVaXRm00YHSZ09k7rKTJWSXFSpTmkL2WOsQhNS0ek
jdTK2KF5K6z2YOK4zkfHgZ+fB0KJyANaLLJH/Q==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lFuQXeJ0hi7qnIKAR+37XCSOwp8bGLukonngcICceOVpL87+rxvhP5TyNJ/zXpAWDF0BaRYlGr7d
isPiUStrvUthNyOqCr4vFZyhCdY8n+Mrv3OCvLoLQSarxVXbaKbXb0tPsXJCUdXTrCt9mr5x0Nda
6DAI8FBPlFMAiqnFXnYMwlUiSlkNWUpInuNw7+1eD8kUdckEUV1PDwZ0yjpFqMokMH9oJjN6z0Yy
65D8Tqo288ZMfZQuIimjski+X6EK157XbpyuoZIuYLJ7j6oaATdintgfZpgGzVvhCZtMbx6/SJtR
efW5vLBGiGs7rPBPE2T8fosHGOvmeC9QBSj8Ww==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Q8VVvHzTNgU3tZr4+8ia7ylST+kbNPWskONHDOT1dTkB7cHZIAWyzXpQZPuEgk2wJq21PoqmVlG9
t08IYzkfC8vYQ2LRf2Co3SXc7p3gF2OFMC68J9Nf9D+/PXJCJy3QO4H8oO39l6bn8c56K2ARnK0R
mMIALbCWSBDGCWGQmXWZJ+xmDGs1KgTeiSW3bZRftWJ6K8l8BhMit8BLOY2Mi3jJ0WRhN8kKd6JT
D4NU1jTZT6jEtmI7Gnj/AXG6auTqDPHsVQzf+ZzBsLTfw83CFoO70xM997L5cZXlqz8fEDmxezkr
wWxPwJbJeVkRV3tUxlo2Bs2x1uVkXQeNVMI8jg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
oUeTLA0HA2uKORUHo1HidNC3lw54gxwlLUkv28qRPv1pz7AEVUbIJ7wsyu2Scju+EkC2Ivi8HbBn
jxkeqRDTAwAbAqIKnY3AdyfojN9Hb8SMLcLnpWLLCpb6E0vwA09r7uqKRZ8wYAgT9CPFvzpQ3zKt
9DTLgQ3rZtFxx2nfCug=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Fayrlym1l14Y48yZ195XboT9ZQmp/mAzUyHby3Y9qJTzDF+m6mRQ/ZbebObo8bu4VAm45JeETPx1
YI4UZNOK4IqKv0BZsAlzUfAYAmqmkmIJYbn2gWUCwXyKX5AoA4ONnlxEHxzZhqtsmEXvxwTEs25/
R7iLzeoMfmwwNHgPNQkteiR4zDlB76CYmgu6EOSUX5Nnitq1oh7qRuU8WqWN7lLfgIC6T7qNHwGD
RPze2yiP06fSG45jPrOn2fvBX9SRbUXjNtiFgmqim4anwJU46v7y3ubit/I6giZhz5PJMZfkDaFX
ag+uCMq4Q8ZEolqMBmjUjat86BdVd4Nmr0yUaA==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
kIpxh3qIIkWUg8aLJSPKvKhKTPFH7T8fisti5RtNaftS7xh3KDsGLYnF1lYhH2RVXgzbdaVqvtED
5QJazVo6wUFI91xgFeOR5jX+Ny5UBUX2MngsK+UZyZg5+EdtSiDtiJNtQqgjq1Rn+XQCGF3xP80n
7YvuVMbgRHCAfWrWw7ZJ7Y3raRzeIkx+koPFio7XnC+QdRJ0ItO1YtQgF4Sg1Ihr5TH8/RrNn903
kPa+anH9spo3SFCf2Ts11UXAGLdIBmOLMtEAKjjCUbtmjGSeSc0gn2q2I+xRTFcegLevlr/iuLTw
3lFndBAoW40xOiCDjWZ6Rz7J+jZhsRl3D0Bhwg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
KU0DloYj2+v3M88qH2ZkLudIqxfAgPlhxGFakbG7tdJc8SoyRkooi2d2oghA/7vzyDiQomBQjnRb
6WFLIGRsG7dlxYcU3GJHyK3EQl8H4allAh8hHIME05REUOR662AIPh54ZFCG3axZotn70qmBlT7C
oEvvU2rDAjhEdoI7xYb+m8PZhBHPB7PlEXjnl5Zp3yXM36E/V3GquqaeWD2MsEQbdXUKWQe+auwQ
+poeb9Sq3jkbpEGsR8A+VNz8ky1m6WJCH+mI3I3CvlYoLJ2rrOSi3F2jUQ6XKDlutpIWmnfaDTLv
xTvxI94CV01DrdI9GSmJ/YzXspWchP+3Unw4Zg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
1uI6NwLxbEVG8n9troBc3PLwp7cCr4Yey4Mp/iTBlDyn4zUJJAepgktSjQDBkiofHnmDnbkZ72oM
1asCHvjfUq4KI5070iH4U/yrR+9iK4SqdmJzicnEsVRBWW5IDdIf1AXarhivgUyM/sGN9eD/8CaD
ciwvqKdG0SJUnH+3GoofNWmFxtNuqn8uZa7WvqT9uJZIdFG6l1BYw5ElBt7v5ttwWjmmgfQv64xn
Af2iC4fzPcOR/anxInPEuScoli6FwsJ9lFP7+Lih+qItP1ZKx1qDpn0IEX6OhCrqEp/fXL+vZMMO
VjYssy9DODvYkR4ecp6+ciFfj/BEm0oYE2xG/Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 17152)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
