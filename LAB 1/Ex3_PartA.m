clc; clear; close all;

% Definition of Signals
N = 128;
DT = 0.0001;
t = 0:DT:0.25;
sig = 10*cos(2*pi*20*t) - 4*sin(2*pi*40*t + 5);
figure;
plot(t, sig);  grid on;
title('The Original Signal');
xlabel('t')
ylabel('sig(t)')

Fs1 = 100; Ts1 = 1/Fs1; %Fs >= 80Hz
tx1 = 0 : Ts1 : 0.25;
sig1 = 10*cos(2*pi*20*tx1) - 4*sin(2*pi*40*tx1 + 5);
figure;
plot(t, sig); hold on; grid on;
stem(tx1, sig1);
title('Smapling for Fs = 100');
xlabel('t (sec)')
ylabel('sig1(t)')

% Signal Spectrum
F = -Fs1/2 : Fs1/N : (Fs1/2 - (Fs1/N));
LengthF = length(F);
X = fft(sig1, LengthF);
X1 = fftshift(X);
X1_abs = abs(X1);
figure;
subplot(3,1,1);
stem(F, X)
axis([-50 50 -50 160])
title('Fourier Transform');
xlabel('F (Hz)')
ylabel('X(F)')

subplot(3,1,2);
stem(F, X1)
axis([-50 50 -50 160])
title('Shifted Signal to the Center');
xlabel('F (Hz)')
ylabel('X(F)')

subplot(3,1,3);
stem(F, X1_abs)
axis([-50 50 -50 160])
title('Absolut Value of the Shifted Signal');
xlabel('F (Hz)')
ylabel('X(F)')