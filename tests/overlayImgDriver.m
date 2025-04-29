clear;
clc;

% This will show a white king on a light-squared colour background
[frontCData, ~, frontAlphaData] = imread("..\src\images\white-king.png");
rgbImg = greyscaleToRGB(frontCData);

backCData = generateColourImg(128, 128, [255, 253, 228]);

newImg = overlayImg(rgbImg, frontAlphaData, backCData);
imshow(newImg);

pause(2);

clear;
clc;

% This will show a black king on a dark-squared colour background
[frontCData, ~, frontAlphaData] = imread("..\src\images\black-king.png");
rgbImg = greyscaleToRGB(frontCData);

backCData = generateColourImg(128, 128, [240, 140, 20]);

newImg = overlayImg(rgbImg, frontAlphaData, backCData);
imshow(newImg);

pause(2);

clear;
clc;

% This will show a black pawn on a light-squared colour background
[frontCData, ~, frontAlphaData] = imread("..\src\images\black-pawn.png");
rgbImg = greyscaleToRGB(frontCData);

backCData = generateColourImg(128, 128, [255, 253, 228]);

newImg = overlayImg(rgbImg, frontAlphaData, backCData);
imshow(newImg);