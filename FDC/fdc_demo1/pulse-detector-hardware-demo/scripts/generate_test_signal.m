function [testSignal, varargout] = generate_test_signal(signalLength,noiseScale,PulseLoc)
% Copyright 2025 The MathWorks, Inc.

%GENERATE_TEST_SIGNAL Generate input test signal for pulse detector.

% Load pulse from file
matdata = load('pulse.mat');
pulse = matdata.pulse;

PulseLen = length(pulse);

if nargin < 3
    PulseLoc = randi(signalLength-PulseLen*2);
    varargout{1} = PulseLoc;
end

signal = zeros(signalLength,1);
signal(PulseLoc:PulseLoc+PulseLen-1) = pulse;

% Shuffle random number generator
rseedCurr = rng;
rng('shuffle');

% Create Rx signal by adding noise
Noise = complex(randn(signalLength,1),randn(signalLength,1))*noiseScale;
testSignal = signal + Noise;

% Scale Rx signal to +/- one
scale1 = max([abs(real(testSignal)); abs(imag(testSignal))]);
testSignal = testSignal/scale1;

rng(rseedCurr);

end

