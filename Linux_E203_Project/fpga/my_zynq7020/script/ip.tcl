create_ip -name clk_wiz -vendor xilinx.com -library ip -version 6.0 -module_name PLL -dir $ipdir -force

set_property -dict [list \
    CONFIG.Component_Name {PLL}\
    CONFIG.PRIM_IN_FREQ {50.000} \
    CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
    CONFIG.RESET_TYPE {ACTIVE_LOW} \
    CONFIG.CLKOUT1_USED {true} \
    CONFIG.CLKOUT2_USED {true} \
    CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {16.000} \
    CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {8.388} \
    CONFIG.RESET_PORT {resetn} \
    ] [get_ips PLL]
        
  
create_ip -vendor xilinx.com -library ip -name proc_sys_reset -module_name reset_sys -dir $ipdir -force
set_property -dict [list \
  CONFIG.C_EXT_RESET_HIGH {false} \
  CONFIG.C_AUX_RESET_HIGH {false} \
  CONFIG.C_NUM_BUS_RST {1} \
  CONFIG.C_NUM_PERP_RST {1} \
  CONFIG.C_NUM_INTERCONNECT_ARESETN {1} \
  CONFIG.C_NUM_PERP_ARESETN {1} \
  ] [get_ips reset_sys]
