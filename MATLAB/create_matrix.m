function shape_mat = create_matrix(x_sz, y_sz)

x = -x_sz/2:x_sz/2;
y = -y_sz/2:y_sz/2;
[xx, yy] = meshgrid(x,y);

a = 3;

if a == 1
    u = zeros(size(xx));
    u((2^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<3^2))=1;
    
    u1= zeros(size(xx));
    u1((2^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<3^2))=1;

    u2= zeros(size(xx));
    u2((4^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<5^2))=1;

    u3= zeros(size(xx));
    u3((7^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<8^2))=1;

    u4= zeros(size(xx));
    u4((10^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<11^2))=1;

    u5= zeros(size(xx));
    u5((13^2<(xx.^2+yy.^2)) & ((xx.^2+yy.^2)<14^2))=1;
end

if a == 2
    u = zeros(size(xx));
    u = insertShape(u1, 'Circle', [20, 20, 2], 'Color', 'white');
    u = insertShape(u1, 'Rectangle', [50, 50, 22, 22], 'Color', 'white');
    
    u1= zeros(size(xx));
    u1 = insertShape(u1, 'Circle', [20, 20, 2], 'Color', 'white');
    u1 = insertShape(u1, 'Rectangle', [50, 50, 22, 22], 'Color', 'white');

    u2= zeros(size(xx));
    u2 = insertShape(u2, 'Circle', [20, 20, 3], 'Color', 'white');
    u2 = insertShape(u2, 'Rectangle', [50, 50, 22, 22], 'Color', 'white');

    u3= zeros(size(xx));
    u3 = insertShape(u3, 'Circle', [20, 20, 4], 'Color', 'white');
    u3 = insertShape(u3, 'Rectangle', [50, 50, 22, 22], 'Color', 'white');

    u4= zeros(size(xx));
    u4 = insertShape(u4, 'Circle', [20, 20, 5], 'Color', 'white');
    u4 = insertShape(u4, 'Rectangle', [50, 50, 22, 22], 'Color', 'white');
end

if a == 3
    u= zeros(size(xx));
    u = insertShape(u, 'Circle', [100, 100, 1], 'Color', 'white');
    
    u1= zeros(size(xx));
    u1 = insertShape(u1, 'Circle', [100, 100, 1], 'Color', 'white');
    
    u2= zeros(size(xx));
    u2 = insertShape(u2, 'Circle', [100, 100, 2], 'Color', 'white');
    
    u3= zeros(size(xx));
    u3 = insertShape(u3, 'Circle', [100, 100, 2], 'Color', 'white');
    
    u4= zeros(size(xx));
    u4 = insertShape(u4, 'Circle', [100, 100, 3], 'Color', 'white');
end


shape_mat = zeros(size(xx));
shape_mat(:,:,1) = u(:,:,1);
shape_mat(:,:,2) = u1(:,:,1);
shape_mat(:,:,3) = u2(:,:,1);
shape_mat(:,:,4) = u3(:,:,1);
shape_mat(:,:,5) = u4(:,:,1);
shape_mat(:,:,6) = u4(:,:,1);
shape_mat(:,:,7) = u3(:,:,1);
shape_mat(:,:,8) = u2(:,:,1);
shape_mat(:,:,9) = u1(:,:,1);
shape_mat(:,:,10) = u(:,:,1);


