function [d,theta] = distance_rectangle(p,x1,x2,y1,y2)

% Copyright (C) 2004-2012 Per-Olof Persson.
% See COPYRIGHT.TXT for details.

% center the rectangle
d1 = y1 -p(2);   % distance to bottom side
d2 = -y2 +p(2);  % distance to top side
d3 = x1 -p(1);   % distance to left side
d4 = -x2 +p(1);  % distance to right side

d = -min( min( min( -d1,-d2 ),-d3 ), -d4 );
tol = 1e-12;
if abs( abs(d)-abs(d1) ) < tol
    % closest to bottom wall, force is upwards
    theta = .5*pi;
elseif abs( abs(d)-abs(d2) ) < tol
    % closest to top wall, force is downwards
    theta = -.5*pi;
elseif abs( abs(d)-abs(d3) ) < tol
    % closest to left side, force is to the right
    theta = 0;
else
    % closest to right side, force is to the left
    theta = -pi;
end