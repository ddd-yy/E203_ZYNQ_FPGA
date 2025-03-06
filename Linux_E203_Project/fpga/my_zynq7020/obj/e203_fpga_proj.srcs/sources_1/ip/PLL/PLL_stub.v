// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
// Date        : Thu Feb 27 20:46:21 2025
// Host        : IC_EDA running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force -mode synth_stub
//               /home/ICer/ic_prjs/e203_hbirdv2_MOD/fpga/my_zynq7020/obj/e203_fpga_proj.srcs/sources_1/ip/PLL/PLL_stub.v
// Design      : PLL
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module PLL(CLK_O_16M, resetn, locked, CLK_I_50M)
/* synthesis syn_black_box black_box_pad_pin="CLK_O_16M,resetn,locked,CLK_I_50M" */;
  output CLK_O_16M;
  input resetn;
  output locked;
  input CLK_I_50M;
endmodule
