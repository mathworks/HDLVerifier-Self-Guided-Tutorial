% Copyright 2025 The MathWorks, Inc.

bdclose all;clc, close all force;
addpath(genpath('..'));
rmpath(genpath('prebuilt')); %remove prebuilt folder from the path

hdlsetuptoolpath('ToolName', 'Xilinx Vivado','ToolPath', 'C:\Xilinx\Vivado\2020.2\bin\vivado.bat');


if not(isfolder('work'))
    mkdir('work');
end

cd work;
open_system('pulse_detector_ipcore')