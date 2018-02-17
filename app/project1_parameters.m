function params = project1_parameters()

% set the default parameters for project1

params.boundary.center = [0.,0.];

params.boundary.type = 'circle';
params.boundary.radius = 5.;

params.boundary.length = 20.;

params.x0 = [0.4,.0];
params.v0 = [.01,0.];
params.R  = .5;
params.alpha = 0.5;
params.beta = 0.5;
params.m = 0.5;
params.T = [0,5];

end