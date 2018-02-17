function f = animate_path( t , x , xt )

if nargin<3
    xt = [];
end

size(x)
if size(x,2)~=2
    error('should be npoints x 2');
end
assert( length(t)==size(x,1) );

if ~isempty(xt)
    if size(xt,2)~=2
        error('should be npoints x 2');
    end
    assert(length(t)==size(xt,1));
end

f = figure;
hold on;

plot( x(:,1) , x(:,2) );
if ~isempty(xt)
    plot(xt(:,1),xt(:,2));
end
axis equal;
xlabel('x');
ylabel('y');

for i=1:length(t)-1
    h = plot( x(i,1) , x(i,2) , 'k^' , 'MarkerSize' , 10 , 'MarkerFaceColor' , 'k' );
    if ~isempty(xt)
        g = plot( xt(i,1),xt(i,2) , 'ro' , 'MarkerSize' , 10 , 'MarkerFaceColor' , [255,165,0]/255. );
    end
    pause(t(i+1) -t(i) );
    delete(h);
    if ~isempty(xt)
        delete(g);
    end
end