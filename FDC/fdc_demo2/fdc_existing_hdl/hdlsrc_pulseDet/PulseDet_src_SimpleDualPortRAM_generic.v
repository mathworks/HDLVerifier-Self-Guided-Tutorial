// Copyright 2025 The MathWorks, Inc.
// -------------------------------------------------------------
// 
// File Name: custom_hdl_prj\hdlsrc\pulse_detector_ipcore\PulseDet_src_SimpleDualPortRAM_generic.v
// Created: 2023-08-26 18:01:38
// 
// Generated by MATLAB 9.13 and HDL Coder 4.0
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: PulseDet_src_SimpleDualPortRAM_generic
// Source Path: pulse_detector_ipcore/Pulse Detector IP/To Output Stream/HDL_FIFO/HDL_FIFO_classic/SimpleDualPortRAM_generic
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module PulseDet_src_SimpleDualPortRAM_generic
          (clk,
           enb,
           wr_din_re,
           wr_din_im,
           wr_addr,
           wr_en,
           rd_addr,
           rd_dout_re,
           rd_dout_im);

  parameter integer AddrWidth  = 1;
  parameter integer DataWidth  = 1;

  input   clk;
  input   enb;
  input   signed [DataWidth - 1:0] wr_din_re;  // parameterized width
  input   signed [DataWidth - 1:0] wr_din_im;  // parameterized width
  input   [AddrWidth - 1:0] wr_addr;  // parameterized width
  input   wr_en;  // ufix1
  input   [AddrWidth - 1:0] rd_addr;  // parameterized width
  output  signed [DataWidth - 1:0] rd_dout_re;  // parameterized width
  output  signed [DataWidth - 1:0] rd_dout_im;  // parameterized width


  reg  [DataWidth*2 - 1:0] ram [2**AddrWidth - 1:0];
  reg  [DataWidth*2 - 1:0] data_int;
  integer i;

  initial begin
    for (i=0; i<=2**AddrWidth - 1; i=i+1) begin
      ram[i] = 0;
    end
    data_int = 0;
  end


  always @(posedge clk)
    begin : SimpleDualPortRAM_generic_process
      if (enb == 1'b1) begin
        if (wr_en == 1'b1) begin
          ram[wr_addr] <= {wr_din_re, wr_din_im};
        end
        data_int <= ram[rd_addr];
      end
    end

  assign rd_dout_re = data_int[DataWidth*2-1:DataWidth];
  assign rd_dout_im = data_int[DataWidth-1:0];

endmodule  // PulseDet_src_SimpleDualPortRAM_generic

