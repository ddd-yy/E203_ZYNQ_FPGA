// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Feb 27 19:54:50 2025
// Host        : IC_EDA running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ PLL_stub.v
// Design      : PLL
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(CLK_O_16M, CLK_O_8M388, resetn, locked, 
  CLK_I_50M)
/* synthesis syn_black_box black_box_pad_pin="CLK_O_16M,CLK_O_8M388,resetn,locked,CLK_I_50M" */;
  output CLK_O_16M;
  output CLK_O_8M388;
  input resetn;
  output locked;
  input CLK_I_50M;
endmodule
