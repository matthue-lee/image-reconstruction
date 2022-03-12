num_slices = 3;
mat_a = NaN(5, 5);
mat_b = NaN(5, 5);

mat_a(3, 3) = 1;
mat_b(2, 3) = 1;
mat_b(3, 2) = 1;
mat_b(3, 4) = 1;
mat_b(4, 3) = 1;


new_mat = NaN(5, 5, num_slices);

new_mat(:,:,1) = mat_a;
new_mat(:,:,2) = mat_b;
new_mat(:,:,3) = mat_a;
index_xyz = [];

c = 1;
for i = 1:5
    for j = 1:5
        for k = 1:3
            if new_mat(i,j,k) == 1
                index_xyz(c,:) = [i, j, k];
                c= c + 1;
            end
        end
    end
end
    
nm = [1, 2, 4, 5, 5, 3, 33,4, 4, 34];


%vec matrix will be in the from of [fromx, fromy, tox, toy;]
vec_matrix = [];
visited = [];
c = 2;
next = [0,0]; 
%for loop to find any point to start at. save coords to visited matrix and
%set as first 'from' point




%run until a point connects to the first visited point
completed = false;
r = 1;
[visited, vec_matrix] = find_start(new_mat);


while ~completed  
    i = visited(1,1);
    j = visited(1,2);
    for alpha = i-r:i+r
        disp('col one')
            cord = [alpha, j+r];
            if mat_b(cord(1), cord(2)) == 1 & ~check_for_coords(cord, visited)
                next = cord;
                visited(c,1) = cord(1);
                visited(c,2) = cord(2);
                c = c+ 1;
            end
        end
       
    
    for alpha = j+r:j-r
        cord = [i+r, alpha];    
        disp('hello')
        if mat_b(cord(1), cord(2)) == 1 & ~check_for_coords(cord, visited)
            next = cord;
            visited(c,1) = cord(1);
            visited(c,2) = cord(2);
            c = c+ 1;
        end
    end
    
        
    for alpha = i+r:i-r
        cord = [alpha, j-r];
        if mat_b(cord(1), cord(2)) == 1 & ~check_for_coords(cord, visited)
            next = cord;
            visited(c,1) = cord(1);
            visited(c,2) = cord(2);
            c = c+ 1;
        end
    end
    
    for alpha = j-r:j+r
        cord = [i-r, alpha];
        if mat_b(cord(1), cord(2)) == 1 & ~check_for_coords(cord, visited)
            next = cord;
            visited(c,1) = cord(1);
            visited(c,2) = cord(2);
            c = c+ 1;
        end
    end
    
    
    r = r + 1;
   completed = true;
end


% x = index_xyz(:,1);
% y = index_xyz(:,2);
% z = index_xyz(:,3);
% figure; 
% plot3(x,y,z,'o');
% F = scatteredinterpolant(index_xyz(:,1), index_xyz(:,2), index_xyz(:,3), v);


function [visited, vec_matrix] = find_start(new_mat)
    for i = 1:5
        for j = 1:5
            if new_mat(i,j, 2) == 1
                vec_matrix(1,:) = [i,j];
                visited(1,:) = [i,j];
                return
            end
        end
    end
end


function is_in = check_for_coords(coord, visited)
    sz = size(visited);
    for i = 1:sz(1)
        if coord == visited(i,:)
            is_in = true;
            return
        end
    end
    is_in = false;
    
 
end
