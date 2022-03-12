function circle = edgedetect(bmp_addresses)

bmp = imread('Recon2.bmp');
bmpd = im2gray(bmp);
BW = edge(bmpd, 'Sobel', 0.171);
imshow(BW)


end
