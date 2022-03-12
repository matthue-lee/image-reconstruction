x = -50:50;
y = -50:50;
[xx, yy] = meshgrid(x,y);

u= zeros(size(xx));
u((49^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<50^2))=1;


% imshow(u)
se = strel('disk',10);
closed = imclose(u, se);

bin_img = imfill(closed, 'holes');
figure
imshow(bin_img)
