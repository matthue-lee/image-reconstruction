function img_mat = read_imgs(img_address_list)

img_mat = [];
for i = 1:length(img_address_list)
    openfig(img_address_list(i));
    F = getframe(gcf);
    close;
    [X, Map] = frame2im(F);
    img_mat(:,:,i) = X(:,:,1);
end
