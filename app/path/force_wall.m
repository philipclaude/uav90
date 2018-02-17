function f = force_wall(x,~,params)

if strcmp(params.boundary.type,'square')
    xc = params.boundary.center;
    l  = .5*params.boundary.length;
    x1 = xc(1) -l;
    x2 = xc(1) +l;
    y1 = xc(2) -l;
    y2 = xc(2) +l;

    [d,theta] = ( distance_rectangle( x , x1,x2,y1,y2 ) );
elseif strcmp(params.boundary.type,'circle')
    xc = params.boundary.center;
    r  = params.boundary.radius;

    [d,theta] = distance_circle( x , xc(1) , xc(2) , r );
else
    error('strange case');
end

% compute the force
d = abs(d);
s = params.beta/d^2;
f = [0.,0.];
f(1) = s*cos(theta);
f(2) = s*sin(theta);

end