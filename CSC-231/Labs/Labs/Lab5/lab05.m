% lab05.m
% aghatta@calpoly.edu

close all; % IMPORTANT start with this cmd to close all previous figures
clear;
format short;
format compact;

%% p01

p01fig = figure;
x = linspace(-2, 3, 30);
y = ((x+4).^2)./(7*x.^2 + 6);
plot(x,y,"--b");
axis([-2,3,0,3]);
xticks(-2:3);
yticks(0:0.5:3);
title('p01 aghatta@calpoly.edu', 'FontSize', 14);
xlabel('x-axis');
ylabel('y-axis');
box on;
savefig(p01fig, 'p01fig.fig');
print(p01fig, '-dpng', 'p01fig.png');
clear x y;

%% p02

p02fig = figure;
F = @(x) (4.*sin(2.*x))./(x + exp(-0.8.*x + 0.3))-0.7;
fplot(F, [-3,4], "--r");
axis([-3,4,-4,3]);
xticks(-3:4);
yticks(-4:3);
title('p02 aghatta@calpoly.edu', 'FontSize', 14);
xlabel('x-axis');
ylabel('y-axis');
box on;
savefig(p02fig, 'p02fig.fig');
print(p02fig, '-dpng', 'p02fig.png');
clear x y F;

%% p03

p03fig = figure;
F = @(x) sqrt(abs(cos(4.*x))) + 4.*(sin(8.*x)).^2 - 2.5;
fplot(F, [-1,1], "-r");
axis([-1,1,-3,3]);
xticks(-1:0.5:1);
yticks(-3:3);
title('p03 aghatta@calpoly.edu', 'FontSize', 14);
xlabel('x-axis');
ylabel('y-axis');
box on;
savefig(p03fig, 'p03fig.fig');
print(p03fig, '-dpng', 'p03fig.png');
clear x y F;

%% p04

p04fig = figure;
F = @(x) exp(2.* sin(0.85.*x - 4)).*3.*cos(9.*x - 5);
fplot(F, [-4, 10], "-r");
axis([-4,10,-30,30]);
xticks(-4:2:10);
yticks(-30:10:30);
title('p04 aghatta@calpoly.edu', 'FontSize', 14);
xlabel('x-axis');
ylabel('y-axis');
box on;
savefig(p04fig, 'p04fig.fig');
print(p04fig, '-dpng', 'p04fig.png');
clear x y F;

%% p05

p05fig = figure;
x1 = linspace(-2,-1,50);
x2 = linspace(-0.9, 2, 50);
y1 = (x1.^2 + 5*x1 + 5)./(2.8*(x1+1))-2;
y2 = (x2.^2 + 5*x2 + 5)./(2.8*(x2+1))-2;
plot(x1,y1,"--r");
axis([-2,0,-4,2]);
xticks(-2:0.25:0);
yticks(-4:1:2);
title('p05 aghatta@calpoly.edu', 'FontSize',14);
xlabel('x-axis');
ylabel('y-axis');
box on;
hold on;
plot(x2,y2, "--b");
hold off;
savefig(p05fig, 'p05fig.fig');
print(p05fig, '-dpng', 'p05fig.png');
clear x1 y1 x2 y2;

%% p06

p06fig = figure;
F = @(t) (5.*t)./(1 + t.^3);
G = @(t) (5.*t.^2)./(1 + t.^3);
t1 = linspace(-30,-1.6, 300);
t2 = linspace(-0.6, 20, 300);
x1 = F(t1);
y1 = G(t1);
x2 = F(t2);
y2 = G(t2);
plot(x1,y1,"-r", x2, y2, "-g");
axis([-3,3,-3,3]);
xticks(-3:3);
yticks(-3:3);
title('p06 aghatta@calpoly.edu', 'FontSize',14);
xlabel('x-axis');
ylabel('y-axis');
box on;
savefig(p06fig, 'p06fig.fig');
print(p06fig, '-dpdf', 'p06fig.png');
clear x1 y1 x2 y2 F G t1 t2;