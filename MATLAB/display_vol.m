function elapsedTime = display_vol(sz_x, sz_y, filled)
tic;
%%%%%Volume forming
limits = [NaN NaN NaN NaN NaN 11];
[x, y, z, filled] = subvolume(filled, limits);           % extract a subset of the volume data

[fo,vo] = isosurface(x, y, z,filled);               % isosurface for the outside of the volume
[fe,ve,ce] = isocaps(x, y, z, filled,0.5);  
    
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
elapsedTime = toc;
end
