function[OutputImage, OutputHist, InputHist] = LocalHistEqu_11712610(InputImage, nsize)
image = imread(InputImage);
L = 2 ^ 8;
step = floor(nsize/2);
OutputImage = zeros(size(image));

InputHist = zeros(L, 1);
for i = 1:size(image, 1)
    for j = 1: size(image, 2)
        InputHist(image(i, j)+1,1) = InputHist(image(i, j)+1,1) + 1;
    end
end
InputHist = InputHist./(size(image,1)*size(image,2));

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
        pr = zeros(L, 1);    
        for i = x1-step : x1+step
            for j = y1-step : y1+step
                pr(image(i, j)+1,1) = pr(image(i, j)+1,1) + 1;
            end
        end
        pr = pr./nsize./nsize;
        OutputImage(x1-step,y1-step) = round((L-1) * sum(pr(1:image(x1, y1)+1)));
    end
end
OutputImage = uint8(OutputImage);
OutputHist = zeros(L, 1);
for i = 1:size(OutputImage, 1)
    for j = 1: size(OutputImage, 2)
        OutputHist(OutputImage(i, j)+1,1) = OutputHist(OutputImage(i, j)+1,1) + 1;
    end
end
OutputHist = OutputHist./(size(OutputImage,1)*size(OutputImage,2));


