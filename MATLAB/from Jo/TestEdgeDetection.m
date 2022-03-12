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


img = imageSeries(:,:,20);
s = EdgeDetection(img);