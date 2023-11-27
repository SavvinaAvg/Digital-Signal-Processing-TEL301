% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

clc; clear; close all;

% Exercise 1
% b)
num = [0 0.2 0];    %0*z^2 , 0.2*z , 0
denum = [1 -0.7 -0.18];
tf(num,denum)

zeros = roots(num);
poles = roots(denum);
figure(1)
Z = zplane(zeros,poles)
title('Zeros/Poles plot of the H(z) ')

% d)
n = [-pi : pi/128 : pi ];
figure(2)
freqz(num,denum,n)
axis([-1 1 -20 10])
title('H(z) Frequency Response')

% e)
num_e = [0 0 0.2 0];
denum_e = [1 -1.7 0.52 0.18];
tf(num_e,denum_e)

zeros1 = roots(num_e);
poles1 = roots(denum_e)
figure(3)
Z1 = zplane(zeros1,poles1)
title('Zeros/Poles plot of the new H(z) ')

figure(4)
freqz(num_e,denum_e,n)
axis([-1 1 -20 350])
title('New H(z) Frequency Response')


