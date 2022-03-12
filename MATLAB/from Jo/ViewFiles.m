%ViewFiles
%Wiew all hologram files
for n = 1:100
    num = n*50 + 4000;
    if (n/10) < 1
        a = rgb2gray(imread(sprintf('Real3_revised_reconstruction_%03dum.jpg',num),'jpg'));
        imshow(a);
        disp('first10');
    else
        b = rgb2gray(imread(sprintf('Real3_revised_reconstruction_%04dum.jpg',num),'jpg'));
        imshow(b);
        disp('last10');
    end
end