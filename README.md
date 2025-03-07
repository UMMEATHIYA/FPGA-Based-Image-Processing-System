### Overview
This project implements an FPGA-based image processing system using Verilog. It performs edge detection using the **Sobel operator** on an 8-bit grayscale image. The system processes pixel data in real time and can be integrated with an external display or memory.

### Features
- Implements a **Sobel Edge Detector**
- Designed for **real-time image processing**
- Optimized for **low power consumption**
- Can be synthesized for **Xilinx or Intel FPGA boards**

### Files
- **sobel_edge_detector.v** - The main Verilog module for edge detection
- **sobel_edge_detector_tb.v** - Testbench for simulation and verification
- **README.md** - Documentation for setup and usage

### Requirements
- **FPGA Development Tools:**
  - Xilinx Vivado (for Xilinx boards) or Intel Quartus (for Intel boards)
  - ModelSim or Vivado Simulator for testing
- **FPGA Board:** Any FPGA with sufficient resources

### How to Run
#### 1. Simulation
1. Open Vivado/Quartus and create a new project.
2. Add `sobel_edge_detector.v` and `sobel_edge_detector_tb.v`.
3. Run the testbench to verify output.

#### 2. Synthesis & Implementation
1. Synthesize the `sobel_edge_detector.v` module.
2. Generate a bitstream and upload it to the FPGA.
3. Connect an image source and observe edge detection results.

### Next Steps
- Integrate a **VGA controller** for image display.
- Optimize further for **lower power consumption**.
- Implement **hardware acceleration techniques** for real-time performance.

### Author
Umme Athiya - FPGA & Machine Learning Enthusiast
