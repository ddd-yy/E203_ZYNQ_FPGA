`timescale 1ns/1ps

module system
(
  input wire CLK50MHZ,//GCLK-U18
  //input wire CLK32768KHZ,//RTC_CLK-Y18

//  input wire fpga_rst,//FPGA_RESET-C7
  input wire mcu_rst,//MCU_RESET-N15


  // Dedicated QSPI interface
  // output wire qspi0_cs,
  // output wire qspi0_sck,
  // inout wire [3:0] qspi0_dq,

  //pmu_wakeup
  inout wire pmu_paden,  //PMU_VDDPADEN   M14
  inout wire pmu_padrst, //PMU_VADDPARST  M15
  inout wire mcu_wakeup, //MCU_WAKE       N16

    /*
  GPIOA++FUNCTION:            GPIOB++FUNCTION:
      0--->PWM0_0                  PWM2_0
      1--->PWM0_1                  PWM2_1
      2--->PWM0_2                  PWM2_2
      3--->PWM0_3                  PWM2_3
      4--->PWM1_0                  PWM3_0
      5--->PWM1_1                  PWM3_1
      6--->PWM1_2                  PWM3_2
      7--->PWM1_3                  PWM3_3

      8--->QSPI1:SCK               QSPI2:SCK
      9--->QSPI1:CS                QSPI2:CS
      10--->QSPI1:DQ0              QSPI2:DQ0
      11--->QSPI1:DQ1              QSPI2:DQ1
      12--->QSPI1:DQ2              QSPI2:DQ2
      13--->QSPI1:DQ3              QSPI2:DQ3

      14--->I2C0:SCL               I2C1:SCL
      15--->I2C0:SDA               I2C1:SDA

      16--->UART0:RX               UART1:RX
      17--->UART0:TX               UART1:TX
      18--->UART2:RX
      19--->UART2:TX
  */   

  //gpioA
  // inout wire [31:0] gpioA,//GPIOA00~GPIOA31

  //gpioB
  //inout wire [31:0] gpioB,//GPIOB00~GPIOB31

  // JD (used for JTAG connection)
  inout wire mcu_TDO, //MCU_TDO-W13
  inout wire mcu_TCK, //MCU_TCK-U13 
  inout wire mcu_TDI, //MCU_TDI-T11
  inout wire mcu_TMS, //MCU_TMS-T12

  // UART0
  inout wire uart0_tx,   //  TX---> 7020->IO34_L2N(EX_IO1_14N)->U12
  inout wire uart0_rx,   //  RX---> 7020->IO34_L1N(EX_IO1_15N)->T10


  //some leds and keys
  inout wire led3,   //  led3---> ZYNQ->IO_L24P_T3_35->K16
  inout wire led4,   //  led4---> ZYNQ->IO_L24N_T3_35->J16

  inout wire key3,   // PL_KEY3---> IO_L20P_T3_34 T17
  inout wire key4   // PL_KEY3---> IO_L19N_T3_34 R17

);
    

  // All wires connected to the chip top
  wire dut_clock;
  wire dut_reset;

  wire dut_io_pads_jtag_TCK_i_ival;
  wire dut_io_pads_jtag_TMS_i_ival;
  wire dut_io_pads_jtag_TMS_o_oval;
  wire dut_io_pads_jtag_TMS_o_oe;
  wire dut_io_pads_jtag_TMS_o_ie;
  wire dut_io_pads_jtag_TMS_o_pue;
  wire dut_io_pads_jtag_TMS_o_ds;
  wire dut_io_pads_jtag_TDI_i_ival;
  wire dut_io_pads_jtag_TDO_o_oval;
  wire dut_io_pads_jtag_TDO_o_oe;

  wire [32-1:0] dut_io_pads_gpioA_i_ival;
  wire [32-1:0] dut_io_pads_gpioA_o_oval;
  wire [32-1:0] dut_io_pads_gpioA_o_oe;

  wire [32-1:0] dut_io_pads_gpioB_i_ival;
  wire [32-1:0] dut_io_pads_gpioB_o_oval;
  wire [32-1:0] dut_io_pads_gpioB_o_oe;

  // wire dut_io_pads_qspi0_sck_o_oval;
  // wire dut_io_pads_qspi0_cs_0_o_oval;
  // wire dut_io_pads_qspi0_dq_0_i_ival;
  // wire dut_io_pads_qspi0_dq_0_o_oval;
  // wire dut_io_pads_qspi0_dq_0_o_oe;
  // wire dut_io_pads_qspi0_dq_1_i_ival;
  // wire dut_io_pads_qspi0_dq_1_o_oval;
  // wire dut_io_pads_qspi0_dq_1_o_oe;
  // wire dut_io_pads_qspi0_dq_2_i_ival;
  // wire dut_io_pads_qspi0_dq_2_o_oval;
  // wire dut_io_pads_qspi0_dq_2_o_oe;
  // wire dut_io_pads_qspi0_dq_3_i_ival;
  // wire dut_io_pads_qspi0_dq_3_o_oval;
  // wire dut_io_pads_qspi0_dq_3_o_oe;


  wire dut_io_pads_aon_erst_n_i_ival;
  wire dut_io_pads_aon_pmu_dwakeup_n_i_ival;
  wire dut_io_pads_aon_pmu_vddpaden_o_oval;
  wire dut_io_pads_aon_pmu_padrst_o_oval ;
  wire dut_io_pads_bootrom_n_i_ival;
  wire dut_io_pads_dbgmode0_n_i_ival;
  wire dut_io_pads_dbgmode1_n_i_ival;
  wire dut_io_pads_dbgmode2_n_i_ival;

  //=================================================
  // Clock & Reset
  wire mmcm_locked;

  wire reset_periph;

  wire ck_rst;
  //wire clk_8M388;
  wire clk_16M;
  wire  CLK32768KHZ;

  //assign ck_rst = fpga_rst & mcu_rst;
  assign ck_rst = mcu_rst;


// sys_clk_wiz u_sys_clk_wiz (
//     .resetn     (ck_rst         ),
//     .clk_in1    (CLK50MHZ      ),
    
//     .clk_out1   (clk_16M        ), // 16 MHz, this clock we set to 16MHz 
//     .locked     (mmcm_locked    )
//   );

  PLL sys_clk_gen
  (
    .resetn       (ck_rst    ), // ck_rst is active low
    .CLK_I_50M   (CLK50MHZ  ),

    .CLK_O_16M   (clk_16M   ), // 16 MHz, this clock we set to 16MHz
    //.CLK_O_8M388 (clk_8M388   ),
    .locked      (mmcm_locked)
  );


  clkdivider rtc_clk_gen(
    .clk         (clk_16M   ),//generate 32.768KHz
    .resetn      (ck_rst),
    .clk_out     (CLK32768KHZ)
  );


  reset_sys ip_reset_sys
  (
    .slowest_sync_clk(clk_16M),
    .ext_reset_in(ck_rst), // Active-low
    .aux_reset_in(1'b1),
    .mb_debug_sys_rst(1'b0),
    .dcm_locked(mmcm_locked),
    .mb_reset(),
    .bus_struct_reset(),
    .peripheral_reset(reset_periph),
    .interconnect_aresetn(),
    .peripheral_aresetn()
  );

  //=================================================
  // SPI0 Interface

  // wire [3:0] qspi0_ui_dq_o; 
  // wire [3:0] qspi0_ui_dq_oe;
  // wire [3:0] qspi0_ui_dq_i;

  // PULLUP qspi0_pullup[3:0]
  // (
  //   .O(qspi0_dq)
  // );

  // IOBUF qspi0_iobuf[3:0]
  // (
  //   .IO(qspi0_dq),
  //   .O(qspi0_ui_dq_i),
  //   .I(qspi0_ui_dq_o),
  //   .T(~qspi0_ui_dq_oe)
  // );


  //=================================================
  // IOBUF instantiation for GPIOs

  // IOBUF
  // #(
  //   .DRIVE(12),
  //   .IBUF_LOW_PWR("TRUE"),
  //   .IOSTANDARD("DEFAULT"),
  //   .SLEW("SLOW")
  // )
  // gpioA_iobuf[31:0]
  // (
  //   .O(dut_io_pads_gpioA_i_ival),
  //   .IO(gpioA),
  //   .I(dut_io_pads_gpioA_o_oval),
  //   .T(~dut_io_pads_gpioA_o_oe)
  // );
/*
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  gpioB_iobuf[31:0]
  (
    .O(dut_io_pads_gpioB_i_ival),
    .IO(gpioB),
    .I(dut_io_pads_gpioB_o_oval),
    .T(~dut_io_pads_gpioB_o_oe)
  );
  */
  //=================================================
  // JTAG IOBUFs

  wire iobuf_jtag_TCK_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TCK
  (
    .O(iobuf_jtag_TCK_o),
    .IO(mcu_TCK),
    .I(1'b0),
    .T(1'b1) //OUTPUT
  );
  
  assign dut_io_pads_jtag_TCK_i_ival = iobuf_jtag_TCK_o ;
  PULLUP pullup_TCK (.O(mcu_TCK));

  wire iobuf_jtag_TMS_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TMS
  (
    .O(iobuf_jtag_TMS_o),
    .IO(mcu_TMS),
    .I(1'b0),
    .T(1'b1)
  );
  assign dut_io_pads_jtag_TMS_i_ival = iobuf_jtag_TMS_o;
  PULLUP pullup_TMS (.O(mcu_TMS));

  wire iobuf_jtag_TDI_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TDI
  (
    .O(iobuf_jtag_TDI_o),
    .IO(mcu_TDI),
    .I(1'b0),
    .T(1'b1)
  );
  assign dut_io_pads_jtag_TDI_i_ival = iobuf_jtag_TDI_o;
  PULLUP pullup_TDI (.O(mcu_TDI));

  wire iobuf_jtag_TDO_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_jtag_TDO
  (
    .O(iobuf_jtag_TDO_o),
    .IO(mcu_TDO),
    .I(dut_io_pads_jtag_TDO_o_oval),
    .T(~dut_io_pads_jtag_TDO_o_oe)
  );

  //wire iobuf_jtag_TRST_n_o;
  //IOBUF
  //#(
  //  .DRIVE(12),
  //  .IBUF_LOW_PWR("TRUE"),
  //  .IOSTANDARD("DEFAULT"),
  //  .SLEW("SLOW")
  //)

  //=================================================
  // Assignment of IOBUF "IO" pins to package pins

  // Pins IO0-IO13
  // Shield header row 0: PD0-PD7

  // Use the LEDs for some more useful debugging things.
  assign pmu_paden  = dut_io_pads_aon_pmu_vddpaden_o_oval;  
  assign pmu_padrst = dut_io_pads_aon_pmu_padrst_o_oval;		

  //==================model select===================
  // 0:internal ROM    (0x0000_1000)~0x0000_1FFFF (ITCM 0x8000_0000)
  // 1:from QSPI_FLASH (0x2000_0000)
  assign dut_io_pads_bootrom_n_i_ival  = 1'b0;   // set 0 to make it rom start either flash start
  assign dut_io_pads_dbgmode0_n_i_ival = 1'b1;
  assign dut_io_pads_dbgmode1_n_i_ival = 1'b1;
  assign dut_io_pads_dbgmode2_n_i_ival = 1'b1;
  //

  e203_soc_top dut
  (
    //System CLOCK
    .hfextclk(clk_16M),
    .hfxoscen(),

    //RTC CLOCK
    .lfextclk(CLK32768KHZ), 
    .lfxoscen(),

    //JTAG
    .io_pads_jtag_TCK_i_ival(dut_io_pads_jtag_TCK_i_ival),
    .io_pads_jtag_TMS_i_ival(dut_io_pads_jtag_TMS_i_ival),
    .io_pads_jtag_TDI_i_ival(dut_io_pads_jtag_TDI_i_ival),
    .io_pads_jtag_TDO_o_oval(dut_io_pads_jtag_TDO_o_oval),
    .io_pads_jtag_TDO_o_oe  (dut_io_pads_jtag_TDO_o_oe),

    //GPIO A
    .io_pads_gpioA_i_ival(dut_io_pads_gpioA_i_ival),
    .io_pads_gpioA_o_oval(dut_io_pads_gpioA_o_oval),
    .io_pads_gpioA_o_oe  (dut_io_pads_gpioA_o_oe),

    //GPIO B
    .io_pads_gpioB_i_ival(dut_io_pads_gpioB_i_ival),
    .io_pads_gpioB_o_oval(dut_io_pads_gpioB_o_oval),
    .io_pads_gpioB_o_oe  (dut_io_pads_gpioB_o_oe),

    //QPSI
    .io_pads_qspi0_sck_o_oval (),
    .io_pads_qspi0_cs_0_o_oval(),
    .io_pads_qspi0_dq_0_i_ival(),
    .io_pads_qspi0_dq_0_o_oval(),
    .io_pads_qspi0_dq_0_o_oe  (),
    .io_pads_qspi0_dq_1_i_ival(),
    .io_pads_qspi0_dq_1_o_oval(),
    .io_pads_qspi0_dq_1_o_oe  (),
    .io_pads_qspi0_dq_2_i_ival(),
    .io_pads_qspi0_dq_2_o_oval(),
    .io_pads_qspi0_dq_2_o_oe  (),
    .io_pads_qspi0_dq_3_i_ival(),
    .io_pads_qspi0_dq_3_o_oval(),
    .io_pads_qspi0_dq_3_o_oe  (),
    // .io_pads_qspi0_sck_o_oval (dut_io_pads_qspi0_sck_o_oval),
    // .io_pads_qspi0_cs_0_o_oval(dut_io_pads_qspi0_cs_0_o_oval),
    // .io_pads_qspi0_dq_0_i_ival(dut_io_pads_qspi0_dq_0_i_ival),
    // .io_pads_qspi0_dq_0_o_oval(dut_io_pads_qspi0_dq_0_o_oval),
    // .io_pads_qspi0_dq_0_o_oe  (dut_io_pads_qspi0_dq_0_o_oe),
    // .io_pads_qspi0_dq_1_i_ival(dut_io_pads_qspi0_dq_1_i_ival),
    // .io_pads_qspi0_dq_1_o_oval(dut_io_pads_qspi0_dq_1_o_oval),
    // .io_pads_qspi0_dq_1_o_oe  (dut_io_pads_qspi0_dq_1_o_oe),
    // .io_pads_qspi0_dq_2_i_ival(dut_io_pads_qspi0_dq_2_i_ival),
    // .io_pads_qspi0_dq_2_o_oval(dut_io_pads_qspi0_dq_2_o_oval),
    // .io_pads_qspi0_dq_2_o_oe  (dut_io_pads_qspi0_dq_2_o_oe),
    // .io_pads_qspi0_dq_3_i_ival(dut_io_pads_qspi0_dq_3_i_ival),
    // .io_pads_qspi0_dq_3_o_oval(dut_io_pads_qspi0_dq_3_o_oval),
    // .io_pads_qspi0_dq_3_o_oe  (dut_io_pads_qspi0_dq_3_o_oe),


    // Note: this is the real SoC top level reset signal
    //RST_N
    .io_pads_aon_erst_n_i_ival(ck_rst),

    //PMU
    .io_pads_aon_pmu_dwakeup_n_i_ival(dut_io_pads_aon_pmu_dwakeup_n_i_ival),
    .io_pads_aon_pmu_vddpaden_o_oval(dut_io_pads_aon_pmu_vddpaden_o_oval),
    .io_pads_aon_pmu_padrst_o_oval    (dut_io_pads_aon_pmu_padrst_o_oval ),

    .io_pads_bootrom_n_i_ival       (dut_io_pads_bootrom_n_i_ival),
    .io_pads_dbgmode0_n_i_ival       (dut_io_pads_dbgmode0_n_i_ival),
    .io_pads_dbgmode1_n_i_ival       (dut_io_pads_dbgmode1_n_i_ival),
    .io_pads_dbgmode2_n_i_ival       (dut_io_pads_dbgmode2_n_i_ival) 
  );

  // Assign reasonable values to otherwise unconnected inputs to chip top

  wire iobuf_dwakeup_o;
  IOBUF
  #(
    .DRIVE(12),
    .IBUF_LOW_PWR("TRUE"),
    .IOSTANDARD("DEFAULT"),
    .SLEW("SLOW")
  )
  IOBUF_dwakeup_n
  (
    .O(iobuf_dwakeup_o),
    .IO(mcu_wakeup),
    .I(1'b1),
    .T(1'b1)
  );
  assign dut_io_pads_aon_pmu_dwakeup_n_i_ival = (~iobuf_dwakeup_o);
  assign dut_io_pads_aon_pmu_vddpaden_i_ival = 1'b1;

  //-----------------GPIO for UART-------------------
  //      16--->UART0:RX               UART1:RX
  //      17--->UART0:TX               UART1:TX
  //      18--->UART2:RX
  //      19--->UART2:TX
  //UART0
  IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  uart0_rx_iobuf
  (
    .O  (dut_io_pads_gpioA_i_ival[16]),   // Buffer output
    .IO (uart0_rx),                       // Buffer inout port (connect directly to top-level port)
    .I  (dut_io_pads_gpioA_o_oval[16]),   // Buffer input
    .T  (~dut_io_pads_gpioA_o_oe[16])     // 3-state enable input, high=input, low=output
  );
  IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  uart0_tx_iobuf
  (
    .O  (dut_io_pads_gpioA_i_ival[17]),
    .IO (uart0_tx),
    .I  (dut_io_pads_gpioA_o_oval[17]),
    .T  (~dut_io_pads_gpioA_o_oe[17])
  );


  //-----------------GPIO for LEDs and KEYs-------------------
  IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  gpioA_0_iobuf
  (
    .O  (dut_io_pads_gpioA_i_ival[0]),
    .IO (led3),
    .I  (dut_io_pads_gpioA_o_oval[0]),
    .T  (~dut_io_pads_gpioA_o_oe[0])
  );

  IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  gpioA_1_iobuf
  (
    .O  (dut_io_pads_gpioA_i_ival[1]),
    .IO (led4),
    .I  (dut_io_pads_gpioA_o_oval[1]),
    .T  (~dut_io_pads_gpioA_o_oe[1])
  );

  IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  gpioA_2_iobuf
  (
    .O  (dut_io_pads_gpioA_i_ival[2]),
    .IO (key3),
    .I  (dut_io_pads_gpioA_o_oval[2]),
    .T  (~dut_io_pads_gpioA_o_oe[2])
  );

  IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  gpioA_3_iobuf
  (
    .O  (dut_io_pads_gpioA_i_ival[3]),
    .IO (key4),
    .I  (dut_io_pads_gpioA_o_oval[3]),
    .T  (~dut_io_pads_gpioA_o_oe[3])
  );

  // IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  // gpioA_4_iobuf
  // (
  //   .O  (dut_io_pads_gpioA_i_ival[4]),
  //   .IO (gpioA_4),
  //   .I  (dut_io_pads_gpioA_o_oval[4]),
  //   .T  (~dut_io_pads_gpioA_o_oe[4])
  // );

  // IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  // gpioA_5_iobuf
  // (
  //   .O  (dut_io_pads_gpioA_i_ival[5]),
  //   .IO (gpioA_5),
  //   .I  (dut_io_pads_gpioA_o_oval[5]),
  //   .T  (~dut_io_pads_gpioA_o_oe[5])
  // );

  // IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  // gpioA_6_iobuf
  // (
  //   .O  (dut_io_pads_gpioA_i_ival[6]),
  //   .IO (gpioA_6),
  //   .I  (dut_io_pads_gpioA_o_oval[6]),
  //   .T  (~dut_io_pads_gpioA_o_oe[6])
  // );

  // IOBUF #(.DRIVE (12), .IBUF_LOW_PWR("TRUE"),.IOSTANDARD ("DEFAULT"),.SLEW ("SLOW"))
  // gpioA_7_iobuf
  // (
  //   .O  (dut_io_pads_gpioA_i_ival[7]),
  //   .IO (gpioA_7),
  //   .I  (dut_io_pads_gpioA_o_oval[7]),
  //   .T  (~dut_io_pads_gpioA_o_oe[7])
  // );


  // assign qspi0_sck = dut_io_pads_qspi0_sck_o_oval;
  // assign qspi0_cs  = dut_io_pads_qspi0_cs_0_o_oval;
  // assign qspi0_ui_dq_o = {
  //   dut_io_pads_qspi0_dq_3_o_oval,
  //   dut_io_pads_qspi0_dq_2_o_oval,
  //   dut_io_pads_qspi0_dq_1_o_oval,
  //   dut_io_pads_qspi0_dq_0_o_oval
  // };
  // assign qspi0_ui_dq_oe = {
  //   dut_io_pads_qspi0_dq_3_o_oe,
  //   dut_io_pads_qspi0_dq_2_o_oe,
  //   dut_io_pads_qspi0_dq_1_o_oe,
  //   dut_io_pads_qspi0_dq_0_o_oe
  // };
  // assign dut_io_pads_qspi0_dq_0_i_ival = qspi0_ui_dq_i[0];
  // assign dut_io_pads_qspi0_dq_1_i_ival = qspi0_ui_dq_i[1];
  // assign dut_io_pads_qspi0_dq_2_i_ival = qspi0_ui_dq_i[2];
  // assign dut_io_pads_qspi0_dq_3_i_ival = qspi0_ui_dq_i[3];



endmodule
