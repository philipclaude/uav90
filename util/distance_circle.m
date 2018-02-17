function [d,theta] = distance_circle(p,x,y,R)

theta = atan2( p(2) -y , p(1) -x );
r = sqrt( (p(1) -x)^2 +(p(2) -y)^2 );
d = R -r;
theta = pi +theta;

end