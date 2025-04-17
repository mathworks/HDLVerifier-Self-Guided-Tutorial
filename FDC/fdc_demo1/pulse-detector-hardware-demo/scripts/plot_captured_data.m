% Copyright 2025 The MathWorks, Inc.

figure(101)
plotLen = 4000;

subplot(411)
plot(real(dataCaptureOut.tp_data_in_re(1:plotLen))); hold
plot(dataCaptureOut.tp_valid_in(1:plotLen)); hold
title('input data & valid')

subplot(412)
plot(dataCaptureOut.tp_filter_out_re(1:plotLen))
title('filter output')

subplot(413)
plot(dataCaptureOut.tp_mag_sq_out(1:plotLen))
title('magnitude squared output')

subplot(414)
plot(dataCaptureOut.tp_detected(1:plotLen))
title('detected')