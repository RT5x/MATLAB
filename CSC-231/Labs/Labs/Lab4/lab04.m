% lab04.m
% aghatta@calpoly.edu

clear;
format short;
format compact;

%% p01

format bank;
P = 50000;
y = 10:30;
r = 0.03500;
M = (P*(r/12))./(1-(1+(r/12)).^(-12*y));
T = 12*M.*y;
p01 = [y', M', T'];
display(p01)
clear P y r M T;

%% p02

format short;
K = 0.4:0.1:0.8;
V = 8000;
b = ((4/pi^2)*(V./((K+1).*(1-K).^2))).^(1/3);
a = K.*b;
S = pi^2 * (b.^2 - a.^2);
p02 = [a' b' S'];
display(p02)
clear K V S a b;

%% p03

format short;
g = 9.81;
n = 1:10;
h = 8;
v = sqrt(2*g*h);
u = v*(0.85).^n;
t = 2*u./g;
p03 = [n' t'];
display(p03);
clear g n v t u h;

%% p04

format bank;
A = 11000;
r = 2:0.5:7;
n = 11;
B = A*(1+ (r./100)).^n;
p04 = [r' B'];
display(p04)
clear A r n B;

%% p05

format short;
a = 34171;
b = 7.9614;
T = 0:2:28;
P = 10.^(b - ((0.05263*a)./(T+273.15)));
p05 = [T' P'];
display(p05)
clear a b T P;
