% lab08.m                                                                                
% aghatta@calpoly.edu

clear;
format short;
format compact;
close all;

%% p01

p01fig = figure;
x = linspace(-5,5,50);
p = [-.3 0 6.5 -21 -29];
y = polyval(p,x);
hold on;
plot(x,y, '-r');
xline(0);
yline(0);
box on;
xlabel('x-axis');
ylabel('y-axis');
yticks(-100:25:100);
xticks(-5:1:5);
axis([-5 5 -100 100]);
legend({'Degree 4 Polynomial'}, 'Location','northeast');
title('p01 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
savefig(p01fig, 'p01fig.fig');
print(p01fig, '-dpng', 'p01fig.png');
clear x y p;

%% p02

p02fig = figure;
x = linspace(5,30,50);
p = [-0.001 0.05 -0.75 3.4];
y = polyval(p, x);
r = roots(p);
yr = polyval(p,r);
hold on;
grid on;
box on;
plot(x,y,'--b');
plot(r,yr, 'o', 'MarkerFaceColor','r');
legend({'','roots'}, 'Location','south');
title('p02 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
axis([5 30 -0.25 0.75]);
xticks(5:5:30);
yticks(-0.25:0.25:0.75);
ylabel('y-axis');
xlabel('x-axis');
text(17, 0.6, 'Roots of Polynomial', 'FontSize',14, 'HorizontalAlignment','center');
savefig(p02fig, 'p02fig.fig');
print(p02fig, '-dpng', 'p02fig.png');
clear p x y r yr;

%% p03

p1 = [2 0 3];
p2 = [1 3 5 -15];
p03 = conv(p1,p2);
display(p03);
clear p1 p2;

%% p04

p04fig = figure;
x = linspace(-1.5,1.5,100);
p12 = conv([1 1.4], [1 -0.4]);
p23 = conv([1 0.5], p12);
p = conv(p23,[1 -1.4]);
y = polyval(p,x);
pd = polyder(p);
pdd=polyder(pd);
rd = roots(pd);
max = rd(pdd < 0);
min = rd(pdd > 0);
ymax = polyval(p,max);
ymin = polyval(p,min);
hold on;
box on;
plot(x,y, '-r');
plot(max, ymax, 'o','MarkerFaceColor','r', 'MarkerEdgeColor','k');
plot(min, ymin, 'o','MarkerFaceColor','b','MarkerEdgeColor','k');
title('p04 aghatta@calpoly.edu','FontSize',14,'FontWeight','bold');
axis([-1.5 1.5 -1 1]);
xlabel('x-axis');
ylabel('y-axis');
xline(0);
yline(0);
yticks(-1:0.5:1);
xticks(-1.5:0.5:1.5);
grid on;
text(0,0.75,'Polynomial Maxima and Minima','FontSize',14, 'HorizontalAlignment','center');
legend({'f(x)','Maxima','Minima'},'Location','south');
savefig(p04fig, 'p04fig.fig');
print(p04fig, '-dpng', 'p04fig.png');
clear x y rd p p12 p23 ymax ymin pd pdd max min;

%% p05

[p05q, p05r] = deconv([-0.6 0 7.6 -8 -25 47], [-0.6 0 4.1 -8]);
display(p05q);
display(p05r);

%% p06

[p06q, p06r] = deconv([1 -6 13 -13 5], [1 -3 0 2]);
display(p06q);
display(p06r);

%% p07

p1 = conv([1 0], [1 1]);
p12 = conv(p1, [1 2]);
p12(length(p12)) = -4896;
r = roots(p12);
n = r(r > 0 & r==real(r));
p07 = [n n+1 n+2];
display(p07);
clear p12 p1 r n;

%% p08

p1 = conv([1 0], [1 2]);
p12 = conv(p1, [1 4]);
p123 = conv(p12, [1 6]);
p123(length(p123)) = -13440;
r = roots(p123);
n = r(r > 0 & r == real(r));
p08 = [n n+2 n+4 n+6];
display(p08);
clear n r p12 p1 p123;

%% p09

p09fig = figure;
h = [0 2500 5000 7500 10000 20000 25000];
T = [212 210 203 198 195 178 165];
plot(h,T, 'o', 'MarkerEdgeColor','r');
hold on;
p = polyfit(h,T,1);
y = polyval(p, h);
Tf = polyval(p, 14000);
plot(h,y,'-b');
plot(14000, Tf, 'o', 'MarkerFaceColor','r');
text(14500, 187, '187.0139(\circ F) at 14000 ft', 'FontSize',14);
ylabel('Temperature (\circF)')
xlabel('Hieght (ft)');
title('p09 aghatta@calpoly.edu', 'FontSize',14,'FontWeight','bold');
axis([0 25000 165 215]);
xticks(0:2500:25000);
yticks(165:5:215);
text(12500, 204,'Least Squares Approximation', 'FontSize',14, 'HorizontalAlignment','center');
box on;
grid on;
savefig(p09fig, 'p09fig.fig');
print(p09fig, '-dpng', 'p09fig.png');
clear h T p y Tf;
%% p10

p10fig = figure;
tl = tiledlayout(2,2);
x = [-5 -3.4 -2 -0.8 0 1.2 2.5 4 5 6.7 8.5];
y = [5.1 5.2 4 3.5 3.9 3.8 3.5 2.5 1.2 0.5 -0.2];
pa = polyfit(x,y,1);
pb = polyfit(x,y,2);
pc = polyfit(x,y,4);
pd = polyfit(x,y,8);
xfit = linspace(x(1),x(length(x)),100);
p10a = polyval(pa, xfit);
p10b = polyval(pb, xfit);
p10c = polyval(pc, xfit);
p10d = polyval(pd, xfit);
title(tl, 'p10 aghatta@calpoly.edu', 'FontSize',14, 'FontWeight','bold');
nexttile;
hold on;
title('p10a', 'FontSize',14,'FontWeight','bold');
axis([-5 9 -2 7]);
xlabel('x-axis');
ylabel('y-axis');
yticks(-2:1:7);
xticks(-5:2:9);
plot(x,y,'og');
plot(xfit,p10a,'-r');
box on;
grid on;
nexttile;
hold on;
title('p10b', 'FontSize',14,'FontWeight','bold');
plot(x,y,'og');
plot(xfit, p10b, '-r');
xlabel('x-axis');
ylabel('y-axis');
axis([-5 9 -2 7]);
yticks(-2:1:7);
xticks(-5:2:9);
box on;
grid on;
nexttile;
plot(x,y,'og');
hold on;
title('p10c', 'FontSize',14,'FontWeight','bold');
plot(xfit, p10c, '-r');
xlabel('x-axis');
ylabel('y-axis');
axis([-5 9 -2 7]);
yticks(-2:1:7);
xticks(-5:2:9);
box on;
grid on;
nexttile;
plot(x,y,'og');
hold on;
title('p10d', 'FontSize',14,'FontWeight','bold');
plot(xfit, p10d, '-r');
xlabel('x-axis');
ylabel('y-axis');
axis([-5 9 -2 7]);
yticks(-2:1:7);
xticks(-5:2:9);
box on;
grid on;
savefig(p10fig, 'p10fig.fig');
print(p10fig, '-dpng', 'p10fig.png');
clear pa pb pc pd x y tl xfit p10a p10b p10c p10d;
