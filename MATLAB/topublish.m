clc;
clearvars;
clear all;
address_list = [];
multipoint_slices = 107;
singlespotvv_slices = 48;
num_slices = 48;

for j = 1:num_slices
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\zFullHoloX\\zFullHolo%i.jpg", j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\SinglePlaneSpot\\zFullHolo_V2%i.jpg", 9+j);
    fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\SingleSpotVV\\OneSpotVV%i.jpg", j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\MultiplePoints3\\MultiPointsReconstructed%i.jpg", j);
    
    address_list = [address_list; fid];
end

result = [];
filled = [];


address_list(1)
for img = 1:num_slices
    result(:,:,img) = imread(address_list(img));
end


c = 0;
for i = 1:num_slices
    u = imread(address_list(i));
    se = strel('disk', 9);
    bw = u;
    imclearborder(bw);
    closed = imclose(bw, se);
    imshow(closed, 'border', 'tight');
    bw = imbinarize(closed, 0.5);
    bin_img = imfill(bw, 'holes');
    imshow(bin_img, 'border', 'tight')
    filled(:, :, i) = bw;
end

filled = smooth3(filled, 'box', [9 9 9]);


%%%%%Volume forming
limits = [NaN NaN NaN NaN NaN num_slices];
[x, y, z, filled] = subvolume(filled, limits);           % extract a subset of the volume data

[fo,vo] = isosurface(x, y, z,filled);               % isosurface for the outside of the volume
[fe,ve,ce] = isocaps(x, y, z, filled);  
    
figure
xlabel('X location (um)');
ylabel('Y Location (um)');
zlabel('Z Location (um)');
% xlim([0 300])
% ylim([0 200])
% zlim([0 150])


p1 = patch('Faces', fo, 'Vertices', vo);       % draw the outside of the volume
p1.FaceColor = 'red';
p1.EdgeColor = 'none';

p2 = patch('Faces', fe, 'Vertices', ve, ...    % draw the end caps of the volume
   'FaceVertexCData', ce);
p2.FaceColor = 'interp';
p2.EdgeColor = 'none';


view(-40,24)
daspect([1 1 1])                             % set the axes aspect ratio
colormap(gray(100))
box on

camlight(40,40)                                % create two lights 
camlight(-20,-10)
lighting gouraud

ax = gca;
tick_scale_factor = 5;
ax.XTickLabel = ax.XTick * tick_scale_factor;
ax.YTickLabel = ax.YTick * tick_scale_factor;
ax.ZTickLabel = ax.ZTick * tick_scale_factor;