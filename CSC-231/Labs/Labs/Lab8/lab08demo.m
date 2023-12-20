% lab08demo.m                                                                            

clear;
format short;
format compact;
close all;

%% How to create a MATLAB polynomial?

% Given y = Ax^2 + Bx + C, place the coefficients A B C into a row array

% Example, given the following polynomial,

% y = 4x^2 - 2*x + 7; % example MATH expression, a degree 2 polynomial

p = [ 4 -2  7 ]; % MATLAB variable p is coefficients of polynomial 4x^2 -2*x + 7

clear p;

% Note a deg 2 polynomial has a length of 2, i.e. deg + 1, 

% y = 5x^5 - 7x + 2; % polynomial of deg 5, has length of deg + 1, length 6

% y = 5x^5 + 0x^4 + 0x^3 + 0x^2 -7x + 2 % same as above but showing zero coeffs

p = [ 5  0  0  0 -7  2 ]; % MATLAB variable p is coefficients of above polynomial
                          % NOTE: put zeros in locations that are implied

% How to use polyder cmd to calculate the derivative of a polynomial

pd = polyder(p)     % calc 1st derivative of p
pdd = polyder(pd)   % calc 2nd derivative of p 
pddd = polyder(pdd) % calc 3rd derivative of p 

clear p pd pdd pddd;


%% How to use polyval to evaluate a polynomial over a given domain of x

% Example, given
% y = x^2 + 1
p = [ 1 0 1 ] % p is coefficients of polynomial 1*x^2 + 0*x + 1

% Create domain of x
x = 1:5

% How to use polyval cmd to evaluate polynomial p over given domain of x

y = polyval(p,x) % polyval evaluates polynomial p over given domain of x
%           | |
%           | domain of x
%           polynomial p

% Another example, using a different domain of x

x = -3:3
y = polyval(p,x)

clear p x y;


%% How to use conv cmd to multiply polynomials and deconv to divide polynomials

% How to calc (x + 1) * (x + 2), p1 is [ 1 1 ], p2 is [ 1 2 ]
% x^2 + 3*x + 2

p1 = [ 1 1 ];
p2 = [ 1 2 ];

% convolution example, how to multiply polynomials
p = conv(p1,p2) % p [ 1 3 2 ] % Use conv to multiply polynomials


% How to use deconv cmd to divide polynomials

% deconvolution example, how to divide polynomials
[q, r ] = deconv(p,p2) % (x^2 + 3*x + 2)/(x + 2) is [ x + 1 ], i.e. [1 1]
%|  |
%|  remainder
%quotient
% \
%  Note deconv returns 2 variables [q,r] on the LHS

clear p p1 p2 q r;


%% How to use roots cmd to calc roots of polynomial

% How to find roots of polynomial?

p01demofig = figure;


% How to calc sqrt of 5 using MATLAB polynomial cmds?

% How to create polynomial that describes sqrt(5) function, i.e. y = x^2-5

p = [ 1 0 -5 ] % y = x^2 - 5, f(x) is x^2 - 5, How to find sqrt of 5?
x = linspace(-5,5,50);
y = polyval(p,x);
hold on;
plot(x,y);
axis([-5,5,-10,20]);
r = roots(p);
neg = r(r<0);  % neg root is root <  0
pos = r(r==real(r) & r>=0); % pos root is real root >= 0
yr = polyval(p,r);
plot(r,yr,'o','MarkerFaceColor','r','MarkerEdgeColor','k');


% How to use the num2str cmd to convert numeric value (neg) into 'string' s

s = [ num2str(neg,'%0.4f') ' (root)' ]; % convert numeric value neg into string s
%                     |                 % with 4-digits of floating point precision
%                     4-digits of precision (after the decimal point)
%                     the 4 in '%0.4f' gives 4-digits of precision
%                     other integer values >=0 can also be used
%                     For example, for 0-digits, use '%0.0f'
%                                  for 2-digits, use '%0.2f

text(neg+0.3, -0.4, s); % set string s (from above) onto figure at xylocation
%    |         |    |
%    |         |    string s
%    xlocation ylocation

s = [ num2str(pos,'%0.4f') ' (root)' ]; % s is string for pos root
%                     |
%                     4-digits of precision (after the decimal point)

text(pos+0.3,-0.4,s); % similar to above, set string s onto figure at xylocation
title('roots');
box on;

% add axes lines that cross at the origin
xline(0);
yline(0);

legend({'','roots','',''},'Location','south'); % set only 'roots' legend entry
%       |  |       |  |
%       |  |       |  use '' to skip fourth legend entry, yline(0);
%       |  |       use '' to skip third legend entry, xline(0);
%       |  use 'roots' for 2nd legend entry
%       use '' to skip first legend entry

clear p x y xr yr s pos neg

% 


%% How to use conv and deconv to solve an example math problem?

% Problem statement
%
% Given that the product of 3 consecutive positive integers is 1716
% Find those 3 integers?

% First outline a solution using math
% Second, convert math solution into MATLAB cmds

% 1. MATH solution
%           (n)(n+1)(n+2) = 1716   % equation
%       n (n^2 + 3*n + 2) = 1716   % expand
%       n^3 + 3*n^2 + 2n  = 1716   % ""
% n^3 + 3*n^2 + 2n - 1716 = 0      % set equation equal to zero
%
% Then use a root finding method, such as Newton Raphson

% 2. Convert MATH solution into MATLAB cmds

p1 = [ 1 0 ]; % n
p2 = [ 1 1 ]; % n + 1
p3 = [ 1 2 ]; % n + 2


%% Use the conv cmd to multiply 3 polynomials, one at a time

p12 = conv(p1,p2)                  % p12 is deg 2 polynomial
p = conv(p12,p3)                   % p is deg 3 polynomial, i.e.
                                   % n^2 + 3*n + 2, p [1 3 2 0 ]
p(length(p)) = -1716               % set equation equal to zero
                                   % place -1716 in the last element of p

r = roots(p)
n = r(r==real(r) & r>0)            % extract real pos values from r
%                |
% real values r and greater than zero

solution = [ n n+1 n+2 ]
solck1 = prod(solution)            % check work, use prod of 3 integers
solck2 = n*(n+1)*(n+2)             % same as above, but using n

clear p1 p2 p3 p12 p r n solution solck1 solck2


%% How to least squares fit data using polyfit

%% How to least squares fit of data using polyfit for a deg1 polynomial

p03demofig = figure;

x = [ 1:5 ];
y = [ 2.3 3.1 2.9 3.2 3.0 ];

plot(x,y,'o','MarkerFaceColor','r','MarkerEdgeColor','k');
hold on;

p = polyfit(x,y,1); % least squares fit deg 1 polynomial to xy data
%           | | |
%           | | deg of polynomial
%           | yvalues
%           xvalues

xfit = [x(1) x(length(x))];
yfit = polyval(p,xfit);
plot(xfit,yfit,'--b');
axis([0,6,1,4]);
title('polyfit deg1 polynomial');
box on;
clear x xfit y yfit p;

% 


%% How to least squares fit data using polyfit for a deg 2 polynomial

p04demofig = figure;

x = [ 1:5 ];
y = [ 2.3 3.1 2.9 3.2 3.0 ];
plot(x,y,'o','MarkerFaceColor','r','MarkerEdgeColor','k');
hold on;
p = polyfit(x,y,2); % polyfit deg 2 polynomial
xfit = linspace(x(1),x(length(x)),30);
yfit = polyval(p,xfit);
plot(xfit,yfit,'--b');
axis([0,6,1,4]);
title('polyfit deg2 polynomial');
box on;
clear x xfit y yfit p

% 

%% How to least squares fit data using polyfit for a deg 4 polynomial

p05demofig = figure;

x = [ 1:5 ];
y = [ 2.3 3.1 2.9 3.2 3.0 ];
plot(x,y,'o','MarkerFaceColor','r','MarkerEdgeColor','k');
hold on;
p = polyfit(x,y,4); % polyfit deg 4 polynomial
xfit = linspace(x(1),x(length(x)),30);
yfit = polyval(p,xfit);
plot(xfit,yfit,'--b');
axis([0,6,1,4]);
title('polyfit deg4 polynomial');
box on;
clear x xfit y yfit p