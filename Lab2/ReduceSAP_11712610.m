function[OutputImage] = ReduceSAP_11712610(InputImage, nsize)
image= imread(InputImage);
step = floor(nsize/2);
OutputImage = zeros(size(image));

left = []; right = []; upper = []; lower = [];
for i = 1 : step
    left = image(:, 1);
    right = image(:, end);
    upper = [image(1, 1), image(1, :), image(1, end)];
    lower = [image(end, 1), image(end, :), image(end, end)];
    image = [left, image, right];
    image = [upper; image; lower];
end

for x1 = step+1 : size(image, 1)-step
    for y1 = step+1 : size(image, 2)-step 
        OutputImage(x1-step,y1-step) = median(reshape(image(x1-step : x1+step, y1-step : y1+step), 1, nsize*nsize));
    end
end
OutputImage = uint8(OutputImage);
