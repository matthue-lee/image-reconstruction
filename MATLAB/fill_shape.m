function filled = fill_shape(mat, sz_x, sz_y)

filled = zeros(sz_x + 1, sz_y + 1, 11);
for i = 1:10
    u = mat(:,:,i);
    se = strel('disk',7);
    closed = imclose(u, se);
    bin_img = imfill(closed, 'holes');
    filled(:, :, i) = bin_img;
end

end
