% Copyright 2025 The MathWorks, Inc.

pulse_detector_reference;

DT_input = numerictype(1,16,14);
DT_filter = numerictype(1,18,15);
DT_power = numerictype(1,18,11);
DT_coeff = numerictype(1,18); % coeff is treated as double if input is double

if iscolumn(CorrFilter)
    CorrFilter = transpose(CorrFilter); % need row vector for filter block
end

% Delay input data to align start of signal with detection
detectDelay = length(CorrFilter) + ceil(WindowLen/2);

% Number of samples to look back before detection
preDetectDelay = 16;

% Number of samples to output after pulse detection
outputLength = 128;

% Compute filter delay
hdlfir = dsphdl.FIRFilter(Numerator=CorrFilter);
filterLatency = getLatency(hdlfir,DT_input,[],true,1);

SimTime = length(RxSignal) + WindowLen + 30;