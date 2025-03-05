-makelib ies_lib/xil_defaultlib -sv \
  "E:/vivado2018.3/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "E:/vivado2018.3/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../E203_Zynq_7020.srcs/sources_1/ip/PLL/PLL_clk_wiz.v" \
  "../../../../E203_Zynq_7020.srcs/sources_1/ip/PLL/PLL.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

