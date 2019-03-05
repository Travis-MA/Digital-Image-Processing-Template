function Nearest_11712610(input_file, dim)

image = im2double(imread(input_file));
posi_i_x = [0 : size(image,1)-1]' ./ (size(image,1)-1) .*dim(1);
posi_i_y = [0 : size(image,2)-1]' ./ (size(image,2)-1) .*dim(2);
posi_ni_x = 0 : dim(1)-1;
posi_ni_y = 0 : dim(2)-1;

itp_x = zeros(dim(1), 1);
for i = 1:dim(1)
    var = 100000000000000000000000;
    for j = 1:size(image,1)
        if(var > abs(posi_ni_x(i) - posi_i_x(j)))
            var = abs(posi_ni_x(i) - posi_i_x(j));
            itp_x(i) = j;
        end
    end
end

itp_y = zeros(dim(2), 1);
for i = 1:dim(2)
    var = 100000000000000000000000;
    for j = 1:size(image,2)
        if(var > abs(posi_ni_y(i) - posi_i_y(j)))
            var = abs(posi_ni_y(i) - posi_i_y(j));
            itp_y(i) = j;
        end
    end
end

new_image = zeros(dim);
for i = 1:dim(1)
    for j = 1:dim(2)
        new_image(i,j) = image(itp_x(i), itp_y(j));
    end
end

figure(1)
imshow(image);
figure(2)
imshow(new_image);