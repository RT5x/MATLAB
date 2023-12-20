% lab05demo.m 

close all; % IMPORTANT start with this cmd to close all previous figures
clear;
format short;
format compact;

%% p01 Ficticious problem - How to use plot cmd to plot one set of xy data

% IMPORTANT first use figure cmd to create graphics object named p01fig

p01fig = figure;        % IMPORTANT create a figure for each problem
 
% Use linspace cmd to create an array of 6 evenly spaced value for x domain,
% experiment with using a number greater than 6 for a smoother curve

x = linspace(-pi,pi,6); % create x domain
%             |  |  |
%             |  |  number of evenly spaced elements
%             |  upper end of domain
%             low end of domain
y = sin(x);             % create y values

% Use plot cmd to plot one set of xy data

plot(x,y,'-b');         % LineStyle '-b' is for straight (-) blue (b) line

% List of common MATLAB LineStyles, such as '-b' (above)
% 
% -   solid (straight line)
% --  dashed
% .-  dotdash
% -.  dashdot
% o   circle
% *   star
% +   plus
% x   x-mark
% .   point
% :   dotted
% s   square
% d   diamond
% v   triangle (down)
% ^   triangle (up)
% ≶   triangle (left)
% >   triangle (right)
% p   pentagram
% h   hexagram
% 
% List of common MATLAB colors
% 
% r   red           
% g   green         
% b   blue          
% y   yellow        
% c   cyan          
% m   magenta       
% k   black         
% w   white         

axis([-3, 3, -1.5, 1.5]);  % How to use axis cmd to set plot limits
%      |  |   |    |
%      |  |   |    upper y limit
%      |  |   lower y limit
%      |  upper x limit
%      lower x limit

xticks(-3:3);              % How to add tick marks along x-axis
yticks(-1.5:0.5:1.5);      % How to add tick marks along y-axis

% How to add a title with FontSize 14
title('Example title','FontSize',14);

% How to add x and y labels

xlabel('Example xlabel');
ylabel('Example ylabel');

% How to make sure plot or fplot appears in a box

box on; % Use box on; to make sure plot (or fplot) appears in a box

% p01fig.png

% AFTER YOU HAVE FINISHED PLOTTING THEN SAVE THE FIGURE AS FOLLOWS

% How to save figure as a .fig file

savefig(p01fig,'p01fig.fig'); % savefig p01fig as file named p01fig.fig
%       |       |
%       |       file named p01fig.fig
%       figure

% How to save figure as a .png file

print(p01fig, '-dpng','p01fig.png'); % print p01fig as file named p01fig.png
%     |        |      |
%     |        |      |
%     |        |      file named p01fig.png
%     |        use format descriptor (-d) for .png file
%     figure     

clear x y 

%  x1.png   

%% p02 Ficticious problem - How to use plot cmd to plot two sets of xy data

p02fig = figure;

% Create two sets of xy data

x1 = linspace(-3,3,6);
y1 = sin(x1) + 0.25;

x2 = linspace(-3,3,50); 
y2 = sin(x2) - 0.25;

% NOTE
%
% You need to use the hold on cmd if you want data from more than one
% plot (or fplot) cmd to appear on the same figure

hold on;  % Use hold on cmd; to plot two sets of xy data on same figure

plot(x1,y1,'-g');  % '-g' is straight (-) green (g) line
plot(x2,y2,'--r'); % '--r is dashed (--) red (r) line

% Note: next line is same as above 3 lines
% plot(x1,y1,'-g',x2,y2,'--r'); % '-g'  is straight (-) green (g) line
%                               % '--r' is dashed  (--) red   (r) line

axis([-3, 3,-1.5, 1.5]);        % set domain and range limits

xticks(-3:3);                   % add tick marks along x-axis
yticks(-1.5:0.5:1.5);           % add tick marks along y-axis

% add title w/FontSize 14
title('Example title','FontSize',14);

xlabel('Example xlabel');       % add xlabel
ylabel('Example ylabel');       % add ylabel

box on; %  make sure plot (or fplot) appears in a box

savefig(p02fig,'p02fig.fig');       % save p02fig as file named p02fig.fig
print(p02fig,'-dpng','p02fig.png'); % save p02fig as file named p02fig.png

clear x1 y1 x2 y2 

% p02fig.png

%% p03 Ficticious problem - How to use fplot cmd

% Note that the fplot cmds (below) create smooth lines over given domain,
% whereas the plot cmd (above) creates straight line between each given
% xy data points

p03fig = figure;

F = @(x) sin(x)./x;       % Create anonymous function handle F

% Use fplot cmd to fplot anonymous function handle over given domain

fplot(F,[-6,6],'-b'); % fplot F over domain [-6,6] w/straight blue line
%     |   | |   ||
%     |   | |   |line color blue (b)
%     |   | |   linestyle straight (-)
%     |   | domain upper limit
%     |   domain lower limit
%     anonymous function handle

axis([-6, 6,-0.5, 1.25]); % Set limits of fplot domain and range
%      |  |  |    |
%      |  |  |    upper y limit
%      |  |  lower y limit
%      |  upper x limit
%      lower x limit

xticks(-6:2:6);            % add tick marks along x-axis
yticks(-0.5:0.25:1.25);    % add tick marks along y-axis

% add title w/FontSize 14

title('Example title','FontSize',14);

% add labels

xlabel('Example xlabel');
ylabel('Example ylabel');

box on; %  make sure plot or fplot appears in a box

savefig(p03fig, 'p03fig.fig'); % savefig p03fig as file named p03fig.fig
print(p03fig,'-dpng','p03fig.png'); % print p03fig as file named p03fig.png

clear x y F

% p03fig.png

%% p04 Ficticious problem - How to use fplot with 2 anonymous functions

p04fig = figure;

% Create two anonymous function handles F and G

F = @(x) sin(x)-0.25;
G = @(x) sin(x)+0.25;

% Use fplot cmd to fplot function handles F and G over domains [-3,3]

% NOTE
%
% You need to use the hold on cmd if you want data from more than one
% plot (or fplot) cmd to appear on the same figure

hold on;               % hold on to current axes to fplot 2 functions in
                       % one figure

fplot(F,[-3,3],'-g');  % fplot F over domain [-3,3] w/solid green line (-g)
fplot(G,[-3,3],'--r'); % fplot F over domain [-3,3] w/dashed red line (--r)

axis([-3, 3, -1.5, 1.5]); % Set limits of fplot domain and range
%      |  |   |    |
%      |  |   |    upper y limit
%      |  |   lower y limit
%      |  upper x limit
%      lower x limit

xticks(-3:3);          % add tick marks along x-axis
yticks(-1.5:0.5:1.5);  % add tick marks along y-axis

title('Example title','FontSize',14); % add title w/FontSize 14

% set labels

xlabel('Example xlabel');
ylabel('Example ylabel');

box on;

savefig(p04fig, 'p04fig.fig'); % savefig p04fig as file named p04fig.fig
print(p04fig,'-dpng','p04fig.png'); % print p04fig as file named p04fig.png

clear x1 y1 x2 y2 F G

% p04fig.png

%% p05 Ficticious problem, how to use plot cmd with 2 anonymous functions
%
% Given the parametric equations of a cicle calculate the 2 sets of xy data
% in Quadrants I and III using anonymous function handles.  Then use the
% plot cmd for plotting those two sets of xy data

p05fig = figure;

% Given parametric equations for unit circle,
%
% x = cos(t)
% y = sin(t)

% Create anonymous function handles F,G for above parametric equations

F = @(t) cos(t); % F is parameterized x values of circle 
G = @(t) sin(t); % G is parameterized y values of circle

% Create two domains of theta values, t1,t2, for Quadrants I and III

t1 = linspace(0,pi/2,30);     % t1 is theta values for Quadrant I
t2 = linspace(pi,3*pi/2,30);  % t2 is theta values for Quadrant III

% Use anonymous function handles F,G to generate two sets of xy data
% for the two line segments, x1,y2 and x2,y2

% Generate x1,y1 data for Quadrant I line segment

x1 = F(t1); % Use F to generate x values for t1
y1 = G(t1); % Use G to generate y values for t1

% Generate x2,y2 data for Quadrant III line segment

x2 = F(t2); % Use F to generate x values for t2
y2 = G(t2); % Use G to generate y values fof t2

% Use plot cmd to plot the two sets of data, x1,y1 and x2,y2

plot(x1,y1,'--b',x2,y2,'--r'); % x1,y1,dashed blue,x2,y2,dashed red
axis([-1.5,1.5,-1.5,1.5]);     % set limits of plot domain and range
title('Example title','FontSize',14); % add title w/FontSize 14
xlabel('Example xlabel');      % add xlabel
ylabel('Example ylabel');      % add ylabel
xticks(-1.5:0.5:1.5);          % add tick marks along x-axis
yticks(-1.5:0.5:1.5);          % add tick marks along y-axis
box on;                        % make sure plot (or fplot) appears in a box

% How to save the plot as a .fig and .png file

% AFTER YOU HAVE FINISHED PLOTTING THEN SAVE THE FIGURE AS FOLLOWS

savefig(p05fig,'p05fig.fig'); % save p05fig as file named p05fig.fig
print(p05fig,'-dpng','p05fig.png'); % save p05fig as file named p05fig.png

clear x1 x2 y1 y2 t1 t2 F G