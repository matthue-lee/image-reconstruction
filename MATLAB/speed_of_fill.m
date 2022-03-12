% Function testing the speed of morphological proccesses
function speed_of_fill()
clear all 
clc

%set sizes to test
x = 100:100:5000;
times = zeros(50); 
c = 1;

for dim = 100:100:	
    c
    mat = create_matrix(dim, dim);
    f = @() fill_shape(mat, dim, dim);
    t = timeit(f,1);
    times(c) = t;
    c = c + 1;
end

%save data
xlswrite('Image Fill Speed - Average Times (100-5000).xlsx',times);

%Plot data
figure
hold on;
plot(x, times(:, 1))
title('Time versus Image Dimension (for closing and filling)');
ylabel('Time(s)');
xlabel('Image side length (Pixels)');
saveas(gcf, 'Time versus Image Dimension (for Image Fill).png');