function Bilinear_11712610(input_file, dim)

image = im2double(imread(input_file));
posi_i_x = [0 : size(image,1)-1]' ./ (size(image,1)-1) .*dim(1);
posi_i_y = [0 : size(image,2)-1]' ./ (size(image,2)-1) .*dim(2);
posi_ni_x = 0 : dim(1)-1;
posi_ni_y = 0 : dim(2)-1;

%for every new pixel, find nearest fourth
nearx = zeros(dim(1), 2);
for nx = 1:dim(1)  
    [x1, x2] = deal(1); 
    for ox = 1:size(image,1)
        if(posi_ni_x(nx) - posi_i_x(ox) < 0)
            x1 = ox-1;
            x2 = ox;
            break;
        end
        if(posi_ni_x(nx) == posi_i_x(ox))
            [x1, x2] = deal(ox); 
            break;
        end
    end
    nearx(nx, :) = [x1, x2];
end

neary = zeros(dim(2), 2);
for ny = 1:dim(2)  
    [y1, y2] = deal(1); 
    for oy = 1:size(image,2)
        if(posi_ni_y(ny) - posi_i_y(oy) < 0)
            y1 = oy-1;
            y2 = oy;
            break;
        end
        if(posi_ni_y(ny) == posi_i_y(oy))
            [y1, y2] = deal(oy); 
            break;
        end
    end
    neary(ny, :) = [y1, y2];
end  

new_image = zeros(dim);
for nx = 1:dim(1)  
    for ny = 1:dim(2)  
        x1 = nearx(nx, 1);  
        x2 = nearx(nx, 2);
        y1 = neary(ny, 1);  
        y2 = neary(ny, 2);
        x = posi_ni_x(nx);  
        y = posi_ni_y(ny);
        ip = 0;
        if(x1 ~= x2 && y1 ~= y2)
            ip1 = (y-posi_i_y(y1))/(posi_i_y(y2)-posi_i_y(y1)) * (image(x2, y2) - image(x2, y1)) + image(x2, y1);
            ip2 = (y-posi_i_y(y1))/(posi_i_y(y2)-posi_i_y(y1)) * (image(x1, y2) - image(x1, y1)) + image(x1, y1);
            ip = (x-posi_i_x(x2))/(posi_i_x(x1)-posi_i_x(x2)) * (ip2 - ip1) + ip1;
        end
        if(x1 == x2 && y1 ~= y2)
            ip = (y-posi_i_y(y1))/(posi_i_y(y2)-posi_i_y(y1)) * (image(x2, y2) - image(x2, y1)) + image(x2, y1);
        end
        if(x1~=x2 && y1==y2)
            ip = (x-posi_i_x(x2))/(posi_i_x(x1)-posi_i_x(x2)) * (image(x1, y1) - image(x2, y1)) +  image(x2, y1);
        end
        if(x1==x2 && y1==y2)
            ip = image(x1, y1);
        end
        new_image(nx, ny) = ip;
    end
end

figure(1)
imshow(image);
figure(3)
imshow(new_image);