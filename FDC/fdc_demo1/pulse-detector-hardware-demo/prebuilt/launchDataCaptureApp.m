% Automatically generated script to launch FPGA Data Capture App
% Instantiate FPGA Data Capture System object
% Copyright 2025 The MathWorks, Inc.

if ~exist('fpgadc_obj','var') || ~isa(fpgadc_obj,'FPGADataCapture') || ~isprop(fpgadc_obj,'TimeStamp') || ~strcmpi(fpgadc_obj.TimeStamp,'23-Sep-2022 11:45:12')
    fpgadc_obj = FPGADataCapture;
end
fpgadc_obj.CaptureMode = 'nonblocking';
fpgadc_obj.launchApp;
