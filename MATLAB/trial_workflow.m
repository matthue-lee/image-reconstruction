clear all
clearvars
clc
address_list = ["C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic1.png", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic2.png", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic3.png"];
address_list_figsa = ["C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic1a.fig", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic2a.fig", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic3a.fig"];
address_list_figs = ["C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic1.fig", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic2.fig", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic3.fig"];


result = [];

address_list(1)

%z=3;
%filled = zeros(683, 683, 3);
%%%%%% For LabelVolShow
% for i = 1:z
%     u = openfig(address_list_figsa(i));
%     [f, c] = getframe(gcf);
%     bandw = f(:,:,1);
%     cropped = bandw(50:733, 147:839);
%     dc = cropped(1:683, 1:683);
%     result(:,:,i) = dc;
% end
% 
% p1 = result(:,:,1);
% p2 = result(:,:,2);
% p3 = result(:,:,3);
% close all
% volshow(result)





% %%%%%%%%%%For matlab fig input figsa
% z = 3;
% for i = 1:z
%     u = openfig(address_list_figsa(i));
%     [f, c] = getframe(gcf);
%     bandw = f(:,:,1);
%     cropped = bandw(50:733, 147:839);
%     dc = cropped(1:683, 1:683);
%     result(:,:,i) = dc;
% end
% close all
% 
% for i = 1:z
%     u = result(:,:,i);
%     se = strel('disk', 7);
%     closed = imclose(u, se);
%     bin_img = imfill(closed, 'holes');
%     filled(:, :, i) = closed;
% end

%%%%%%%%TESTING
% p1 = filled(:,:,1);
% p2 = filled(:,:,2);
% p3 = filled(:,:,3);
% rect = [];
% c = 1;
% for i = 1:683
%     for j = 1:683
%         if p3(i,j) ~= 0
%             disp('yes')
%             rect(:,c) = [i,j];
%             c = c + 1;
%         end
%     end
% end


%%%%%%%%% for jpg/png format input
z = 3;
filled = zeros(863, 976, 3);
for img = 1:3
    result = imread(address_list(img));
end


for i = 1:z
    u = result(:,:,i);
    se = strel('disk',7);
    imshow(u, 'border', 'tight');
    imclearborder(u);
    cropped = imcrop(u, [50, 147, 732, 829]);
    %imshow(cropped);   
    dc = imcrop(u, [98, 1, 733, 586]);
    %imshow(dc);
    closed = imclose(u, se);
    imshow(closed)
    bin_img = imfill(closed, 'holes');
    imshow(bin_img)
    filled(:, :, i) = closed;
end


limits = [NaN NaN NaN NaN NaN z];
[xx, yy, zz, filled] = subvolume(filled, limits);           % extract a subset of the volume data

[fo,vo] = isosurface(xx, yy, zz,filled);               % isosurface for the outside of the volume
[fe,ve,ce] = isocaps(xx, yy, zz, filled,0.5);  
    
figure
p1 = patch('Faces', fo, 'Vertices', vo);       % draw the outside of the volume
p1.FaceColor = 'red';
p1.EdgeColor = 'none';

p2 = patch('Faces', fe, 'Vertices', ve, ...    % draw the end caps of the volume
   'FaceVertexCData', ce);
p2.FaceColor = 'red';
p2.EdgeColor = 'none';

view(-40,24)
daspect([1 1 0.3])                             % set the axes aspect ratio
colormap(gray(100))
box on

camlight(40,40)                                % create two lights 
camlight(-20,-10)
lighting gouraud
   





%%%%%%%% For Trisurf/Plot3 
% index_xyz = [];
% c = 1;
% 
% for i = 1:x
%     for j = 1:y
%         for k = 1:z
%             if result(i,j,k) == 255
%                 index_xyz(c,:) = [i, j, k];
%                 c = c + 1;
%             end
%         end
%     end
% end

% slice_2 = [];
% c = 1;
% for i = 1:size(index_xyz)
%     if index_xyz(i,3) == 2
%         slice_2(c,:) = index_xyz(i,1:2);
%         c = c+1;
%     end     
% end

% plot3(index_xyz(:,1), index_xyz(:,2), index_xyz(:,3))
% grid on
% 
% %volshow(completemat);
% k = boundary(index_xyz);
% hold on
% trisurf(k, index_xyz(:,1), index_xyz(:,2), index_xyz(:,3), 'Facecolor', 'red', 'Facealpha', 1)


        