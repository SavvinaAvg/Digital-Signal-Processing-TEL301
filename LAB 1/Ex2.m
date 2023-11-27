clc; clear; close all;

% Definition of Signals
n = 10000;
DT = 1/n;
t = 0:DT:0.5;
sig = 5*cos(24*pi*t) - 2*sin(1.5*pi*t);
figure;
plot(t, sig);  grid on;
title('The Original Signal');
xlabel('t')
ylabel('sig(t)')

Ts1 = 1/48; F1 = 1/Ts1;
tx1 = 0 : Ts1 : 0.5;
sig1 = 5*cos(24*pi*tx1) - 2*sin(1.5*pi*tx1);
figure;
subplot(3,1,1);
plot(t, sig); hold on; grid on;
stem(tx1, sig1);
title('Smapling for Fs = 48');
xlabel('t')
ylabel('sig1(t)')

Ts2 = 1/24; F2 = 1/Ts2;
tx2 = 0 : Ts2 : 0.5;
sig2 = 5*cos(24*pi*tx2) - 2*sin(1.5*pi*tx2);
subplot(3,1,2);
plot(t, sig); hold on; grid on;
stem(tx2, sig2);
title('Smapling for Fs = 24');
xlabel('t')
ylabel('sig2(t)')

Ts3 = 1/12; F3 = 1/Ts3;
tx3 = 0 : Ts3 : 0.5;
sig3 = 5*cos(24*pi*tx3) - 2*sin(1.5*pi*tx3);
subplot(3,1,3);
plot(t, sig); hold on; grid on;
stem(tx3, sig3);
title('Smapling for Fs = 12');
xlabel('t')
ylabel('sig3(t)')