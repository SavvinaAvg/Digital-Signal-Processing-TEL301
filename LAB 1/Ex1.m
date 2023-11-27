clc; clear; close all;

% A %
% Definition of Signals
nx = -6:6;
ny = -3:3;
T0 = 4; F0 = 1/T0;
sig1 = sin(2*pi*F0*nx);
sig2 = (1/2).^ny;

% Showing the signals
figure;
subplot(2,1,1); stem(nx, sig1, 'linewidth', 3); grid on;
title('Signal 1');
axis([-7 7 -1.5 1.5])

subplot(2,1,2); stem(ny, sig2, 'linewidth', 3); grid on;
title('Signal 2');
axis([-4 4 -0.5 10])

% Convolution Limits
nconv = (nx(1) + ny(1)) : (nx(end) + ny(end)); % Convolution Time
LengthX = length(sig1);
LengthY = length(sig2);
LengthN = LengthX + LengthY - 1;
% Reverse the Signal2
sig2Rev = sig2(end:-1:1);
% Zero Padding of the not reversed signal
sig1_0 = [zeros(1,(LengthY-1)) sig1 zeros(1, (LengthY - 1))]; 

% For-loop for creating the convoluted signal based on the definition
for i = 1:LengthN
    sig2Rev0 = [zeros(1,(i-1)) sig2Rev zeros(1, (LengthN - i))];
    Z1(i) = sum(sig1_0.*sig2Rev0);
end;

Z2 = conv(sig1, sig2);
figure;
subplot(2,1,1);
stem(nconv, Z1);
title('Convolution with Definition');
xlabel('n')
ylabel('Z(n)')
subplot(2,1,2);
stem(nconv, Z2);
title('Convolution with function conv');
xlabel('n')
ylabel('Z(n)')


% B %
sig1_f = fft(sig1, LengthN);
sig2_f = fft(sig2, LengthN);
Z3 = sig1_f.*sig2_f;
invZ3 = ifft(Z3, LengthN);

figure;
subplot(3,1,1);
stem(nconv, Z2);
title('Convolution with function conv');
xlabel('n')
ylabel('Z(n)')
subplot(3,1,2);
stem(nconv, Z3);
title('Convolution with Fourier Transform (Part A)');
xlabel('f')
ylabel('Z(f)')
subplot(3,1,3);
stem(nconv, invZ3);
title('Convolution with Inverse Fourier Transform (Part B)');
xlabel('n')
ylabel('Z(n)')