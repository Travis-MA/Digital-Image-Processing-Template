function[OutputImage, OutputHist, InputHist]  = HishMatch_11712610(InputImage, SpecHist)

image  = imread(InputImage);
bit = 8;
L = 2 ^ bit;
InputHist = zeros(L, 1);
for i = 1:size(image, 1)
    for j = 1: size(image, 2)
        InputHist(image(i, j)+1,1) = InputHist(image(i, j)+1,1) + 1; % 0-255 to 1-256
    end
end
InputHist = InputHist./(size(image,1)*size(image,2)); %probility

Tr  = zeros(L, 1);
for k = 0 : L-1
    Tr(k+1) = round((L-1) * sum(InputHist(1:k+1)));
end

Tz  = zeros(L, 1);
for k = 0 : L-1
    Tz(k+1) = round((L-1) * sum(SpecHist(1:k+1)));
end

Tz_inv = zeros(L, 1);
for i = 1:L
    var = 100000000000000000000000;
    for j = 1:L
        if(var > abs(i - Tz(j)))
            var = abs(i - Tz(j));
            Tz_inv(i) = j;
        end
    end
end

OutputImage = zeros(size(image));
for i = 1: size(image, 1)
    for j = 1: size(image, 2)
        OutputImage(i,j) = Tz_inv(Tr(image(i,j) + 1))-1;
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


