create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name sys_clk_wiz -dir $ipdir -force

set_property -dict [list \
    CONFIG.Component_Name {sys_clk_wiz} \
    CONFIG.PRIM_IN_FREQ {125.000} \
    CONFIG.CLKOUT2_USED {false} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {16.000} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
    CONFIG.CLKIN1_JITTER_PS {80.0} \
    CONFIG.MMCM_CLKFBOUT_MULT_F {8.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {8.000} \
    CONFIG.MMCM_CLKOUT0_DIVIDE_F {62.500} \
    CONFIG.MMCM_CLKOUT1_DIVIDE {1} \
    CONFIG.NUM_OUT_CLKS {1} \
    CONFIG.RESET_PORT {resetn} \
    CONFIG.CLKOUT1_JITTER {180.478} \
    CONFIG.CLKOUT1_PHASE_ERROR {96.948} \
    CONFIG.CLKOUT2_JITTER {124.615} \
    CONFIG.CLKOUT2_PHASE_ERROR {96.948}] [get_ips sys_clk_wiz]

create_ip -vendor xilinx.com -library ip -name proc_sys_reset -module_name reset_sys -dir $ipdir -force
set_property -dict [list \
  CONFIG.C_EXT_RESET_HIGH {false} \
  CONFIG.C_AUX_RESET_HIGH {false} \
  CONFIG.C_NUM_BUS_RST {1} \
  CONFIG.C_NUM_PERP_RST {1} \
  CONFIG.C_NUM_INTERCONNECT_ARESETN {1} \
  CONFIG.C_NUM_PERP_ARESETN {1} \
  ] [get_ips reset_sys]
