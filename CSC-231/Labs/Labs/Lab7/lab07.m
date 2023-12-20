% lab07.m                                                                         
% aghatta@calpoly.edu

close all;
clear;
format short;
format compact;

%% p01

p01fig = figure;
rng(123);
x = 10*rand(1,250)-5; 
y = 10*rand(1,250)-5;
[q1,q2,q3,q4] = myquadrants(x,y);
p01a = sum(q1);
p01b = sum(q2);
p01c = sum(q3);
p01d = sum(q4);
display(p01a);
display(p01b);
display(p01c);
display(p01d);
hold on;
plot(x(q1), y(q1), 'o','MarkerFaceColor','y', 'MarkerEdgeColor','k');
plot(x(q2), y(q2), 'o', 'MarkerFaceColor', 'g', 'MarkerEdgeColor', 'k');
plot(x(q3), y(q3), 'o', 'MarkerFaceColor', 'b', 'MarkerEdgeColor', 'k');
plot(x(q4), y(q4), 'o', 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'k');
xline(0);
yline(0);
xlabel('x-axis');
ylabel('y-axis');
title("p01 aghatta@calpoly.edu", "FontSize",14, "FontWeight","bold");
axis([-5 5 -5 5])
xticks(-5:5:5);
yticks(-5:5:5);
box on;
legend({'Quadrant I', 'Quadrant II', 'Quadrant III', 'Quadrant IV'}, 'Location','southoutside');
savefig(p01fig, 'p01.fig');
print(p01fig, '-dpng', 'p01fig.png');
clear x y q1 q2 q3 q4;

%% p02

p02fig = figure;
rng(123);
x = 10*rand(1, 250)-5;
y = 10*rand(1,250)-5;
[bullseye, middle, outer, missed] = mytargetpractice(x,y);
p02a = sum(bullseye);
p02b= sum(middle);
p02c = sum(outer);
p02d = sum(missed);
display(p02a);
display(p02b);
display(p02c);
display(p02d);
t = mylinspace(0,2*pi,50);
[x1, y1] = mycircle(1, t);
[x2, y2] = mycircle(2, t);
[x3, y3] = mycircle(3, t);
hold on;
plot(x(bullseye), y(bullseye), 'o', "MarkerFaceColor",'r', 'MarkerEdgeColor','k');
plot(x(middle), y(middle), 'o', "MarkerFaceColor",'g', 'MarkerEdgeColor','k');
plot(x(outer), y(outer), 'o', "MarkerFaceColor",'b', 'MarkerEdgeColor','k');
plot(x(missed), y(missed), 'o', "MarkerFaceColor",'y', 'MarkerEdgeColor','k');
title("p02 aghatta@calpoly.edu", "FontSize",14, "FontWeight","bold");
plot(x1, y1, 'k');
plot(x2, y2, 'k');
plot(x3, y3, 'k');
xlabel("x-axis");
ylabel("y-axis");
axis([-5 5 -5 5]);
xticks(-5:1:5);
yticks(-5:1:5);
xline(0);
yline(0);
legend({"Bullseye","MiddleCircle", "OuterCircle", "Miss"},"Location","southoutside");

box on;
savefig(p02fig, 'p02.fig');
print(p02fig, '-dpng', 'p02fig.png');
clear x y bullseye middle outer missed x1 y1 t x2 y2 x3 y3;

%% User-Defined Functions

function [y] = mylinspace(lo,hi,n) % user defined function #1

    if n <= 0                  % if n <= 0
        y = [];                % then set y to empty vector, []
    else                       % otherwise,
        y(1) = lo;             % set y(1) to lo
        y(n) = hi;             % set y(n) to hi
        i = 2;
        v = (hi-lo)/(n-1);     % v is value of even spacing
        while i < n            % visit remaining locations in y(i)
            y(i) = y(i-1) + v; % fill each v(i) with y(i-1) + v
            i = i + 1;         % increment i to visit next location in y
        end
    end
end
function [x,y] = mycircle(radius, theta) % user defined function #2
    x = radius * cos(theta);
    y = radius * sin(theta); 
end
function [q1,q2,q3,q4] = myquadrants(x,y)
q1 = x >0 & y>0;
q2 = x <0 & y >0;
q3 = x <0 & y < 0;
q4 = x >0 & y <0;

end 
function [bullseye,middle,outer,missed] = mytargetpractice(x,y)
    d = sqrt(x.^2+y.^2);
    bullseye = d < 1;
    middle = d >1 & d <2;
    outer = d > 2 & d < 3;
    missed = d > 3;
end 
