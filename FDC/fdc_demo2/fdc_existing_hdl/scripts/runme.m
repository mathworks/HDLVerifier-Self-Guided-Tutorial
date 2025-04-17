% Copyright 2025 The MathWorks, Inc.
system('vivado -mode batch -source ./scripts/data_capture_zedboard.tcl &')
addpath(genpath('existing_hdl_dataCapture'))
addpath(genpath('hdlsrc_dataCapture'))
