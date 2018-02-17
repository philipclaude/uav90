function p1_force_target

x = [0,0];
t = 3;
params = project1_parameters();

f = force_target(x,t,params);
assert(size(f,2)==2);
assert(size(f,1)==1);

end