function[OutputImage, OutputHist, InputHist] = HistEqu_11712610(InputImage)
image  = imread(InputImage);
L = 2 ^ 8;
InputHist = zeros(L, 1);
for i = 1:size(image, 1)
    for j = 1: size(image, 2)
        InputHist(image(i, j)+1,1) = InputHist(image(i, j)+1,1) + 1;
    end
end
InputHist = InputHist./size(image,1)./size(image,2);

OutputImage = zeros(size(image));
for i = 1:size(image, 1)
    for j = 1: size(image, 2)
        OutputImage(i,j) = round((L-1) * sum(InputHist(1:image(i, j)+1)));
    end
end

OutputHist = zeros(L, 1);
for i = 1:size(OutputImage, 1)
    for j = 1: size(OutputImage, 2)
        OutputHist(OutputImage(i, j)+1,1) = OutputHist(OutputImage(i, j)+1,1) + 1;
    end
end
OutputHist = OutputHist./(size(OutputImage,1)*size(OutputImage,2));
OutputImage = uint8(OutputImage);

