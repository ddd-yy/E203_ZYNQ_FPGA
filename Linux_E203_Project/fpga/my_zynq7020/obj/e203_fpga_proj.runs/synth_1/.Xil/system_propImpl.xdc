set_property SRC_FILE_INFO {cfile:/home/ICer/ic_prjs/e203_hbirdv2_MOD/fpga/my_zynq7020/constrs/pin.xdc rfile:../../../../constrs/pin.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:5 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U18    IOSTANDARD LVCMOS33 } [get_ports { CLK50MHZ }];  # PL_GCLK
set_property src_info {type:XDC file:1 line:19 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N15  IOSTANDARD LVCMOS33 } [get_ports { mcu_rst }];  # PL_KEY1  IO_L21P_T3_35 N15
set_property src_info {type:XDC file:1 line:34 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports pmu_paden ];   # PL_LED1 IO_L23P_T3_35 M14
set_property src_info {type:XDC file:1 line:35 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports pmu_padrst ];  # PL_LED2 IO_L23N_T3_35 M15
set_property src_info {type:XDC file:1 line:36 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports mcu_wakeup ];  # PL_KEY2 IO_L21N_T3_35 N16
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports { mcu_TDO }]; # PIN27 EX_IO1_13N IO_L4N_T0_34 W13
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U13  IOSTANDARD LVCMOS33 } [get_ports { mcu_TCK }]; # PIN26 EX_IO1_12P IO_L3P_T0_34 U13
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T11  IOSTANDARD LVCMOS33 } [get_ports { mcu_TDI }]; # PIN32 EX_IO1_15P IO_L1P_T0_34 T11
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T12  IOSTANDARD LVCMOS33 } [get_ports { mcu_TMS }]; # PIN30 EX_IO1_14P IO_L2P_T0_34 T12
set_property src_info {type:XDC file:1 line:49 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { uart0_tx }]; # PIN29 EX_IO1_14N IO_L2N_T0_34 U12
set_property src_info {type:XDC file:1 line:50 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { uart0_rx }]; # PIN31 EX_IO1_15N IO_L1N_T0_34 T10
set_property src_info {type:XDC file:1 line:55 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { led3 }]; # PL_LED3---> IO_L24P_T3_35-> K16
set_property src_info {type:XDC file:1 line:56 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { led4 }]; # PL_LED4---> IO_L24N_T3_35-> J16
set_property src_info {type:XDC file:1 line:59 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { key3 }]; # PL_KEY3--->  IO_L20P_T3_34 T17
set_property src_info {type:XDC file:1 line:60 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { key4 }]; # PL_KEY4--->  IO_L19N_T3_34 R17
