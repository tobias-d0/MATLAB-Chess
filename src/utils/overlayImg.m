function overlayedImg = overlayImg(frontCData, frontAlphaData, backCData)
%OVERLAYIMG Stiches two image matrices together
%   Overwrites the data from backCData with frontCData if
%   frontAlphaData(i,j) is not transparent
%   Requires 2 RGB images with front image Alpha data
%   Image matrix of RGB format is returned (no alpha values)
    overlayedImg = backCData;
    [width, height, channels] = size(frontCData);
    [width2, height2, channels2] = size(backCData);
    if (channels ~= channels2 || channels ~= 3)
        % https://au.mathworks.com/help/matlab/ref/error.html
        error("CData is not of RGB format");
    elseif (width ~= width2 || height ~= height2)
        error("CData not of same size")
    end
    for i = 1:width
        for j = 1:height
            if frontAlphaData(i,j) ~= 0 % is not transparent
                for k = 1:3
                    overlayedImg(i,j,k) = frontCData(i,j,k);
                end
            end
        end
    end
end