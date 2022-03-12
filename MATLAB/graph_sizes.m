function [size_prior, size_closed] = graph_sizes

num_slices =34;
address_list = [];
for j = 1:num_slices
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\zFullHoloX\\zFullHolo%i.jpg", j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\SinglePlaneSpot\\zFullHolo_V2%i.jpg", 9+j);
    %fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\SingleSpotVV\\OneSpotVV%i.jpg", j);
    fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\Uno_Spot\\OneSpot%i.jpg", j);
    
    address_list = [address_list; fid];
end

result = [];

for img = 1:num_slices
    result(:,:,img) = imread(address_list(img));
end

[~,~,sl] = size(result);

size_prior = FindCords(result);


for i = 1:num_slices
    %u = result(:,:,i);
    u = imread(address_list(i));
    se = strel('disk', 9);
    bw = u;
    imshow(bw, 'border', 'tight');
    imclearborder(bw);
    closed = imclose(bw, se);
    imshow(closed, 'border', 'tight');
    imwrite(closed, sprintf('closed_img_list_%i.jpg', i))
end

for k = 1:num_slices
    fid = sprintf("C:\\Users\\matth\\OneDrive - The University of Auckland\\ENGSCI 700\\MATLAB\\closed_img_list_%i.jpg", k);
    address_list = [address_list; fid];
end

closed_all = [];
for img = 1:num_slices
    closed_all(:,:,img) = imread(address_list(img));
end

size_closed = FindCords(closed_all);


