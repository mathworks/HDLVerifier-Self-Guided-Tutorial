% Copyright 2025 The MathWorks, Inc.

%% Program the board with bitstream and devicetree

% Board IP address
IPAddress = '192.168.1.101';

% Bitstream file
bitFile = fullfile('prebuilt','pulse_detector_zed.bit');

% Devicetree file
dtbFile = fullfile('prebuilt','devicetree_pulse_detector_ipcore.dtb');

% Board connection object
hw=xilinxsoc(IPAddress,'root','root');

% Program the board
hw.programFPGA(bitFile,dtbFile);
