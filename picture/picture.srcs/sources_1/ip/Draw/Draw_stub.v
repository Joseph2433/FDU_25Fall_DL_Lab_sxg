// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Mon Dec  8 20:12:55 2025
// Host        : LAPTOP-JOE running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/FDu/second1/DL/lab/picture/picture.srcs/sources_1/ip/Draw/Draw_stub.v
// Design      : Draw
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_4,Vivado 2019.2" *)
module Draw(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[15:0],douta[11:0]" */;
  input clka;
  input [15:0]addra;
  output [11:0]douta;
endmodule
