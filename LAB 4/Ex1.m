% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Exercise 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc; clear; close all;

wc = 0.4*pi;
Fs = 100;
N = 21;           % order/length of the window

Ts=1/Fs;
ws=2*pi*Fs;
wn=wc/(ws/2);

% FIR filter design
filt1 = fir1(N-1, wn, 'low', rectwin(N));     % N-1 is the order of the filter   
filt2 = fir1(N-1, wn, 'low', hamming(N));

% Frequency response of filter
[H1,W1] = freqz(filt1,N); 
[H2,W2] = freqz(filt2,N);

figure;
plot(W1, abs(H1), 'r');
hold on;
plot(W2, abs(H2), 'b');
grid on;
hold off;
legend('Rectangular Filter, N=21','Hamming Filter, N=21')

