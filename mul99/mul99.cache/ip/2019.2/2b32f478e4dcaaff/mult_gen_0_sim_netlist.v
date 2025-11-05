// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Oct 27 10:30:54 2025
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

  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
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

(* C_A_TYPE = "0" *) (* C_A_WIDTH = "4" *) (* C_B_TYPE = "0" *) 
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
  (* C_A_TYPE = "0" *) 
  (* C_A_WIDTH = "4" *) 
  (* C_B_TYPE = "0" *) 
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
qxsV5wWm79/JFu1RWbdkAT4hi79Vbhet+gqboqYyjAODNs+KJnI9oKKK5xaul/o5Nic+TNW0ohV0
1gE+CnoFS3Yz5xOPLfaI2zqxQKHaadKQwaQLXZsdzTk7VhSFfPrdHPda0XGnd2LiluG5m7WDr+CO
nVzE4nbZK6kPY6XteiXTLxHSkYP9ybZC+Zd0Olfm2+aO3lw+xCn8jYtpeLYg9sAOKvpW0WWq1lE/
ZPwQsCTsAP9kyvCwxTW5YFy8PHzNXUNHqbu7RGtGoV+DK+obKoIay7rOncqT2ZvvJxEi0e9076an
O3i48hehL+G3jErBFJEfWD3EZ3lIAAyKiPJdnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zzfx1Q4j/WLmhPLyclnz7JcL1vMl+CuJW/ao6ZRscNyCNFrjyYnBAN8FnHGuvyaN7EyCyq4+QbQg
pTd9i6knlnE+fAMWpDPqe26lPJgCSDr13UrqRCao1Uby19pbVEwqs24wtZmNLMuTRxVxcPKhMmIB
kYdL0VwBxv18aP0bcGAdBOPmHyKLvrZQoK5/D2lHjYosR2n/AJE/yS9gKiLDelyO9N2wJ3RM9DzI
f2H26YoLdPbAeHx4G5Add3gD3uBJR1q4N0J9zCckoGCs9Mm+lgNmVRldbIfLpmcWVYEmvjkIuOGT
1YsVez2t2g83p4eaiguEVXJsNSiXl3WfotiE5g==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 20032)
`pragma protect data_block
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
Gk3x3WRSSxIvoWK6wiF7RLYj1lZLYLPcxA==
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
