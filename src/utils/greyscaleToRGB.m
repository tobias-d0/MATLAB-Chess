function [rgbImg] = greyscaleToRGB(cData, alphaData)
%GREYSCALETORGB Converts a greyscale image to RGB format
%   Takes in a matrix with 8-bit unsigned integer values (0-255) and
%   produces a new matrix with three identical values in the same cell.
%   Example: M(3, 4) = 123 -> M(3, 4) = [123, 123, 123]


    [width, height] = size(cData);
    % 4 Channels for RGBA
    rgbImg = zeros(width, height, 4, 'uint8');
    
    for i = 1:width
        for j = 1:height
            pixelVal = cData(i,j);
            for k = 1:3
                rgbImg(i,j,k) = pixelVal;
            end
            rgbImg(i,j,4) = alphaData(i,j);
        end
    end
end