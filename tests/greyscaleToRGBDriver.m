clear;
clc;

[cData, ~, alphaData] = imread("..\src\images\black-king.png");
rgbImg = greyscaleToRGB(cData, alphaData);
h = imshow(rgbImg(:,:,1:3));

% https://au.mathworks.com/help/releases/R2024b/matlab/ref/set.html?searchHighlight=set%28%29&s_tid=doc_srchtitle
set(h, 'AlphaData', double(rgbImg(:,:,4)) / 255);