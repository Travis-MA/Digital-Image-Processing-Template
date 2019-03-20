clear;
clc;
% 
%Task 1
InputImage = 'Q2_1_1.tif';
[OutputImage, OutputHist, InputHist] = HistEqu_11712610(InputImage);
% figure(1);
% bar([1:256],InputHist);
% figure(2);
% bar([1:256],OutputHist);
% figure(3)
% imshow(OutputImage);

%Task 2
SpecHist = OutputHist;
InputImage = 'Q2_2.tif';
[OutputImage, OutputHist, InputHist]  = HishMatch_11712610(InputImage, SpecHist);
figure(4);
bar([1:256],InputHist);
figure(5);
bar([1:256],OutputHist);
figure(6);
imshow(OutputImage);


% 
%Task 3
% InputImage = 'Q2_3.tif';
% msize = 9;
% [OutputImage, OutputHist, InputHist] = LocalHistEqu_11712610(InputImage, msize);
% figure(3);
% imshow(OutputImage);

%Task 4
% InputImage = 'Q2_4.tif';
% nsize = 3; %Odd number
% OutputImage = ReduceSAP_11712610(InputImage, nsize);
% figure(4);
% imshow(OutputImage);