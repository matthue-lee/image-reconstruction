function mat = smallmatrix()
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
    new_mat(:,:,3) = mat_b;
    new_mat(:,:,4) = mat_a;
    index_xyz = [];
end