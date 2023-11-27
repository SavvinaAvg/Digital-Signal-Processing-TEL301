% Avgousti Savvina 2018030200
% Christou Theodora 2018030202
% Maragkoudaki Magdalini 2017030169

clc; clear; close all;

% Exercise 2
% a)
numerator = [4 -3.5];
denominator = [1 -2.5 1];
[r,p] = residuez(numerator,denominator)

% Using syms to create the variable z to use it in the transfer function 
syms z 
assume(z>2 | z<-2);     % |z| > 2

% Partial Fraction Expansion of the Transfer Function 
H = r(1)/(1-p(1)*z^(-1)) + r(2)/(1-p(2)*z^(-1))

%Print H(z) on the command window
pretty(H)

% b) - Inverse Z Transform of H(z)
h = iztrans(H)
