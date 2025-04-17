# Pulse Detector Hardware Demo

This demo is currently configured to use the Zed board. It has been tested using 22b.

## Setup

- Connect the Ethernet and the USB JTAG cables to the Zed board.
- Configure the Zed board using the HDL Coder Zynq HSP (one time only). If not using the default IP address `192.168.1.101`, modify `IPAddress` in **pulse_detector_ipcore_hw_demo.mlx**

## How I run the demo
1. Run **program_board.m** to program the Zed board
2. Run **pulse_detector_ipcore_hw_demo.mlx** to read and write data to the board via FPGA IO. The script writes a frame of data to the HW pulse detector; when the pulse detector detected output goes high, the (delayed) input data is buffered and sent to the host.
3. After a successful run, set `threshold` too high on purpose (e.g. 2). The AXI-stream output read will timeout.
4. Use FPGA Data Capture to debug internal signals. Run **launchDataCaptureApp.m** to open the UI.
5. Capture on trigger using `tp_valid_in` rising edge
6. Run **pulse_detector_ipcore_hw_demo.mlx** to trigger a capture
7. Run **plot_captured_data.m** to plot captured data. Observe that magnitude squared output peak is generated but its value is below detection threshold. Hence no detected output is generated, causing the FPGA read to timeout.
	
## To re-generate FPGA IO and FDC files
1. Open **pulse_detector_ipcore.slx** and run HDLWA through all the steps.
2. Optionally generate FPGA programming script in the last step of HDLWA. Note that the generated script uses a different programming method compared to **program_board.m**
3. Manually set the FPGADataCapture object property `CaptureMode = 'nonblocking'`, either in **FPGADataCapture.m** or in **launchDataCaptureApp.m** 



