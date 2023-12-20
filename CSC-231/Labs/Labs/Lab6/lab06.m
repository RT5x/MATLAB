% lab06.m                                                                         
% aghatta@calpoly.edu

close all;
clear;
format short;
format compact;

%% p01

format long;
p01fig = figure;
tl = tiledlayout(2,2);
title(tl, 'p01 aghatta@calpoly.edu', 'Fontsize', 14, 'FontWeight', 'bold');
nexttile;

m = 50;
y = zeros(1,m);
s = 0;
n = 1;
while n <= m
    s = s + (1/(n^2 +n));
    y(n)=s;
    n = n+1;
end
p01a = s;
display(p01a);

x = 1:m;
plot(x,y,'-b');
axis([0 50 0.5 1])
xticks(0:10:50)
yticks(0.5:0.1:1)
title('p01a', 'Fontsize', 14, 'FontWeight', 'bold')
box on;
grid on;
text(25, 0.85, 'limit to 1', 'HorizontalAlignment', 'center', 'Fontsize', 14);
title('p01a');
xlabel('sum of nth terms')
ylabel('approximate value')

m = 50;
n = 1;
y = zeros(1, m);
s = 0;
while n <= m
    s = s + (((-1)^(n-1))/n);
    y(n) = s;
    n = n+1;
end

p01b = s;
display(p01b)
x = 1:m;
nexttile;

plot(x, y, '-r');
axis([0 50 0.4 1]);
xticks(0:10:50);
yticks(0.4:0.1:1);
title('p01b', 'Fontsize', 14, 'FontWeight', 'bold');
box on; 
grid on;
xlabel('sum of nth terms');
ylabel('approximate value');
text(25, 0.85, 'ln(2)', 'HorizontalAlignment','center', 'FontSize',14);

m = 25;
s = 0;
y = zeros(1,m);
n = 1;

while n <= m
    s = s + ((4*(-1)^(n+1))/(2*n-1));
    y(n) = s;
    n = n+1;
end
p01c = s;
display(p01c);

x = 1:m;
nexttile;
plot(x,y,'-g');
axis([0 25 2 4]);
xlabel('sum of nth terms');
ylabel('approximate value');
title('p01c', 'Fontsize', 14, 'FontWeight', 'bold');
xticks(0:5:25);
yticks(2:0.5:4);
box on;
grid on;
text(12.5, 3.5, '\pi approx','HorizontalAlignment', 'center', 'Fontsize', 14);

m = 14;
s = 0;
y = zeros(1, m);
n = 0;
x = 2.4;
a = 3;
while n <= m
    s = s + (((log(a))^n / factorial(n)) * x^n);
    y(n+1) = s;
    n = n+1;
end
p01d = s;
display(p01d);
nexttile;
x = 0:14;
plot(x,y,'-b');
xlabel('sum of nth terms');
ylabel('approximate value');
title('p01d', 'Fontsize', 14, 'FontWeight', 'bold');
axis([0 14 0 15]);
xticks(0:2:14);
yticks(1:2:15);
grid on;
box on;
text(7, 10.5, '3^{2.4}', 'HorizontalAlignment','center','FontSize',14);
savefig(p01fig, 'p01fig.fig');
print(p01fig, '-dpng', 'p01fig.png');
clear x y a b n s m tl;

%% p02

format short;
p02fig = figure;

TCH = [75 70 86 86 80 82 73 89 90 87 81 82 85 88 90 91 82 84 81 78 73 68 74 79 82 71 66 71 69 67 66];
TSF = [69 68 70 73 72 71 69 76 85 87 75 84 76 67 80 74 68 68 74 73 79 68 67 69 71 70 89 95 91 66 69];
x = 1:31;
plot(x, TCH, '.-r');
hold on;
plot(x, TSF, '.-g');
xlabel('Days of the month (August)');
ylabel('Max daily temperature (\circF)');
title('p02 aghatta@calpoly.edu', 'Fontsize', 14, 'FontWeight', 'bold');
legend({'TCH', 'TSF'}, 'Location','southwest');
text(15, 97.5, 'TCH TSF Max daily temps (\circF)', 'HorizontalAlignment','center','FontSize',14);
axis([1 31 60 100]);
xticks(5:5:30);
yticks(60:5:100);
grid on;
box on;

n = length(TCH);
s = 0;
i = 1;
while i <= n
    s = s + TCH(i);
    i = i+1;
end
p02a = s / n;
display(p02a);

n = length(TSF);
s = 0;
i = 1;
while i <= n
    s = s + TSF(i);
    i = i+1;
end
p02b = s / n;
display(p02b);
i = 1;
n = length(TCH);
p02c = [];
while i <= n
    if TCH(i) < p02a
        p02c = [p02c TCH(i)];
    end
    i = i+1;
end
p02c = length(p02c);
display(p02c);

i = 1;
p02d = [];
n = length(TCH);
while i <= n
    if TCH(i) > p02a
        p02d = [p02d i];
    end
    i = i+1;
end

display(p02d);
i = 1;
n = length(TCH);
p02e = [];
while i <= n
    if TSF(i) > TCH(i)
        p02e = [p02e TSF(i)];
    end
    i = i+1;
    
end
display(p02e);

i = 1;
n = length(TSF)-1;
m = TSF(i);

while i <= n
    if TSF(i+1) > m
        m = TSF(i+1);
    end
    i = i+1;
end
p02f = m;
display(p02f);

i = 1;
n = length(TSF);
p02g = [];
while i <= n
    if TSF(i) <= p02b
        
    elseif TSF(i) < p02a
        p02g = [p02g i];
    else
        ;
    end
    i = i+1;
end
display(p02g);

p02h = [];
i = 1;
while i <=n
    if TSF(i) == TCH(i)
        p02h = [p02h i];
    end
    i = i+1;
end
display(p02h);
savefig(p02fig, 'p02fig.fig');
print(p02fig, '-dpng', 'p02fig.png');
clear x y TCH TSF i n s m;
