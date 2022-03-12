%This will identify where the spot is and what shape
function [T] = FindCords(imageSeries)

[~,~,sl] = size(imageSeries);
for i = 1:sl
    image = imageSeries(:,:,i);
    [y,x] = find(image == 1);
    if isempty(x)
        xco(i) = 0;
        yco(i) = 0;

        rx(i) = 0;
        ry(i) = 0;
    else
        
        xco(i) = round(mean(x));
        yco(i) = round(mean(y));

        rx(i) = max(abs(x - xco(i)));
        ry(i) = max(abs(y - yco(i)));
    end
end

T = table(xco', yco', rx', ry', 'VariableNames', {'X centre', 'Y centre', 'Width','Height'});
end
