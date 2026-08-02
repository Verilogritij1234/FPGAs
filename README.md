# Digital Logic & RTL-to-GDSII Portfolio 🚀

This repository contains a collection of foundational and intermediate digital logic circuits implemented in Verilog. It serves as a dual-purpose workspace for both **FPGA prototyping** and **ASIC logic synthesis/physical design**. 

The designs range from basic combinatorial logic to error-correcting codes, complete with simulation testbenches, Quartus project files for hardware deployment, and OpenROAD/Yosys scripts for standard cell synthesis.

## ✨ Key Highlights

* **FPGA Prototyping:** Includes `.qpf` and `.qsf` Quartus project files targeting the Intel DE1-SoC development board.
* **ASIC Synthesis & PnR:** Features `.tcl` execution scripts (`my_flow.tcl`, `my_openroad_flow.tcl`), alongside generated gate-level netlists (`.json`, `.v`) and `.def` layout files utilizing Skywater and Nangate OpenPDKs.
* **Robust Verification:** Every module is paired with a dedicated testbench (`_tb.v`) and output logs (`.out`, `.vcd`) to ensure functional correctness prior to synthesis.

## 🛠️ Implemented Modules

* **N-Bit Adder (`adder_nbit.v`, `adder_nbit_top.v`):** Parameterized adder logic for scalable arithmetic operations.
* **Hamming (7,4) SECDED (`hamming_74_*.v`, `hamming_secded_top.v`):** Single-Error Correcting and Double-Error Detecting encoder and decoder.
* **Hex to 7-Segment Decoder (`hex_7seg_decoder.v`):** Combinational logic for driving 7-segment displays, complete with physical design `.def` outputs.
* **Priority Encoder (`priority_encoder.v`):** Hardware priority resolution logic.
* **Board I/O Interfacing (`blinky_led.v`, `switches_LED.v`, `multiplexer_to_led.v`):** Modules designed specifically to interface with the switches and LEDs on the DE1-SoC board.
* **Noise Adder (`noise_adder.v`):** Custom module for signal manipulation and testing.

## 💻 Toolchain & Prerequisites

To simulate, synthesize, and deploy these designs, the following tools are utilized:

* **Simulation:** Icarus Verilog (`iverilog`) / ModelSim (indicated by `.cr.mti` / `.mpf` files).
* **Waveform Viewing:** GTKWave (for viewing `.vcd` files).
* **FPGA Flow:** Intel Quartus Prime.
* **ASIC Flow:** Yosys (Logic Synthesis) & OpenROAD (Physical Design).

## 🚀 Usage 

### Running Simulations
Compile the RTL and Testbench using your preferred simulator. For Icarus Verilog:
```bash
iverilog -o sim_out rtl_module.v rtl_module_tb.v
vvp sim_out
