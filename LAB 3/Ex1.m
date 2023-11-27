% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

Fs = 10000; %Sampling Frequency
Fn = Fs/2;  %Nyquist Frequency
Wp = 2*pi*3000; %3000/Fn;
Ws = 2*pi*4000; %4000/Fn;
Rp = 3;
Rs1 = 30;
Rs2 = 50;
[N,Wc] = buttord(Wp,Ws,Rp,Rs1,'s');
[z,p,k] = buttap(N);                %returns the zeros, poles, and gain for an N-th order normalized prototype Butterworth analog lowpass filter
[num,den] = zp2tf(z,p,k);           %Zero-pole to transfer function conversion
[num1,den1] = lp2lp(num,den,Wc);    %Lowpass to lowpass analog filter transformation

f = linspace(0,Fn,2048);
H_analog = freqs(num1,den1,2*pi*f);
H_analog_dB = 20*log10(abs(H_analog));

%Transforming the filter from analog to digital
[numd, dend] = bilinear(num1, den1, Fs);
H_digital = freqz(numd, dend, f, Fs);
H_digital_db = 20*log10(abs(H_digital));

[N2,Wc2] = buttord(Wp,Ws,Rp,Rs2,'s');
[z2,p2,k2] = buttap(N2);         %returns the zeros, poles, and gain for an N-th order normalized prototype Butterworth analog lowpass filter
[num2,den2] = zp2tf(z2,p2,k2);    %Zero-pole to transfer function conversion
[num3,den3] = lp2lp(num2,den2,Wc2); %Lowpass to lowpass analog filter transformation

H_analog2 = freqs(num3,den3,2*pi*f);
H_analog_dB2 = 20*log10(abs(H_analog2));

%Transforming the filter from analog to digital
[numd2, dend2] = bilinear(num3, den3, Fs);
H_digital2 = freqz(numd2, dend2, f, Fs);
H_digital_db2 = 20*log10(abs(H_digital2));


figure;
subplot(2,1,1);
plot(f, H_digital_db)
hold on; grid on;
plot(f, H_analog_dB)
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Butterworth Lowpass Filter, stopband 30db');

subplot(2,1,2)
plot(f, H_digital_db2)
hold on; grid on;
plot(f, H_analog_dB2)
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Butterworth Lowpass Filter, stopband 50db');