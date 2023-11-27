% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 3Á %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

S = 500;    %Samples
Fs = 10000; %Sampling Frequency
Fn = Fs/2;  %Nyquist Frequency

%Filtering Data
Wp = 2*pi*3000; %3000/Fn;
Ws = 2*pi*4000; %4000/Fn;
Rp = 3;
Rs1 = 30;
Rs2 = 50;

% Filter with 30 dB stopband
[N,Wc] = buttord(Wp,Ws,Rp,Rs1,'s');
[z,p,k] = buttap(N);                %returns the zeros, poles, and gain for an N-th order normalized prototype Butterworth analog lowpass filter
[num,den] = zp2tf(z,p,k);           %Zero-pole to transfer function conversion
[num1,den1] = lp2lp(num,den,Wc);    %Lowpass to lowpass analog filter transformation

%Transforming the filter from analog to digital
[numd, dend] = bilinear(num1, den1, Fs); 

% Filter with 50 dB stopband
[N2,Wc2] = buttord(Wp,Ws,Rp,Rs2,'s');
[z2,p2,k2] = buttap(N2);         %returns the zeros, poles, and gain for an N-th order normalized prototype Butterworth analog lowpass filter
[num2,den2] = zp2tf(z2,p2,k2);    %Zero-pole to transfer function conversion
[num3,den3] = lp2lp(num2,den2,Wc2); %Lowpass to lowpass analog filter transformation

%Transforming the filter from analog to digital
[numd2, dend2] = bilinear(num3, den3, Fs);

%Initial signal
t = 0 : 0.001 : 0.5;
x = 1 + cos(1000*t) + cos(16000*t) + cos(30000*t);
%figure;
%plot(t,x)

%Sampling procedure
ts = 0 : 1/Fs : 0.05;
xn = 1 + cos(1000*ts) + cos(16000*ts) + cos(30000*ts);
figure;
subplot(3,1,1);
stem(ts,xn)
xlabel('time');
ylabel('x(nts)');
title('Sampled Signal');

% Filtering the signal
y1 = filter(numd, dend, xn);
y2 = filter(numd2, dend2, xn);
subplot(3,1,2);
stem(ts,y1)
xlabel('time');
ylabel('x(nTs)');
ylim([0 3]);
title('Filtered Signal with stopband 30db');
subplot(3,1,3);
stem(ts,y2)
xlabel('time');
ylabel('x(nTs)');
ylim([0 3]);
title('Filtered Signal with stopband 50db');

% Signal Spectrum
Fsp = -Fs/2 : Fs/S : (Fs/2 - (Fs/S));
LengthFsp = length(Fsp);
X = fft(xn, LengthFsp);
X1 = fftshift(X);
X1_abs = abs(X1);

Y1 = fft(y1, LengthFsp);
Y1_1 = fftshift(Y1);
Y1_abs = abs(Y1_1);

Y2 = fft(y2, LengthFsp);
Y2_1 = fftshift(Y2);
Y2_abs = abs(Y2_1);

figure;
subplot(3,1,1)
plot(Fsp, X1_abs)
title('Absolut Value of the Signals Spectrum before Filtering');
xlabel('F (Hz)')
ylabel('|X(F)|')

subplot(3,1,2)
plot(Fsp, Y1_abs)
title('Filtered Signal with stopband 30db');
xlabel('F (Hz)')
ylabel('|X(F)|')

subplot(3,1,3)
plot(Fsp, Y2_abs)
title('Filtered Signal with stopband 50db');
xlabel('F (Hz)')
ylabel('|X(F)|')