% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

Wc = 2;
Ts = 0.2;
Fs = 1/Ts;
Rp = 3;
Fn = Fs/2;

fc = Wc/(2*pi);
fk = fc*2/Fs;

% A)
N1 = 2;
[num1,den1] = cheby1(N1, Rp, fk, 'high');

f = linspace(0, Fn, 256);
%Transforming the filter from analog to digital
H_analog1 = freqs(num1, den1, 2*pi*f);
H_analog_db1 = 20*log10(abs(H_analog1));
H_digital1 = freqz(num1, den1, f, Fs);
H_digital_db1 = 20*log10(abs(H_digital1));

% B)
N2 = 16;
[num2,den2] = cheby1(N2, Rp, fk, 'high');

%Transforming the filter from analog to digital
H_analog2 = freqs(num2, den2, 2*pi*f);
H_analog_db2 = 20*log10(abs(H_analog2));
H_digital2 = freqz(num2, den2, f, Fs);
H_digital_db2 = 20*log10(abs(H_digital2));

figure;
subplot(2,1,1);
plot(f, H_analog_db1, 'r')
hold on; grid on;
plot(f, H_analog_db2, 'b')
legend('N = 2','N = 16');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
ylim([-30 5]);
xlim([0 1]);
title('Chebyshev Analog Highpass Filter');

subplot(2,1,2);
plot(f, H_digital_db1, 'r')
hold on; grid on;
plot(f, H_digital_db2, 'b')
legend('N = 2','N = 16');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
ylim([-300 50]);
xlim([0 1]);
title('Chebyshev Digital Highpass Filter');
