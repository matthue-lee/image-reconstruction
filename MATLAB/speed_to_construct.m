function speed_to_construct()
clear all
clc

times = zeros(100);
avg_time_per_dim = zeros(99);
x = 100:50:5000;

c =1 ;
for dim = 100:50:5000
    for i = 1:25
        times(i) = isosurface_trial(dim,dim);
        delete(findall(0))
    end
    avg_time_per_dim(c) = mean(times(:,1));
    c = c + 1;
end

sound(sin(1:10000));

figure
hold on;
plot(x, avg_time_per_dim(:, 1))
title('Time versus Image Dimension (for Image Construction)');
ylabel('Time(s)');
xlabel('Image side length (Pixels)');
saveas(fig, 'Time versus Image Dimension (for Image Construction)');