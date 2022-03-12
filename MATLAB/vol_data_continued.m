clear all
D = zeros(3, 3, 3);
D(:,:,1) = [0 0 0; 0 1 0; 0 0 0];
D(:,:,2) = [0 1 0; 1 0 1; 0 1 0];
D(:,:,3) = [0 0 0; 0 1 0; 0 0 0];

D2 = zeros(3, 3, 3);
D2(:,:,1) = [0 0 0; 0 2 0; 0 0 0];
D2(:,:,2) = [0 2 0; 2 1 2; 0 2 0];
D2(:,:,3) = [0 0 0; 0 2 0; 0 0 0];


%________TRISURF 3D MODEL___________
c = 1;
for i = 1:3
    for j = 1:3
        for k = 1:3
            if D(i,j,k) == 1
                index_xyz(c,:) = [i, j, k];
                c = c + 1;
            end
        end
    end
end
% plot3(index_xyz(:,1), index_xyz(:,2), index_xyz(:,3))
% grid on
% k = boundary(index_xyz);
% hold on
% trisurf(k, index_xyz(:,1), index_xyz(:,2), index_xyz(:,3), 'Facecolor', 'red', 'Facealpha', 1)
%         

vis3d(D)

% x = -1:1;
% y = -1:1;
% z = -1:1;
% [xx, yy, zz] = meshgrid(x, y, z);
% 
% volumeViewer(D)
