# Hummingbird E203 hbirdv2 Porting for ZYNQ7020
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![FPGA](https://img.shields.io/badge/Platform-Xilinx%20ZYNQ7020-EE4C16)](https://www.xilinx.com)

## Project Overview
This project implements the ​`RISC-V Hummingbird E203 (hbirdv2)` core on Xilinx ZYNQ7020 SoC, providing a complete FPGA verification platform from RTL to embedded software.  

## 📁 Directory Structure
```
├── E203_RTL/ - Core RTL & Top-level Integration / 核心RTL与顶层集成
│ ├── core/ - E203 Processor Core (Pipeline, ALU, CSR) / 处理器核源码（流水线、ALU、CSR等）
│ ├── system.v - Top-level System Module / 系统顶层模块
│ └── clkdivider.v - ZYNQ Clock Divider / ZYNQ时钟分频模块
│
├── E203_SIM/ - Simulation Environment / 仿真环境
│ └── e203_tb_top.v - System Testbench / 系统测试平台
│
├── E203_Zynq_7020/ - Vivado Hardware Project / Vivado硬件工程
│
├── SDK/ - Nuclei Studio SDK Projects / Nuclei Studio软件开发工程
│
└── XDC/ - Physical Constraints / 物理约束
│ └── e203_zynq_7020.xdc - ZYNQ7020 Pin Assignment / 引脚分配文件
```

## 🛠️ Development Requirements

### Hardware Platform
- Xilinx ZYNQ-7020 Development Board  
- JTAG Debugger (OpenOCD compatible)  

### Software Tools
- ​**FPGA Toolchain**:  
  - Vivado 2018.3 + Xilinx SDK
- ​**Simulation Tools**:  
  - Vivado Simulator / VCS+Verdi
- ​**Software Compilation**:  
  - RISC-V GNU Toolchain (rv32imc-ilp32)
  - Xilinx SDK 2018.3

## 🚀 Quick Start Guide
For detailed implementation steps, please refer to：[移植教程](https://blog.csdn.net/m0_62001119/article/details/145978791?fromshare=blogdetail&sharetype=blogdetail&sharerId=145978791&sharerefer=PC&sharesource=m0_62001119&sharefrom=from_link)

## 📜 License
This project is licensed under Apache 2.0 License. Commercial use must comply with Nuclei E203's original license terms.  
