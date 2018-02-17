function x = path_target(t,params)
x = zeros(length(t),2);
R = params.R;
x(:,1) = R.*cos(t) ;
x(:,2) = R.*sin(t);
end