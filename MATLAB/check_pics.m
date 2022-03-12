clc
clear all
address_list = ["C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic1.fig", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic2.fig", "C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic3.fig"];

A = read_imgs(address_list);

p1 = A(:,:,1);

cropped = imcrop(p1, [50, 147, 732, 829]);
sz = size(cropped);
p2 = A(:,:,2);
p3 = A(:,:,3);
imshow(p3, 'border', 'tight')
cropped = imcrop(p2, [147, 50, 829, 732]);
doublecropped = imcrop(cropped, [0,0, 683,683]);
saveas("C:\Users\matth\OneDrive - The University of Auckland\ENGSCI 700\MATLAB\ContrastPic1.fig", 'ContrastPic1.jpg')