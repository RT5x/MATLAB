% lab02.m
% aghatta@calpoly.edu

clear;
format short;
format compact;

%% p01

p01 = [6 1 0 -2 -8];
display(p01);

%% p02

p02 = [sind(68) sqrt(278.2) log(599) -740];
display(p02);

%% p03

p03 = 4:10;
display(p03);

%% p04

p04 = 4:3:16;
display(p04);

%% p05

p05 = 2:0.25:3;
display(p05);

%% p06

p06 = [3 8 18 14]';
display(p06);

%% p07

p07 = [2:-1:-5]';
display(p07);

%% p08

p08(5) = 41;
display(p08);

%% p09

p09(4:7) = 9;
display(p09);

%% p10

p10 = [6 0 5 7; 8 1 8 5; 9 2 4 7];
display(p10);

%% p11

p11(3,4)=10;
display(p11);

%% p12

p12(2:4,3:5) = 8;
display(p12);

%% p13

p13 = reshape(5:13,3,3);
display(p13);

%% p14

p14 = reshape(3:32,5,6)';
display(p14);

%% p15

p15 = [zeros(4,4) ones(4,4); ones(4,4) zeros(4,4)];
display(p15);

%% p16

p16 = [2*ones(3,3) 4*ones(3,3); 6*ones(3,3) 8*ones(3,3)];
display(p16);