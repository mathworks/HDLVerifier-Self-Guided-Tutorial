%--------------------------------------------------------------------------
% HDL Workflow Script
% Generated with MATLAB 9.13 (R2022b) at 00:23:22 on 09/07/2024
% This script was generated using the following parameter values:
%     Filename  : 'C:\AESupportProjects\wshop\pulse-detector-hardware-demo-main\pulse-detector-hardware-demo\scripts\hdlworkflow.m'
%     Overwrite : true
%     Comments  : true
%     Headers   : true
%     DUT       : 'pulse_detector_ipcore/Pulse Detector IP'
% To view changes after modifying the workflow, run the following command:
% >> hWC.export('DUT','pulse_detector_ipcore/Pulse Detector IP');
%--------------------------------------------------------------------------
% Copyright 2025 The MathWorks, Inc.


%% Load the Model
load_system('pulse_detector_ipcore');

%% Restore the Model to default HDL parameters
%hdlrestoreparams('pulse_detector_ipcore/Pulse Detector IP');

%% Model HDL Parameters
%% Set Model 'pulse_detector_ipcore' HDL parameters
hdlset_param('pulse_detector_ipcore', 'EnableTestpoints', 'on');
hdlset_param('pulse_detector_ipcore', 'GenerateHDLTestBench', 'off');
hdlset_param('pulse_detector_ipcore', 'HDLSubsystem', 'pulse_detector_ipcore/Pulse Detector IP');
hdlset_param('pulse_detector_ipcore', 'OptimizationReport', 'on');
hdlset_param('pulse_detector_ipcore', 'ReferenceDesign', 'Default system with AXI4-Stream interface');
hdlset_param('pulse_detector_ipcore', 'ResetType', 'Synchronous');
hdlset_param('pulse_detector_ipcore', 'ResourceReport', 'on');
hdlset_param('pulse_detector_ipcore', 'ScalarizePorts', 'DUTLevel');
hdlset_param('pulse_detector_ipcore', 'SynthesisTool', 'Xilinx Vivado');
hdlset_param('pulse_detector_ipcore', 'SynthesisToolChipFamily', 'Zynq');
hdlset_param('pulse_detector_ipcore', 'SynthesisToolDeviceName', 'xc7z020');
hdlset_param('pulse_detector_ipcore', 'SynthesisToolPackageName', 'clg484');
hdlset_param('pulse_detector_ipcore', 'SynthesisToolSpeedValue', '-1');
hdlset_param('pulse_detector_ipcore', 'TargetDirectory', 'hdl_prj\hdlsrc');
hdlset_param('pulse_detector_ipcore', 'TargetFrequency', 50);
hdlset_param('pulse_detector_ipcore', 'TargetPlatform', 'ZedBoard');
hdlset_param('pulse_detector_ipcore', 'Workflow', 'IP Core Generation');

% Set SubSystem HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'AXI4RegisterReadback', 'on');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'AXI4SlaveIDWidth', '12');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'IncludeDataCaptureControlLogicEnable', 'on');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'IPCoreName', 'PulseDetector');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'IPDataCaptureBufferSize', '4096');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'ProcessorFPGASynchronization', 'Free running');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP', 'TestPointMapping', {{'data_in','FPGA Data Capture','Trigger and Data'},{'valid_in','FPGA Data Capture','Trigger and Data'},{'mag_sq_out','FPGA Data Capture','Trigger and Data'},{'detected','FPGA Data Capture','Trigger and Data'},{'filter_out','FPGA Data Capture','Trigger and Data'}});

% Set Inport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_in_data', 'IOInterface', 'AXI4-Stream Slave');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_in_data', 'IOInterfaceMapping', 'Data');

% Set Inport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_in_valid', 'IOInterface', 'AXI4-Stream Slave');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_in_valid', 'IOInterfaceMapping', 'Valid');

% Set Inport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/threshold', 'IOInterface', 'AXI4-Lite');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/threshold', 'IOInterfaceMapping', 'x"100"');

% Set Inport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/output_length', 'IOInterface', 'AXI4-Lite');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/output_length', 'IOInterfaceMapping', 'x"104"');

% Set Inport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_out_ready', 'IOInterface', 'AXI4-Stream Master');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_out_ready', 'IOInterfaceMapping', 'Ready (optional)');

% Set Outport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_out_data', 'IOInterface', 'AXI4-Stream Master');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_out_data', 'IOInterfaceMapping', 'Data');

% Set Outport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_out_valid', 'IOInterface', 'AXI4-Stream Master');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_out_valid', 'IOInterfaceMapping', 'Valid');

% Set Outport HDL parameters
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_in_ready', 'IOInterface', 'AXI4-Stream Slave');
hdlset_param('pulse_detector_ipcore/Pulse Detector IP/stream_in_ready', 'IOInterfaceMapping', 'Ready (optional)');


%% Workflow Configuration Settings
% Construct the Workflow Configuration Object with default settings
hWC = hdlcoder.WorkflowConfig('SynthesisTool','Xilinx Vivado','TargetWorkflow','IP Core Generation');

% Specify the top level project directory
hWC.ProjectFolder = 'hdl_prj';
hWC.ReferenceDesignToolVersion = '2020.2';
hWC.IgnoreToolVersionMismatch = false;

% Set Workflow tasks to run
hWC.RunTaskGenerateRTLCodeAndIPCore = true;
hWC.RunTaskCreateProject = true;
hWC.RunTaskGenerateSoftwareInterface = true;
hWC.RunTaskBuildFPGABitstream = true;
hWC.RunTaskProgramTargetDevice = false;

% Set properties related to 'RunTaskGenerateRTLCodeAndIPCore' Task
hWC.IPCoreRepository = '';
hWC.GenerateIPCoreReport = true;

% Set properties related to 'RunTaskCreateProject' Task
hWC.Objective = hdlcoder.Objective.None;
hWC.AdditionalProjectCreationTclFiles = '';
hWC.EnableIPCaching = false;

% Set properties related to 'RunTaskGenerateSoftwareInterface' Task
hWC.GenerateSoftwareInterfaceModel = false;
hWC.OperatingSystem = '';
hWC.HostTargetInterface = 'Ethernet';
hWC.GenerateHostInterfaceModel = false;
hWC.GenerateHostInterfaceScript = true;

% Set properties related to 'RunTaskBuildFPGABitstream' Task
hWC.RunExternalBuild = true;
hWC.EnableDesignCheckpoint = false;
hWC.TclFileForSynthesisBuild = hdlcoder.BuildOption.Default;
hWC.CustomBuildTclFile = '';
hWC.DefaultCheckpointFile = 'Default';
hWC.RoutedDesignCheckpointFilePath = '';
hWC.MaxNumOfCoresForBuild = '8';

% Set properties related to 'RunTaskProgramTargetDevice' Task
hWC.ProgrammingMethod = hdlcoder.ProgrammingMethod.Download;
hWC.IPAddress = '192.168.1.101';
hWC.SSHUsername = 'root';
hWC.SSHPassword = 'root';

% Validate the Workflow Configuration Object
hWC.validate;

%% Run the workflow
hdlcoder.runWorkflow('pulse_detector_ipcore/Pulse Detector IP', hWC);
