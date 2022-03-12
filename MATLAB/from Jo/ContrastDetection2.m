function [score] = ContrastDetection2(imageSeries)
%imageSeries and then ranks all of them by separate metrics
[~,~,slice] = size(imageSeries);
%disp(slice);
for sl = 1:slice
    %disp(sl)
    image = imageSeries(:,:,sl);
    cntr = EdgeDetection(image);
    score(sl) = cntr;
end
end