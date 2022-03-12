function speed_to_construct_speedy()
clear all
clc

times = zeros(25, 1);
total_times = zeros(25, 50);
avg_time_per_dim = zeros(50, 1);
x = 100:100:5000;

c =1 ;
for dim = 100:100:5000
    c
    sz_x = dim;
    sz_y = dim;
    mat = create_matrix(sz_x, sz_y);
    filled = fill_shape(mat, sz_x, sz_y);
    for i = 1:25
        i
        times(i) = display_vol(dim,dim, filled);
        delete(findall(0))
    end
    total_times(:,c) = times;
    mn = mean(times);
    avg_time_per_dim(c) = mn;
    c = c + 1;
end



sound(sin(1:10000));
xlswrite('Image Reconstruction Speed - average times (0-5000).xlsx',avg_time_per_dim);
xlswrite('Image Reconstruction Speed - all times (0-5000).xlsx',total_times);

figure
hold on;
plot(x, avg_time_per_dim(:, 1))
title('Time versus Image Dimension (for Image Construction) 0-5000');
ylabel('Time(s)');
xlabel('Image side length (Pixels)');
saveas(gcf, 'Time versus Image Dimension (for Image Construction).png');