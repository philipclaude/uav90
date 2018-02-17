function p1_integrate_rk4
% test something nonsenical
nu = 100;
nt = 100000;

u0 = zeros(nu,1);
t  = linspace(0,1,nt);
f  = @(x,t) x.*t;
u  = integrate_rk4(f,t,u0);
assert(size(u,1)==nt);
assert(size(u,2)==nu);

% test with parameters
nu = 4;
nt = 101;
u0 = zeros(nu,1);
t  = linspace(0,1,nt);
p  = project1_parameters();
u  = integrate_rk4(@(t,x) rhs(t,x,p),t,u0);
assert(size(u,1)==nt);
assert(size(u,2)==nu);

% run it again with the square
p.boundary.type = 'square';
u  = integrate_rk4(@(t,x) rhs(t,x,p),t,u0);
assert(size(u,1)==nt);
assert(size(u,2)==nu);
end

function f = rhs(t,x,params)
f = force(x(1:2)',t,params);
end

function f = force(x,t,params)
% randomly set
f = [force_wall(x,t,params),2*force_wall(x,t,params)]';
end