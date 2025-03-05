set_property CFGBVS VCCO [current_design];
set_property CONFIG_VOLTAGE 3.3 [current_design];

#####               create clock              #####
set_property -dict { PACKAGE_PIN U18    IOSTANDARD LVCMOS33 } [get_ports { CLK50MHZ }];  # PL_GCLK
create_clock -add -name sys_clk_pin -period 20.00 -waveform {0 5} [get_ports {CLK50MHZ}];


#=========================== CLK32768KHZ ======================================#
#set_property -dict { PACKAGE_PIN Y18    IOSTANDARD LVCMOS33 } [get_ports { CLK32768KHZ }]; 
#create_clock -add -name sys_clk_pin -period 30517.58 -waveform {0 15258.79} [get_ports {CLK32768KHZ}];

set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dut_io_pads_jtag_TCK_i_ival];
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IOBUF_jtag_TCK/O];


#####            rst define           #####
# set_property -dict { PACKAGE_PIN C7   IOSTANDARD LVCMOS33 } [get_ports { fpga_rst }]; # RESET    PS_POR_B PS_POR_B_500 C7 （all keys: pull down is 0, low active）
set_property -dict { PACKAGE_PIN N15  IOSTANDARD LVCMOS33 } [get_ports { mcu_rst }];  # PL_KEY1  IO_L21P_T3_35 N15 


#=========================== QSPI0 Flash ======================================#
#####                spi0 define               #####
# set_property PACKAGE_PIN A7 [get_ports  qspi0_cs    ]; # QSPI_CS   PS_MIO1_500  A7
# set_property PACKAGE_PIN A5 [get_ports  qspi0_sck   ]; # QSPI_CLK  PS_MIO6_500  A5
# set_property PACKAGE_PIN A6 [get_ports {qspi0_dq[3]}]; # QSPI_D3   PS_MIO5_500  A6
# set_property PACKAGE_PIN B7 [get_ports {qspi0_dq[2]}]; # QSPI_D2   PS_MIO4_500  B7
# set_property PACKAGE_PIN D6 [get_ports {qspi0_dq[1]}]; # QSPI_D1   PS_MIO3_500  D6
# set_property PACKAGE_PIN B8 [get_ports {qspi0_dq[0]}]; # QSPI_D0   PS_MIO2_500  B8



#####                PMU define               #####
set_property -dict { PACKAGE_PIN M14   IOSTANDARD LVCMOS33 } [get_ports pmu_paden ];   # PL_LED1 IO_L23P_T3_35 M14 
set_property -dict { PACKAGE_PIN M15   IOSTANDARD LVCMOS33 } [get_ports pmu_padrst ];  # PL_LED2 IO_L23N_T3_35 M15 
set_property -dict { PACKAGE_PIN N16   IOSTANDARD LVCMOS33 } [get_ports mcu_wakeup ];  # PL_KEY2 IO_L21N_T3_35 N16 


## GPIOA
#####               MCU JTAG define           #####
set_property -dict { PACKAGE_PIN W13  IOSTANDARD LVCMOS33 } [get_ports { mcu_TDO }]; # PIN27 EX_IO1_13N IO_L4N_T0_34 W13
set_property -dict { PACKAGE_PIN U13  IOSTANDARD LVCMOS33 } [get_ports { mcu_TCK }]; # PIN26 EX_IO1_12P IO_L3P_T0_34 U13
set_property -dict { PACKAGE_PIN T11  IOSTANDARD LVCMOS33 } [get_ports { mcu_TDI }]; # PIN32 EX_IO1_15P IO_L1P_T0_34 T11
set_property -dict { PACKAGE_PIN T12  IOSTANDARD LVCMOS33 } [get_ports { mcu_TMS }]; # PIN30 EX_IO1_14P IO_L2P_T0_34 T12
set_property KEEPER true [get_ports mcu_TMS]


#=============================== UART 0 ======================================
set_property -dict { PACKAGE_PIN U12   IOSTANDARD LVCMOS33 } [get_ports { uart0_tx }]; # PIN29 EX_IO1_14N IO_L2N_T0_34 U12
set_property -dict { PACKAGE_PIN T10   IOSTANDARD LVCMOS33 } [get_ports { uart0_rx }]; # PIN31 EX_IO1_15N IO_L1N_T0_34 T10
#---------------------------- End of UART 0 --------------------------------


#LEDs
set_property -dict { PACKAGE_PIN K16   IOSTANDARD LVCMOS33 } [get_ports { led3 }]; # PL_LED3---> IO_L24P_T3_35-> K16
set_property -dict { PACKAGE_PIN J16   IOSTANDARD LVCMOS33 } [get_ports { led4 }]; # PL_LED4---> IO_L24N_T3_35-> J16

#KEYs
set_property -dict { PACKAGE_PIN T17   IOSTANDARD LVCMOS33 } [get_ports { key3 }]; # PL_KEY3--->  IO_L20P_T3_34 T17
set_property -dict { PACKAGE_PIN R17   IOSTANDARD LVCMOS33 } [get_ports { key4 }]; # PL_KEY4--->  IO_L19N_T3_34 R17


# 40P
# set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { gpioA_5 }]; # W18
# set_property -dict { PACKAGE_PIN P14   IOSTANDARD LVCMOS33 } [get_ports { gpioA_6 }]; # P14
# set_property -dict { PACKAGE_PIN Y16   IOSTANDARD LVCMOS33 } [get_ports { gpioA_7 }]; # Y16


#####                gpioA define              #####
# ## LED 4
# set_property PACKAGE_PIN M25  [get_ports {gpioA[24]}]     
# ## LED 3
# set_property PACKAGE_PIN N23  [get_ports {gpioA[23]}]     
# ## LED 2
# set_property PACKAGE_PIN N22  [get_ports {gpioA[22]}]     
# ## LED 1
# set_property PACKAGE_PIN V22  [get_ports {gpioA[21]}]     
# ## UART TX
# set_property PACKAGE_PIN L25  [get_ports {gpioA[17]}]
# ## UART RX
# set_property PACKAGE_PIN M24  [get_ports {gpioA[16]}]
# ## key_in C
# set_property PACKAGE_PIN AB25 [get_ports {gpioA[7]}]
# ## key_in R
# set_property PACKAGE_PIN W23  [get_ports {gpioA[6]}]
# ## key_in L
# set_property PACKAGE_PIN W24  [get_ports {gpioA[5]}]
# ## key_in D
# set_property PACKAGE_PIN AB26 [get_ports {gpioA[4]}]
# ## key_in U
# set_property PACKAGE_PIN AC26 [get_ports {gpioA[3]}]


#####         SPI Configurate Setting        #######
#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
#set_property CONFIG_MODE SPIx4 [current_design] 
#set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design] 