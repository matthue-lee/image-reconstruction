% Function incorporating all work to create final volumetric image


clc;
clearvars;
clear all;
address_list = [];
multipoint_slices = 107;
singlespotvv_slices = 48;
num_slices = 132;

%Select address of folder with chosen dataset
for j = 1:num_slices
    fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\zFullHoloX\\zFullHolo%i.jpg", j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\SinglePlaneSpot\\zFullHolo_V2%i.jpg", 9+j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\SingleSpotVV\\OneSpotVV%i.jpg", j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\MultiplePoints3\\MultiPointsReconstructed%i.jpg", j);
    
    address_list = [address_list; fid];
end

result = [];
filled = [];


address_list(1)
for img = 1:num_slices
    result(:,:,img) = imread(address_list(img));
end


% Image Segmentationan Pre-proccessing
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

%Data smoothing
filled = smooth3(filled, 'box', [9 9 9]);


%%%%%Volume forming
limits = [NaN NaN NaN NaN NaN num_slices];
[x, y, z, filled] = subvolume(filled, limits);         

[fo,vo] = isosurface(x, y, z,filled);               % isosurface for the outside of the volume
[fe,ve,ce] = isocaps(x, y, z, filled);              % isosurface for endcaps
    
figure
xlabel('X location (um)');
ylabel('Y Location (um)');
zlabel('Z Location (um)');

%Outside of main volume
p1 = patch('Faces', fo, 'Vertices', vo);
p1.FaceColor = 'red';
p1.EdgeColor = 'none';

%End Caps
p2 = patch('Faces', fe, 'Vertices', ve, ...
   'FaceVertexCData', ce);
p2.FaceColor = 'interp';
p2.EdgeColor = 'none';

%Aspect Ratio
view(-40,24)
daspect([1 1 1])            
colormap(gray(100))
box on

%Lighting
camlight(40,40)                                
camlight(-20,-10)
lighting gouraud

ax = gca;
tick_scale_factor = 5;
ax.XTickLabel = ax.XTick * tick_scale_factor;
ax.YTickLabel = ax.YTick * tick_scale_factor;
ax.ZTickLabel = ax.ZTick * tick_scale_factor;