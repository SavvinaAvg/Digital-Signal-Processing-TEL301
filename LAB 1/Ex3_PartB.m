clc; clear; close all;

% Definition of Signals
N = 128;
DT = 0.0001;
t = 0:DT:0.25;

Fs1 = 8000; Ts1 = 1/Fs1;
tx1 = 0 : Ts1 : 0.25;
F = -Fs1/2 : Fs1/N : (Fs1/2 - (Fs1/N));
LengthF = length(F);

for f0 = 100:125:475
    sig_i = sin(2*pi*f0*t + 48);
    X = fft(sig_i, LengthF);
    X1 = fftshift(X);
    X1_abs = abs(X1);
    figure;
    stem(F, X1_abs)
    title('Signal Spectrum');
    xlabel('F (Hz)')
    ylabel('X(F)')
end;

for f0 = 7525:125:7900
    sig_i = sin(2*pi*f0*t + 48);
    X = fft(sig_i, LengthF);
    X1 = fftshift(X);
    X1_abs = abs(X1);
    figure;
    stem(F, X1_abs)
    title('Signal Spectrum');
    xlabel('F (Hz)')
    ylabel('X(F)')
end;
