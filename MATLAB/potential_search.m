clc;
clear all
sz_x = 100;
sz_y = 100;
completemat = create_matrix(sz_x, sz_y);
index_xyz = [];
c = 1;

for i = 1:sz_x
    for j = 1:sz_y
        for k = 1:10
            if completemat(i,j,k) == 1
                index_xyz(c,:) = [i, j, k];
                c = c + 1;
            end
        end
    end
end


% slice_2 = [];
% c = 1;
% for i = 1:size(index_xyz)
%     if index_xyz(i,3) == 2
%         slice_2(c,:) = index_xyz(i,1:2);
%         c = c+1;
%     end     
% end


plot3(index_xyz(:,1), index_xyz(:,2), index_xyz(:,3))
grid on

volshow(completemat);
k = boundary(index_xyz);
hold on
trisurf(k, index_xyz(:,1), index_xyz(:,2), index_xyz(:,3), 'Facecolor', 'red', 'Facealpha', 1)

        