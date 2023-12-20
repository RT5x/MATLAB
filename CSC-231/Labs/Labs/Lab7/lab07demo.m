% The logical relation operators (< <= > >= == ~=) can be used with arrays.              

% Given array a

a = [ 2   1  -1   4  -3   0  -4   5 ]
% a =
%      2     1    -1     4    -3     0    -4     5


% How to use >= to calculate a logical array with locations where a >= 0

a >= 0 % logical array of 1s and 0s, each 1 is where a<0 is true
% ans =
%   1×8 logical array
%    1   1   0   1   0   1   0   1



% How to store logical arrays in variables

pos = a>=0 % pos is an array of 1s and 0s, each 1 is where a>=0 is true
% pos =
%   1×8 logical array
%    1   1   0   1   0   1   0   1

neg = a<0 % neg is an array of 1s and 0s, each 1 is where a<0 is true
% neg =
%   1×8 logical array
%    0   0   1   0   1   0   1   0



% How to find positive or negative values in an array

%        put the appropriate logical array in the parentheses()
%        |
apos = a(pos) % apos is the positive values in array a
% apos =
%      2     1     4     0     5

%        put the appropriate logical array in the parentheses()
%        |
aneg = a(neg) % aneg is the negative values in array a
% aneg =
%     -1    -3    -4



% How to calculate the number of pos or neg values in an array

p = sum(pos) % use the sum cmd to calc the number of pos values in a
% p =
%     5

n = sum(neg) % use the sum cmd to calc the number of neg values in a
% n =
%     3



% How to use logical arrays with logical operators AND (&) and OR (|)

% logical array operators AND (&) and OR (|) are commonly used along
% with the relational logical operators (< <= > >= == ~=)



% How to determine the values where -1<=a(i) AND a(i)<=1

between = a>=-1 & a<=1 % locations where a >=-1 AND a<=1
%               |
%               logical operator AND (&)
% between =
%   1×8 logical array
%    0   1   1   0   0   1   0   0

a(between) % the values of a such that -1<=a(i)<=1
% ans =
%      1    -1     0



% How to determine the number of values where -1<=a(i) AND a(i)<=1

n = sum(between) % the number of values such that -1<=a(i)<=1
% n =
%     3



% How to determine the values where a(i)< -1 OR a >1

outside = a<-1 | a>1 % locations where a<-1 OR a>1
%              |
%              logical operator OR (|)
%
% outside =
%   1×8 logical array
%    1   0   0   1   1   0   1   1

a(outside) % the values of a such that a<-1 or a>1
% ans =
%      2     4    -3    -4     5



% How to determine the number of values where a(i)< -1 OR a >1

n = sum(outside)
% n =
%     6





% lab07demo.m                                                                            

close all;
clear;
format short;
format compact;

%% p01

p01fig = figure;


% Create a set of random numbers to use in p01

% IMPORTANT: need to use rng(123); otherwise your values will be incorrect

rng(123); % set random number generator using integer seed value of 123
%   |
%   Need to use rng(123); immediately before the next two lines of code

x = 10*rand(1,250)-5; % array of 250 random value such that -5.0<=x(i)<=5.0 
y = 10*rand(1,250)-5; % array of 250 random value such that -5.0<=y(i)<=5.0


% Use logical arrays to calculate the positive and negative ycoords

% Use myposneg function to calc the positive and negative ycoords using logical arrays

[pos,neg] = myposneg(y); % How to use user defined function named myposneg
                         % returns locations of pos and neg values in y

p01a = sum(pos); % How to calculate the number of positive values in y
p01b = sum(neg); % How to calculate the number of negative values in y

hold on;

% the following two plot cmds create solid red and blue circles ('o')
% with black ('k') edges
plot(x(pos),y(pos),'o','MarkerFaceColor','r','MarkerEdgeColor','k');
plot(x(neg),y(neg),'o','MarkerFaceColor','b','MarkerEdgeColor','k');
xline(0);
yline(0);
axis('equal',[-2 2 -2 2]);
box on;

% Add a legend outside and below the plot
legend({'Positive','Negative','',''},'Location','southoutside');
%        |          |         |  |               |
%        |          |         |  |               |
%        |          |         |  |               |
%        |          |         |  |               set legend outside and below the plot
%        |          |         |  skip 4th legend entry
%        |          |         skip 3rd legend entry
%        |          2nd legend entry
%        1st legend entry

% 

clear x y pos neg

%% p02

p02fig = figure;


% First create and plot a unit circle

% Use the user defined functions named mylinspace and mycircle to create plot
% a unit circle

t = mylinspace(0,2*pi,50); % How to use the user defined function named mylinspace

[cx,cy] = mycircle(1,t); % How to use user defined function named mycircle 
% | |              | |
% xycoords         | theta values
% of unit          radius of 1
% circle

plot(cx,cy,'-g'); % plot the unit circle

% Then create a set of random numbers to use in p02

rng(123); % set random number generator using integer seed value of 123
%   |
%   Need to use rng(123); immediately before the next two lines of code

x = 10*rand(1,250)-5; % array of 250 random value such that -5.0<=x(i)<=5.0 
y = 10*rand(1,250)-5; % array of 250 random value such that -5.0<=y(i)<=5.0


% Use logical arrays to calculate the bullseye and miss xycoords

% Use mybullseye function to calc the bullseye and miss xycoords using logical arrays

[bullseye,miss] = mybullseye(x,y); % How to use user defined function mybullseye
hold on;

p02a = sum(bullseye); % number of bullseyes
p02b = sum(miss); % number of misses

% The following two plot cmds create solid red and yellow circles ('o')
% with black ('k') edges
plot(x(bullseye),y(bullseye),'o','MarkerFaceColor','r','MarkerEdgeColor','k');
plot(x(miss),y(miss),'o','MarkerFaceColor','y','MarkerEdgeColor','k');
xticks(-2:0.5:2);
yticks(-2:0.5:2);
axis('equal',[-2 2 -2 2]);
%     |
%     Use equal so that plot appears circular (instead of oval)


% Add a legend outside and below the plot
legend({'','Bullseye','Miss'},'Location','southoutside');
%       |   |          |                  |
%       |   |          |                  set legend outside and below the plot
%       |   |       3rd legend entry
%       |   2nd legend entry
%       skip 1st legend entry

% 
clear cx cy t x y bullseye miss


%% IMPORTANT only user defined function code goes below this line
%
% Only user defined function code is placed at the BOTTOM of a .m file
% If you put any (non-function) code that is outside a function definition
% it will cause an error.

% ADDITIONAL NOTE
% Do not change the code in the first 4 user defined functions
% The first 4 user defined functions is given and should not be edited
%
% Your work is to add code to the user defined functions #5 and #6 named
% mytargetpractice and myquadrants that are located at the bottom of this
% file (see below)

% MATLAB USER DEFINED FUNCTION RULES
%
% It is a requirement that all user defined function definition with parameters
% must be written using the following format
% 
%        Must begin with the keyword function
%       / Followed by the return parameter(s)
%      /  |  Followed by =
%     /   |  | Followed by the function name, followed by parentheses()
%    /    |  | | then put each input paramter inside ()s
%   /     |  | |          1st input paramter name
%  /      |  | |          |  2nd input paramter name
% /       |  | |          |  |  3rd input paramter name
%/        |  | |          |  |  |
function [y] = mylinspace(lo,hi,n) % user defined function #1
%         |               |  |  |
%         |               |  |  number of values, n
%         |               |  upper domain value, hi
%         |               lower domain value, lo
%         list of one or more comma separated output parameter(s) inside []s
%
% Example user defined function named mylinspace that works is the same as
% the built-in function named linspace.  mylinspace uses a while loop to
% fill and return one output parameter vector named y that is filled with
% n evenly spaced values from lo thru hi
%
% NOTE: always use semicolon (;) on RHS to suppress output of all calcs
% in a function definition, as shown below.  Also note: you do not need
% to clear variables created in a function definition.
%
% mylinspace is same as the built-in MATLAB function named linspace
%
% Example:
% r = mylinspace(0,2,5) % array of 5 evenly space values where 0<=r(i)<=2
% r =
%          0    0.5000    1.0000    1.5000    2.0000
    
% How to calculate n evenly spaced values from lo thru hi?

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
% function mycircle takes two input parameters, radius, theta, and returns
% two output parameters, [x,y], that describe circle of given radius
%
% Example:
% [x,y] = mycircle(1,mylinspace(0,2*pi,30)); % create xycoords of unit circle

    x = radius * cos(theta);
    y = radius * sin(theta); 
end

function [pos,neg] = myposneg(y) % user defined function #3
% myposneg returns logical arrays of the locations of pos and neg values in y
%
% Example:
% [pos,neg] = myposneg(y);

    pos = y>=0; % RHS code that calcs each y >= 0 location
    neg = y<0; % RHS code that calcs each y < 0 location
end

function [bullseye,miss] = mybullseye(x,y) % user defined function #4
% mybullseye returns logical arrays of the locations of bullseyes and miss
% of the given xycoords that describe a circle
%
% Example:
% [bullseye,miss] = mybullseye(x,y);

    d = sqrt(x.^2+y.^2);
    bullseye = d<=1; % RHS code calcs each xy bullseye location
    miss = d>1; % RHS code calcs each xy miss (non-bullseye) location
end

% user defined function #5 - you need to add code to this function

function [q1,q2,q3,q4] = myquadrants(x,y)
% myquadrants takes two input scalar parameters, x and y, and returns
% 4 output parameters, [q1,q2,q3,q4] that store the locations in xy
% that have values in each respective quadrant (I,II,III,IV)
%
% Example:
% [q1,q2,q3,q4] = myquadrants(x,y);
%
% NOTE you need to add RHS code that uses logical arrays to calculate
% and assign (=) the correct values to each of the output parameters
%
% q1 = add_RHS_code ; % use a semicolon (;) to suppress all output 
% q2 = add_RHS_code ; % use a semicolon (;) to suppress all output 
% q3 = add_RHS_code ; % use a semicolon (;) to suppress all output 
% q4 = add_RHS_code ; % use a semicolon (;) to suppress all output 

% Hint: use array logical & to calc the xy locations for each quadrant



end % Add code to the myquadrants function above this line

% user defined function #6 - you need to add code to this function

function [bullseye,middle,outer,missed] = mytargetpractice(x,y)
% function mytargetpractice takes two input scalar parameters, x and y,
% and returns 4 output parameters, bullseye, middle, outer, missed
%
% Example: 
% [bullseye,middle,outer,missed] = mytargetpractice(x,y);
%
% NOTE
% 
% You do not need to clear variables used in function definition
%
% IMPORTANT
% 
% NOTE you need to add RHS code that uses logical arrays to calculate
% and assign (=) the correct values to each of the output parameters
%
% bullseye = add_RHS_code ; % See Hint
% middle   = add_RHS_code ; % See Hint 
% outer    = add_RHS_code ; % use a semicolon (;) to suppress all output 
% missed   = add_RHS_code ; % use a semicolon (;) to suppress all output 

    d = sqrt(x.^2+y.^2);

% Hint: use array logical & to calc middle and outer circle locations,
           


end % Add code to the mytargetpractice function above this line

