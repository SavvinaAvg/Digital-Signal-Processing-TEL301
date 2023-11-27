% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 3B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

S = 500;
Wc = 2;
Ts = 0.2;
Fs = 1/Ts;
Rp = 3;
Fn = Fs/2;

fc = Wc/(2*pi);
fk = fc*2/Fs;

%Initial signal
t = 0 : 0.01 : 500;
x = 1 + cos(1.5*t) + cos(5*t);
%figure;
%plot(t,x)

N = 16;
[num,den] = cheby1(N, Rp, fk, 'high');

%Sampling procedure
ts = 0 : Ts : 500;
xn = 1 + cos(1.5*ts) + cos(5*ts);
figure;
subplot(2,1,1);
stem(ts,xn)
xlabel('time');
ylabel('x(nts)');
title('Sampled Signal');

% Filtering the signal
y1 = filter(num, den, xn);
subplot(2,1,2);
stem(ts,y1)
xlabel('time');
ylabel('x(nts)');
title('Filtered Sampled Signal');

% Signal Spectrum
Fsp = -Fs/2 : Fs/S : (Fs/2 - (Fs/S));
LengthFsp = length(Fsp);
X = fft(xn, LengthFsp);
X1 = fftshift(X);
X1_abs = abs(X1);

Y1 = fft(y1, LengthFsp);
Y1_1 = fftshift(Y1);
Y1_abs = abs(Y1_1);

figure;
subplot(2,1,1)
plot(Fsp, X1_abs)
title('Absolut Value of the Signals Spectrum before Filtering');
xlabel('F (Hz)')
ylabel('|X(F)|')

subplot(2,1,2)
plot(Fsp, Y1_abs)
title('Filtered Signal');
xlabel('F (Hz)')
ylabel('|X(F)|')