// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Apr  8 10:44:16 2020
// Host        : DESKTOP-813AKL3 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/triumf/nuprism/proj2/xu1-nuprism/XU1-NuPRISM/Vivado_NuPRISM/MercuryXU1_NuPRISM.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu6eg-ffvc900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk_out1_62p5, clk_out2_187p5, 
  clk_out3_375p0, reset, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk_out1_62p5,clk_out2_187p5,clk_out3_375p0,reset,locked,clk_in1_p,clk_in1_n" */;
  output clk_out1_62p5;
  output clk_out2_187p5;
  output clk_out3_375p0;
  input reset;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
