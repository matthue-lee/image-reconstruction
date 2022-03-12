%This is a test for Contrast Detection see how well it works
clear
clc
%Read in Data
for n = 1:100
    num = n*50 + 4000;
    if (n/10) < 1
        a = rgb2gray(imread(sprintf('Real3_revised_reconstruction_%03dum.jpg',num))); %'b_reconstruction_z_%03dum.jpg
        imageSeries(:,:,n) = a;
        %imshow(imageSeries(:,:,n));
    else
        imageSeries(:,:,n) = rgb2gray(imread(sprintf('Real3_revised_reconstruction_%04dum.jpg',num)));
%         imshow(imageSeries(:,:,n));
    end
end

score = ContrastDetection2(imageSeries);
[scort,Idx] = sort(score,'descend'); %find index of which z steps have highest contrast 
plot(score);
xlabel('delta-z step')
ylabel('relative contrast')
disp(Idx);


figure;
for j = 1:5
    [x(j), y(j), rx(j), ry(j), imageS(:,:,j)] = FindCords(imageSeries(:,:,Idx(j)),scort(j));
    fprintf('%d\t%d\t%d\t%d\t%d\n',Idx(j),x(j), y(j), rx(j), ry(j));
    if j == 1 || j==2
        subplot(2,3,j),imshow(imageSeries(:,:,Idx(j)));
    end
end
% 

figure;
for i=1:4
    subplot(2,2,i),imshow(imageS(:,:,i));
end
