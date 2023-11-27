clc; clear; close all;

% Sxediasmos palmoseiras
DT = 0.001;
t = -6:DT:6-DT;
T0 = 4; F0 = 1/T0;
sig1 = sin(2*pi*F0*t);
sig2 = (0.5*(sig1<=0) + -0.5*(sig1>=0));

figure;
subplot(2,1,1); plot(t, sig1, 'linewidth', 3); grid on;
title('Signal 1');
axis([-6 6 -1.5 1.5])

subplot(2,1,2); plot(t, sig2, 'linewidth', 3); grid on;
title('Signal 2');
axis([-6 6 -1 1])