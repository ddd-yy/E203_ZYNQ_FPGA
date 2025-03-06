-- Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2019.1 (lin64) Build 2552052 Fri May 24 14:47:09 MDT 2019
-- Date        : Thu Feb 27 20:46:21 2025
-- Host        : IC_EDA running 64-bit CentOS Linux release 7.9.2009 (Core)
-- Command     : write_vhdl -force -mode synth_stub
--               /home/ICer/ic_prjs/e203_hbirdv2_MOD/fpga/my_zynq7020/obj/e203_fpga_proj.srcs/sources_1/ip/PLL/PLL_stub.vhdl
-- Design      : PLL
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity PLL is
  Port ( 
    CLK_O_16M : out STD_LOGIC;
    resetn : in STD_LOGIC;
    locked : out STD_LOGIC;
    CLK_I_50M : in STD_LOGIC
  );

end PLL;

architecture stub of PLL is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "CLK_O_16M,resetn,locked,CLK_I_50M";
begin
end;
