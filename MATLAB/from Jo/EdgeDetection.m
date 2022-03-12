%This script detects the edges of spots. 

function [calibrateFactor] = EdgeDetection(image)
    I = image; %imread('Reconstruction35','png');
    [b,threshold] = edge(I,'sobel');
    calibrateFactor = 1;
    while range(range(b)) ~= 0
        calibrateFactor = calibrateFactor+1;
        b = edge(I,'sobel',threshold*calibrateFactor);
        %imshow(b)
        %title('Binary Gradient Mask') %binary gradient mask shows lines of high contrast in the image
    end
    calibrateFactor = calibrateFactor*threshold;
end