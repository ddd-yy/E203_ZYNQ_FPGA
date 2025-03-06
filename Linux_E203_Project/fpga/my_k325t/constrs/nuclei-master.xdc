set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

#####               create clock              #####



set_property -dict { PACKAGE_PIN F17    IOSTANDARD LVCMOS33 } [get_ports { CLK125MHZ }]; 
create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports {CLK125MHZ}];

#set_property -dict { PACKAGE_PIN Y18    IOSTANDARD LVCMOS33 } [get_ports { CLK32768KHZ }]; 
#create_clock -add -name sys_clk_pin -period 30517.58 -waveform {0 15258.79} [get_ports {CLK32768KHZ}];


set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dut_io_pads_jtag_TCK_i_ival]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IOBUF_jtag_TCK/O]


#####            rst define           #####

set_property PACKAGE_PIN U22 [get_ports fpga_rst  ]
set_property PACKAGE_PIN AF25 [get_ports mcu_rst   ]

#####                spi0 define               #####
set_property PACKAGE_PIN R22 [get_ports  qspi0_cs    ]
set_property PACKAGE_PIN R20 [get_ports  qspi0_sck   ]
set_property PACKAGE_PIN R26 [get_ports {qspi0_dq[3]}]
set_property PACKAGE_PIN U20 [get_ports {qspi0_dq[2]}]
set_property PACKAGE_PIN T22 [get_ports {qspi0_dq[1]}]
set_property PACKAGE_PIN R23 [get_ports {qspi0_dq[0]}]

#####               MCU JTAG define           #####
set_property PACKAGE_PIN M21 [get_ports mcu_TDO]
set_property PACKAGE_PIN M20 [get_ports mcu_TCK]
set_property PACKAGE_PIN K26 [get_ports mcu_TDI]
set_property PACKAGE_PIN N16 [get_ports mcu_TMS]
set_property KEEPER true [get_ports mcu_TMS]

#####                PMU define               #####
set_property PACKAGE_PIN M22 [get_ports pmu_paden ]
set_property PACKAGE_PIN K25 [get_ports pmu_padrst]
set_property PACKAGE_PIN P19 [get_ports mcu_wakeup]


#####                gpioA define              #####
# sw_in 5
set_property PACKAGE_PIN U17  [get_ports {gpioA[31]}]
## sw_in 4
set_property PACKAGE_PIN M19  [get_ports {gpioA[30]}]
## sw_in 3
set_property PACKAGE_PIN N18  [get_ports {gpioA[29]}]
## sw_in 2
set_property PACKAGE_PIN R17  [get_ports {gpioA[28]}]
## sw_in 1
set_property PACKAGE_PIN R16  [get_ports {gpioA[27]}]
## sw_in 0
set_property PACKAGE_PIN N17  [get_ports {gpioA[26]}]
## LED 5
set_property PACKAGE_PIN L24  [get_ports {gpioA[25]}]     
## LED 4
set_property PACKAGE_PIN M25  [get_ports {gpioA[24]}]     
## LED 3
set_property PACKAGE_PIN N23  [get_ports {gpioA[23]}]     
## LED 2
set_property PACKAGE_PIN N22  [get_ports {gpioA[22]}]     
## LED 1
set_property PACKAGE_PIN V22  [get_ports {gpioA[21]}]     
## LED 0
set_property PACKAGE_PIN AF24 [get_ports {gpioA[20]}]     
## CH340_RX (uart2-tx)
set_property PACKAGE_PIN P20  [get_ports {gpioA[19]}]     
## CH340_TX (uart2-rx)
set_property PACKAGE_PIN T25  [get_ports {gpioA[18]}]     
## UART TX
set_property PACKAGE_PIN L25  [get_ports {gpioA[17]}]
## UART RX
set_property PACKAGE_PIN M24  [get_ports {gpioA[16]}]
## EEPROM SDA
set_property PACKAGE_PIN AF22 [get_ports {gpioA[15]}]
## EEPROM SCL
set_property PACKAGE_PIN AE22  [get_ports {gpioA[14]}]
## PSRAM D3  
set_property PACKAGE_PIN V23  [get_ports {gpioA[13]}]     
## PRASM D2 
set_property PACKAGE_PIN V24  [get_ports {gpioA[12]}]     
## PSRAM D1(sdo) 
set_property PACKAGE_PIN U26  [get_ports {gpioA[11]}]
## PSRAM D0(sdi)
set_property PACKAGE_PIN V26  [get_ports {gpioA[10]}]
## PSRAM CS
set_property PACKAGE_PIN W25  [get_ports {gpioA[9]}]      
## PSRAM CK
set_property PACKAGE_PIN AA25 [get_ports {gpioA[8]}]
## key_in C
set_property PACKAGE_PIN AB25 [get_ports {gpioA[7]}]
## key_in R
set_property PACKAGE_PIN W23  [get_ports {gpioA[6]}]
## key_in L
set_property PACKAGE_PIN W24  [get_ports {gpioA[5]}]
## key_in D
set_property PACKAGE_PIN AB26 [get_ports {gpioA[4]}]
## key_in U
set_property PACKAGE_PIN AC26 [get_ports {gpioA[3]}]
## sw_in 6
set_property PACKAGE_PIN Y25  [get_ports {gpioA[2]}]
## LED 7
set_property PACKAGE_PIN Y26  [get_ports {gpioA[1]}]
## LED 6
set_property PACKAGE_PIN AA23 [get_ports {gpioA[0]}]      


#####                gpioB define              #####
#set_property PACKAGE_PIN Y21  [get_ports {gpioB[31]}]
#set_property PACKAGE_PIN AA21 [get_ports {gpioB[30]}]
#set_property PACKAGE_PIN AB21 [get_ports {gpioB[29]}]
#set_property PACKAGE_PIN AA20 [get_ports {gpioB[28]}]
#set_property PACKAGE_PIN AA18 [get_ports {gpioB[27]}]
#set_property PACKAGE_PIN AB20 [get_ports {gpioB[26]}]
#set_property PACKAGE_PIN AA19 [get_ports {gpioB[25]}]
#set_property PACKAGE_PIN AB18 [get_ports {gpioB[24]}]
#set_property PACKAGE_PIN W20  [get_ports {gpioB[23]}]
#set_property PACKAGE_PIN V19  [get_ports {gpioB[22]}]
#set_property PACKAGE_PIN Y19  [get_ports {gpioB[21]}]
#set_property PACKAGE_PIN U17  [get_ports {gpioB[20]}]
#set_property PACKAGE_PIN AB22 [get_ports {gpioB[19]}]
#set_property PACKAGE_PIN V20  [get_ports {gpioB[18]}]
#set_property PACKAGE_PIN U18  [get_ports {gpioB[17]}]  
#set_property PACKAGE_PIN R18  [get_ports {gpioB[16]}]  
#set_property PACKAGE_PIN V17  [get_ports {gpioB[15]}]
#set_property PACKAGE_PIN P14  [get_ports {gpioB[14]}]
#set_property PACKAGE_PIN V18  [get_ports {gpioB[13]}]
#set_property PACKAGE_PIN W17  [get_ports {gpioB[12]}]
#set_property PACKAGE_PIN W21  [get_ports {gpioB[11]}]
#set_property PACKAGE_PIN V22  [get_ports {gpioB[10]}]
#set_property PACKAGE_PIN W22  [get_ports {gpioB[9]}]
#set_property PACKAGE_PIN Y22  [get_ports {gpioB[8]}]
#set_property PACKAGE_PIN U20  [get_ports {gpioB[7]}]
#set_property PACKAGE_PIN N13  [get_ports {gpioB[6]}]
#set_property PACKAGE_PIN T20  [get_ports {gpioB[5]}]
#set_property PACKAGE_PIN R19  [get_ports {gpioB[4]}]
#set_property PACKAGE_PIN P19  [get_ports {gpioB[3]}]
#set_property PACKAGE_PIN P20  [get_ports {gpioB[2]}]
#set_property PACKAGE_PIN T21  [get_ports {gpioB[1]}]
#set_property PACKAGE_PIN U21  [get_ports {gpioB[0]}]

#####            clock & rst define           #####

set_property IOSTANDARD LVCMOS33 [get_ports fpga_rst  ]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_rst   ]


#####                spi0 define               #####
set_property IOSTANDARD LVCMOS33 [get_ports  qspi0_cs    ]
set_property IOSTANDARD LVCMOS33 [get_ports  qspi0_sck   ]
set_property IOSTANDARD LVCMOS33 [get_ports {qspi0_dq[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {qspi0_dq[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {qspi0_dq[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {qspi0_dq[0]}]


#####               MCU JTAG define           #####
set_property IOSTANDARD LVCMOS33 [get_ports mcu_TDO]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_TCK]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_TDI]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_TMS]

#####                PMU define               #####
set_property IOSTANDARD LVCMOS33 [get_ports pmu_paden ]
set_property IOSTANDARD LVCMOS33 [get_ports pmu_padrst]
set_property IOSTANDARD LVCMOS33 [get_ports mcu_wakeup]

#####                gpioA define              #####
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[31]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[30]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[29]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[28]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[27]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[26]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[25]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[24]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[23]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[22]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[21]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[20]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[19]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[18]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[17]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[16]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {gpioA[0]}]

#####                gpioB define              #####
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[31]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[30]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[29]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[28]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[27]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[26]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[25]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[24]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[23]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[22]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[21]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[20]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[19]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[18]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[17]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[16]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[15]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[14]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[13]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[12]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[11]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[10]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[9]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[8]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[7]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[6]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[5]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[4]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {gpioB[0]}]


#####         SPI Configurate Setting        #######
#set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design] 
#set_property CONFIG_MODE BPIx16 [current_design] 
#set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]

