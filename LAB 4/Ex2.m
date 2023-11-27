% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

wc = 0.5*pi;
Fs1 = 100;
Fs2 = 50;
N1 = 21;           % order/length of the window
N2 = 41;

Ts1 = 1/Fs1;
S = 500;
ws1=2*pi*Fs1;
wn1=wc/(ws1/2);

Ts2 = 1/Fs2;
ws2=2*pi*Fs2;
wn2=wc/(ws2/2);

% FIR filter design        
filt1 = fir1(N1-1, wn1, 'low', hamming(N1));       % N-1 is the order of the filter
filt2 = fir1(N2-1, wn1, 'low', hamming(N2));       
filt3 = fir1(N1-1, wn1, 'low', hanning(N1));       
filt4 = fir1(N2-1, wn1, 'low', hanning(N2));  

% Fs = 50Hz
filt5 = fir1(N1-1, wn2, 'low', hamming(N1));       % N-1 is the order of the filter
filt6 = fir1(N2-1, wn2, 'low', hamming(N2));       
filt7 = fir1(N1-1, wn2, 'low', hanning(N1));       
filt8 = fir1(N2-1, wn2, 'low', hanning(N2));  

% Frequency response of filter
[H1,W1] = freqz(filt1,N1); 
[H2,W2] = freqz(filt2,N2);
[H3,W3] = freqz(filt3,N1); 
[H4,W4] = freqz(filt4,N2);

% Fs = 50Hz
[H5,W5] = freqz(filt5,N1); 
[H6,W6] = freqz(filt6,N2);
[H7,W7] = freqz(filt7,N1); 
[H8,W8] = freqz(filt8,N2);

figure;
subplot(1,2,1)
plot(W1, abs(H1));
grid on;
title('Frequency Response Window Hamming N = 21')
subplot(1,2,2)
plot(W2, abs(H2));
grid on;
title('Frequency Response Window Hamming N = 41')

figure;
subplot(1,2,1)
plot(W3, abs(H3));
grid on;
title('Frequency Response Window Hanning N = 21')
subplot(1,2,2)
plot(W4, abs(H4));
grid on;
title('Frequency Response Window Hanning N = 41')

%Initial signal
DT = 0.01;
t = 0 : DT : 500;
x = sin(15*t) + 0.25*sin(200*t);

ts1 = 0 : Ts1 : 500;
xn1 = sin(15*ts1) + 0.25*sin(200*ts1);

% Filtering the signal
y1 = filter(filt1, 1, xn1);
y2 = filter(filt2, 1, xn1);
y3 = filter(filt3, 1, xn1);
y4 = filter(filt4, 1, xn1);

% Fs = 50Hz
y5 = filter(filt1, 1, xn1);
y6 = filter(filt6, 1, xn1);
y7 = filter(filt7, 1, xn1);
y8 = filter(filt8, 1, xn1);

% Signal Spectrum
Fsp1 = -Fs1/2 : Fs1/S : (Fs1/2 - (Fs1/S));
Fsp2 = -Fs2/2 : Fs2/S : (Fs2/2 - (Fs2/S));
LengthFsp1 = length(Fsp1);
LengthFsp2 = length(Fsp2);

X1 = fft(xn1, LengthFsp1);
X1_1 = fftshift(X1);
X1_abs = abs(X1_1);

% Fs = 50Hz
X2 = fft(xn1, LengthFsp2);
X2_1 = fftshift(X2);
X2_abs = abs(X2_1);

% Hamming Window ,N = 21
Y1f = fft(y1, LengthFsp1);
Y1f_1 = fftshift(Y1f);
Y1f_abs = abs(Y1f_1);

% Hamming Window ,N = 41
Y2f = fft(y2, LengthFsp1);
Y2f_1 = fftshift(Y2f);
Y2f_abs = abs(Y2f_1);

% Hanning Window, N = 21
Y3f = fft(y3, LengthFsp1);
Y3f_1 = fftshift(Y3f);
Y3f_abs = abs(Y3f_1);

% Hanning Window, N = 41
Y4f = fft(y4, LengthFsp1);
Y4f_1 = fftshift(Y4f);
Y4f_abs = abs(Y4f_1);

% Fs = 50Hz
% Hamming Window ,N = 21
Y5f = fft(y1, LengthFsp2);
Y5f_1 = fftshift(Y5f);
Y5f_abs = abs(Y5f_1);

% Hamming Window ,N = 41
Y6f = fft(y6, LengthFsp2);
Y6f_1 = fftshift(Y6f);
Y6f_abs = abs(Y6f_1);

% Hanning Window, N = 21
Y7f = fft(y7, LengthFsp2);
Y7f_1 = fftshift(Y7f);
Y7f_abs = abs(Y7f_1);

% Hanning Window, N = 41
Y8f = fft(y8, LengthFsp2);
Y8f_1 = fftshift(Y8f);
Y8f_abs = abs(Y8f_1);

% Fs = 100Hz
figure;
plot(Fsp1, X1_abs)
grid on;
title('Frequency Spectrum of Not Filtered Signal, Fs = 100Hz');

figure;
subplot(2,1,1)
plot(Fsp1, Y1f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hamming, N = 21, Fs = 100Hz');
subplot(2,1,2)
plot(Fsp1, Y2f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hamming, N = 41, Fs = 100Hz');

figure;
subplot(2,1,1)
plot(Fsp1, Y3f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hanning, N = 21, Fs = 100Hz');
subplot(2,1,2)
plot(Fsp1, Y4f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hanning, N = 41, Fs = 100Hz');

% Fs = 50Hz
figure;
plot(Fsp2, X2_abs)
grid on;
title('Frequency Spectrum of Not Filtered Signal, Fs = 50Hz');

figure;
subplot(2,1,1)
plot(Fsp2, Y5f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hamming, N = 21, Fs = 50Hz');
subplot(2,1,2)
plot(Fsp2, Y6f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hamming, N = 41, Fs = 50Hz');

figure;
subplot(2,1,1)
plot(Fsp2, Y7f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hanning, N = 21, Fs = 50Hz');
subplot(2,1,2)
plot(Fsp2, Y8f_abs)
grid on;
title('Frequency Spectrum of  Filtered Signal, Window: Hanning, N = 41, Fs = 50Hz');
