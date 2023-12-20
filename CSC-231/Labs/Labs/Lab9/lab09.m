% lab09.m                                                                                   
% aghatta@calpoly.edu

close all;
clear;
format short;
format compact;

%% p01

p01fig = figure;
F = @(x) (x/8) - 0.1 +0.5*cos(2*x);
fplot(F, [-1,3], '--b');
xn1 = -0.5;
xr1 = fzero(F, xn1);
xn2 = 1;
xr2 = fzero(F, xn2);
xn3 = 2;
xr3 = fzero(F, xn3);
p01r = [xr1 xr2 xr3];
display(p01r);
hold on;
box on;
grid on;
title('p01 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
ylabel('y-axis');
xlabel('x-axis');
plot(xr1, F(xr1), 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xr2, F(xr2), 'o','MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xr3, F(xr3), 'o','MarkerFaceColor','r', 'MarkerEdgeColor','k');
axis([-1 3 -0.75 0.75]);
xticks(-1:1:3);
yticks(-0.75:0.25:0.75);
text(1, 0.5, 'fzeros', 'FontSize',14, 'HorizontalAlignment','center');
legend({'f(x)', 'zeros'}, 'Location','south');
savefig(p01fig, 'p01fig.fig');
print('-dpng', 'p01fig.png');
clear xn1 xr1 xn2 xn3 xr2 xr3 F;

%% p02

p02fig = figure;
F = @(x) -0.3*x + 0.2;
G = @(x) sin(2*x);
H = @(x) F(x) - G(x);
xn1 = -2.5;
xn2 = -2;
xn3 = 0;
xn4 = 1.5;
xn5 = 2.5;
xr1 = fzero(H, xn1);
xr2 = fzero(H, xn2);
xr3 = fzero(H, xn3);
xr4 = fzero(H, xn4);
xr5 = fzero(H, xn5);
p02x = [xr1 xr2 xr3 xr4 xr5];
p02y = [F(xr1) F(xr2) F(xr3) F(xr4) F(xr5)];
display(p02x);
display(p02y);
fplot(F, [-3 3], '--b');
hold on;
box on;
grid on;
title('p02 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
ylabel('y-axis');
xlabel('x-axis');
fplot(G, [-3 3], '--g');
axis([-3 3 -1.5 1.5]);
xticks(-3:1:3);
yticks(-1.5:0.5:1.5);
plot(xr1, F(xr1), 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xr2, F(xr2), 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xr3, F(xr3), 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xr4, F(xr4), 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xr5, F(xr5), 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
xline(0, 'k');
yline(0, 'k');
legend({'f(x)', 'g(x)', 'f(x)-g(x)', '', ''}, 'location', 'south');
text(0, 1.25, 'Points of Intersection', 'HorizontalAlignment','center', 'FontSize',14);
savefig(p02fig, 'p02fig.fig');
print('-dpng', 'p02fig.png');
clear F G H xn1 xn2 xn3 xn4 xn5 xr1 xr2 xr3 xr4 xr5;

%% p03

p03fig = figure;
F = @(x) ((x-1)./(((x-1).^4 + 3).^1.5)) + 0.5;
G = @(x) - F(x);
a1 = -1;
b1 = 1;
[p03xmn, p03ymn] = fminbnd(F, a1,b1);
a2 = 1.5;
b2 = 2.5;
[p03xmx, p03ymx] = fminbnd(G, a2,b2);
p03ymx = -p03ymx;
fplot(F, [-1,5], '--b');
hold on;
box on;
grid on;
ylabel('y-axis');
xlabel('x-axis');
axis([-1 5 0.25 0.75]);
xticks(-1:1:5);
yticks(0.25:0.125:0.75);
display(p03xmn);
display(p03ymn);
display(p03xmx);
display(p03ymx);
text(2, 0.7, 'Maxima and Minima','FontSize',14, 'HorizontalAlignment','center');
title('p03 aghatta@calpoly.edu', 'FontSize',14 , 'FontWeight','bold');
plot(p03xmx, p03ymx, 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(p03xmn, p03ymn, 'o', 'MarkerFaceColor','b', 'MarkerEdgeColor','k');
legend({'', 'Maxima', 'Minima'}, 'Location','south');
text(2.2, 0.625, '(1.8801, 0.6288) Maxima', 'FontSize',14);
text(0.5, 0.375, '(0.1199, 0.3712) Minima', 'FontSize',14);
savefig(p03fig, 'p03fig.fig');
print('-dpng', 'p02fig.png');
clear F G a1 b1 a2 b2;

%% p04

p04fig = figure;
F = @(x) (sin(2*x)./(2*x)) - 0.5;
G = @(x) -F(x);
[xmn1, ymn1] = fminbnd(F, -3, -2);
[xmn2, ymn2] = fminbnd(F, 2, 3);
[xmx, ymx] = fminbnd(G, -1, 1);
ymx = -ymx;
fplot(F, [-4, 4], '--r');
hold on;
grid on;
box on;
ylabel('y-axis');
xlabel('x-axis');
axis([-4 4 -1 1]);
xticks(-4:1:4);
yticks(-1:0.25:1);
title('p04 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
plot(xmx, ymx, 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(xmn1, ymn1, 'o', 'MarkerFaceColor','b', 'MarkerEdgeColor','k');
plot(xmn2, ymn2, 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor','k');
xline(0);
yline(0);
legend({'f(x)', 'Maxima', 'Minima', '', ''}, 'location', 'south');
text(0, 0.75, 'Maxima and Minima', 'HorizontalAlignment','center', 'FontSize',14);
savefig(p04fig, 'p04fig.fig');
print('-dpng', 'p04fig.png');
clear F xmx ymx xmn1 ymn1 xmn2 ymn2 G;

%% p05

F = @(x) (cos(x)./(sqrt(1+x))) + pi/4;
p05 = integral(F, 0, pi);
display(p05);
clear F;

%% p06

F = @(x) exp(-x.^2);
p06 = integral(F, -pi, pi);
display(p06);
clear F;

%% p07

t = 0:1:6;
v = [0 14 39 78 102 122 145] * (5280/3600);
p07 = trapz(t,v);
display(p07);
clear t v;

%% p08

p08fig = figure;
F = @(x,y) ((x.^2.*y/5) + x);
[x, y]= ode45(F, [0 3], 3);
hold on;
plot(x, y, '--g');
grid on;
box on;
title('p08 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
xlabel('x-axis');
ylabel('y-axis');
axis([0 3 0 25]);
xticks(0:0.5:3);
yticks(0:5:25);
plot(0, 3, 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
text(1.5, 20, 'ode45', 'HorizontalAlignment','center', 'FontSize',14);
text(0.2, 2, '(0,3) Initial Value', 'FontSize',14);
savefig(p08fig, 'p08fig.fig');
print('-dpng', 'p08fig.png');
clear x y F;

%% p09

p09fig = figure;
F = @(t,y) (25*exp(-1.5*t)*cos(3*t) - 0.6*y);
[t, y] = ode45(F, linspace(0, 4, 100), 2);
hold on;
grid on;
box on;
plot(t, y, '--b');
plot(0, 2, 'o', 'MarkerFaceColor','r', 'MarkerEdgeColor','k');
title('p09 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
xlabel('x-axis');
ylabel('y-axis');
axis([0 4 0 8]);
text(2, 6.5, 'ode45', 'HorizontalAlignment','center', 'FontSize',14);
text(0.5, 2, '(0, 2) Initial Value', 'FontSize',14, 'HorizontalAlignment','center');
savefig(p09fig, 'p09fig.fig');
print('-dpng', 'p09fig.png');
clear t y F;