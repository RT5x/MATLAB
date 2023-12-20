% lab03.m                                                                            
% aghatta@calpoly.edu

clear;
format short;
format compact;

%% p01

format short;
x = 1:7;
y = x.^3;
p01 = [x' y'];
display(p01);
clear x y;

%% p02

format short;
x = 1:4:29;
y=x.^3;
p02 = [x' y'];
display(p02);
clear x y;

%% p03

format rat;
v = 3:4:19;
p03a = 1./v;
display(p03a);
p03b = 1./(v.^2);
display(p03b);
p03c = 1./(v.^3);
display(p03c);
p03d = 1./(v.^0);
display(p03d);
clear v;

%% p04

format short;
v = 10:-2:2;
p04a = v.^2;
display(p04a);
p04b = 2*v;
display(p04b);
p04c = 100*v;
display(p04c);
p04d = v-1;
display(p04d);
clear v;

%% p05

format short;
x = 0:5;
p05 = -2*x.^2 + 3*x +2;
display(p05);
clear x;

%% p06

format short;
x = 0:5;
p06 = ((2*x.^4 + 2*x.^2 - 3*x - 2).*(2*x - 2))./((x+1).^2);
display(p06);
clear x;

%% p07

format long;
n = 1:10;
p07 = sum(1./(3.^n));
display(p07);
clear n;

%% p08

format long;
n = 0:10;
p08 = sqrt(12)*sum(((-3).^(-n))./(2*n + 1));
display(p08);
clear n;

%% p09

format short;
b = 1:7;
p09 = b'*b;
display(p09);
clear b;

%% p10

format short;
b = 1:7;
p10 = sum(b'*b);
display(p10);
clear b;

%% p11

format short;
v = 1:70;
p11 = sum(sum(v'*v));
display(p11);
clear v;

%% p12

format bank;
A = [-6.4 -6.7 9.1;-3.6 -3.9 -8.7; 2.4 8 -8.6];
b = [2.2;-5.2;-6.3];
p12 = A\b;
display(p12);
clear A b;

%% p13

format short;
A = [7.9 -5.9 -6.3 -0.3; 7.4 -8.7 -3.1 4.8; 7.5 0 4.5 0.8; 7.6 -9.3 -2.9 2.1];
b = [1;2.2;-3;-0.2];
p13 = A\b;
display(p13);
clear A b;

%% p14

format short;
A = [0 3.5 3.7 -9.2 8.8; 7.6 5.4 8.7 4.9 1.1; -5.8 -3.2 -8.2 0 3.4; -0.4 0.9 -5.2 -2.1 9.1; -0.4 4.6 -9.3 -2.5 -3.2];
b = [4.4 ;-0.6 ;-0.5; -2.9; 2.9];
p14 = A\b;
display(p14);
clear A b;
