% lab09demo.m                                                                              

close all;
clear;
format short;
format compact;

%% How to use fzero to find roots of a function?

% Example, find the root of y = x*cos(x) + 0.5 in the domain 0 <= x <= pi

p01demofig = figure;

% 1. Create an anonymous function
F = @(x) x.*cos(x) + 0.5;

% 2. Use fplot to visually inspect the curve over the given domain
fplot(F,[0,pi])

% 3. Find estimated x value near each desired root.  For example, such as 1.5
xn = 1.5;

% 4. Use fzero with estimated x value near a desired root
xr = fzero(F,xn); % fzero returns approximate root near xn

% 5. Plot xycoord of root to check that it is matches the expected root 
hold on;
plot(xr,F(xr),'o','MarkerFaceColor','r','MarkerEdgeColor','k');
title('fzero','FontSize', 14);
grid on;
box on;

clear F xn xr

% `

%% How to use fzero to calc points of intersection?

p02demofig = figure;

% Example given y = cos(x) and y = 0.2*(x+1);

% Find intersection the two above functions in domain such that 0 <= x <= 2

% 1. Create anonymous function for each function
F = @(x) cos(x);
G = @(x) 0.2*(x + 1);

% 2. Use fplot to visually inspect the functions over the given domain
hold on;
fplot(F,[0,2]);
axis([0,pi,0,1]);
fplot(G,[0,2]);
axis([0,2,0,1]);

% 3. Find estimated x value near a desired intersection, such as 1.0

xn = 1.0;

% 4. Create anonymous of function of intersection, i.e. where F(x) - G(x) = 0;
% i.e. y = F(x) - G(x);

H = @(x) F(x) - G(x);

% 5. Use fzero with estimated x value near a point of intersection
xr = fzero(H,xn); % fzero returns approximate root (i.e. point of intersection)

% 6. Plot xycoord to check that it is matches the expected point of intersection
plot(xr,F(xr),'o','MarkerFaceColor','r','MarkerEdgeColor','k');
title('Point of Intersection','FontSize', 14);
box on;

% Repeat these steps if you have more than one point of intersection

clear F G xn H xr 

% `

%% How to calc integral (area under curve) 

% Two cmds for calculating integral
% 1. trapz -use when working with raw data
% 2. integral -use when working with anonymous function F over bounds

% 1. How to calc integral of raw data using trapz 

p03demofig = figure;

% Given raw xy data
x = 1:5;
y = [ 2 1 3 4 3.5 ];

plot(x,y);
axis([min(x)-1,max(x)+1,min(y)-1,max(y+1)]);

% Use raw xy data as input parameters to trapz cmd

area = trapz(x,y); % trapz returns integral under given xy data

text(2.4,0.7,['Area = ' num2str(area,'%0.2f') ], 'FontSize',22);
axis([1,5,0 5]);
title('trapz','FontSize', 14);

grid on; % set grid on
box on;

clear x y area;

% `

% 2. How to calc integral of anonymous function, F over bounds of 0,pi

p04demofig = figure;

F = @(x) sin(x);
a = 0;
b = pi;
area = integral(F,a,b); % integral returns area under between a,b
%               | | |
%               | | upper bounds
%               | lower bounds
%               anonymous function F
fplot(F,[0,pi]);
text(1.1,0.4,['Area = ' num2str(area,'%0.2f') ], 'FontSize',22);
title('integral','FontSize', 14);
grid on;
box on;

clear F area a b

% `
%% How to use fminbnd to calc minima and maxima?

p05demofig = figure;

% Given function, y = sin(x).*(x-2) + 1.5 in domain such that 0 <= x <= 4

% How to use fminbnd to calc minima of given function?

% 1. Create an anonymous function
F = @(x) sin(x).*(x-2) + 1.5;

% 2. Use fplot to visually inspect the functions over the given domain
fplot(F,[0,4]);
axis([0,4,0,2]);
hold on;

% 3. Find lower and upper boundary of a desired minima, a,b
% for example, a = 0 and b = 2

a = 0; % lower bounds of minima
b = 2; % upper bounds of minima
% 4. Use fminbnd with F and lower and upper bounds to calc coords of minima
[xmn,ymn] = fminbnd(F,a,b); % returns xycoords of a minima between a and b

% 5. Plot xycoord of minima to check that it matches desired minima
plot(xmn,ymn,'o','MarkerFaceColor','b','MarkerEdgeColor','k');


% How to use fminbnd to calc a maxima of given function?

% 1. Create anonymous function G that is negation of original function
G = @(x) -F(x);

% 2. Find lower and upper boundary of a desired maxima, a,b
% for example, a = 2 and b = 3
a = 2;
b = 3;

% 3. Use fminbnd with G and lower and upper bounds to calc coords of maxima
[xmx,ymx] = fminbnd(G,a,b); % returns xycoords of a maxima between a and b

% 4. Change sign of ymx such that ymx = -ymx
ymx = -ymx;

% 5. Plot xycoord of maxima to check that it matches the desired maxima
plot(xmx,ymx,'o','MarkerFaceColor','r','MarkerEdgeColor','k');
title('fminbnd','FontSize', 14);
grid on;
box on;

clear xmn ymn xmx ymx a b F G

% `
%% How to use ode45 to solve ordinary differential initial value problems

p06demofig = figure;

% Example

% Solve the following ODE (IVP) problem

% Given,
% y' = -y -3*x with y(0) = 1 for domain of x from 0 to 4

% Note: 
% y' is dy/dx which is a 1st order derivative
% In general, use ode45 to solve non-stiff 1st order ODEs
%
% Since 1st order ODEs are one line expressions it is common to use
% anonymous functions as shown

% 1. Create anonymous function of expression.
% Make sure dy/dx is on LHS, rearrange expression if needed

% NOTE:
% Anonymous function for dy/dx always has two input parameters
%     1 2   1st parameter is for horizontal, 2nd parameter is vertical
%     | |
F = @(x,y) -y - 3*x;

% 2. ode45 solver cmd returns the xy solution and takes 3 parameters
        
% Note
% MATLAB provide numerous ODE (IVP) solvers, ode45 is recommended for
% most non-stiff (gradually changing) solutions, it uses the Runge-Kutta
% numerical method.

[x,y] = ode45(F,[0 4],1);
%| |          |  |    |
%| |          |  |    1 is value at y(0), i.e. initial known value
%| |          |  domain (also referred to as tspan)
%| |          anonymous function
%x y solution

% 3. plot solution
hold on;
plot(x,y);

% 4. check that the xy solution matches the initial value 
plot(0,1,'o','MarkerFaceColor','r','MarkerEdgeColor','k')
title('ode45','FontSize', 14);
grid on;
box on;

clear F x y 