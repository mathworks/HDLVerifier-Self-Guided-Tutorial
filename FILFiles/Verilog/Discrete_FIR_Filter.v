// Copyright 2025 The MathWorks, Inc.
// -------------------------------------------------------------
// 
// File Name: hdl_prj\hdlsrc\Verilog\pulse_detector_v4\Discrete_FIR_Filter.v
// Created: 2024-04-02 19:26:17
// 
// Generated by MATLAB 9.14 and HDL Coder 4.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Discrete_FIR_Filter
// Source Path: pulse_detector_v4/Pulse Detector/Discrete FIR Filter
// Hierarchy Level: 1
// 
// Discrete FIR Filter
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Discrete_FIR_Filter
          (clk,
           reset,
           enb,
           dataIn_re,
           dataIn_im,
           validIn,
           dataOut_re,
           dataOut_im,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   signed [15:0] dataIn_re;  // sfix16_En14
  input   signed [15:0] dataIn_im;  // sfix16_En14
  input   validIn;
  output  signed [39:0] dataOut_re;  // sfix40_En37
  output  signed [39:0] dataOut_im;  // sfix40_En37
  output  validOut;


  wire syncReset;


  assign syncReset = 1'b0;



  Filter u_FilterBank (.clk(clk),
                       .reset(reset),
                       .enb(enb),
                       .dataIn_re(dataIn_re),  // sfix16_En14
                       .dataIn_im(dataIn_im),  // sfix16_En14
                       .validIn(validIn),
                       .syncReset(syncReset),
                       .dataOut_re(dataOut_re),  // sfix40_En37
                       .dataOut_im(dataOut_im),  // sfix40_En37
                       .validOut(validOut)
                       );

endmodule  // Discrete_FIR_Filter

