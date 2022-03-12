

sz_x = 221;
sz_y = 221;
mat = create_matrix(sz_x,sz_y);
[xx, yy, zz] = meshgrid(linspace(0, 10, 101), linspace(0, 10, 101), linspace(0, 5, 10));
v = zeros(size(mat));


% labelvolshow(mat)
volumeViewer(mat)

for i =1:sz_x
    for j =1:sz_y
        for k = 1:10
            if mat(i,j,k) == 1
                v(i,j,k) = 1;
               
            end
        end
    end
end


%for the flow data
% [x, y , z, v] = flow;
% p = patch(isosurface(x,y,z,v,-3));
% isonormals(x,y,z,v,p)
% p.FaceColor = 'red';
% p.EdgeColor = 'none';
% daspect([1 1 1])
% view(3); 
% axis tight
% camlight 
% lighting gouraud

%%for my stuff
[fo,vo] = isosurface(xx, yy, zz , v, 0);               % isosurface for the outside of the volume
[fe,ve,ce] = isocaps(xx, yy, zz ,v,0);  
    
figure
p1 = patch('Faces', fo, 'Vertices', vo);       % draw the outside of the volume
p1.FaceColor = 'red';
p1.EdgeColor = 'none';

p2 = patch('Faces', fe, 'Vertices', ve, ...    % draw the end caps of the volume
   'FaceVertexCData', ce);
p2.FaceColor = 'interp';
p2.EdgeColor = 'none';


view(-40,24)
daspect([1 1 0.3])                             % set the axes aspect ratio
colormap(gray(100))
box on

camlight(40,40)                                % create two lights 
camlight(-20,-10)
lighting gouraud
