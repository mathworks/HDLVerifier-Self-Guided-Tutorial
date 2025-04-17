% Automatically generated script to launch FPGA Data Capture App
% Instantiate FPGA Data Capture System object
% Copyright 2025 The MathWorks, Inc.

if ~exist('fpgadc_obj','var') || ~isa(fpgadc_obj,'datacapture') || ~isprop(fpgadc_obj,'TimeStamp') || ~strcmpi(fpgadc_obj.TimeStamp,'26-Aug-2023 17:50:40')
    fpgadc_obj = datacapture;
end
fpgadc_obj.CaptureMode = 'nonblocking';
fpgadc_obj.launchApp;
