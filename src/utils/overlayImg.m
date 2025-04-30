function overlayedImg = overlayImg(frontCData, frontAlphaData, backCData, position)
%OVERLAYIMG Stiches two image matrices together
%   Overwrites the data from backCData with frontCData if
%   frontAlphaData(i,j) is not transparent
%   Requires 2 RGB images with front image Alpha data
%   Image matrix of RGB format is returned (no alpha values)
arguments
    frontCData
    frontAlphaData
    backCData
    position (2,1) {mustBeNumeric, mustBeInteger} = [0,0]
end
overlayedImg = backCData;
[heightF, widthF, channels] = size(frontCData);
[heightB, widthB, ~] = size(backCData);
xOffset = position(2); % ⚠️ column offset (horizontal)
yOffset = position(1); % ⚠️ row offset (vertical)

if channels ~= 3
    % https://au.mathworks.com/help/matlab/ref/error.html
    error("CData is not of RGB format");
end

for i = 1:heightF
    for j = 1:widthF
        targetY = yOffset + i;
        targetX = xOffset + j;
        if frontAlphaData(i,j) ~= 0 && ...
                targetY <= heightB && targetX <= widthB && ...
                targetY > 0 && targetX > 0
            overlayedImg(targetY, targetX, :) = frontCData(i, j, :);
        end
    end
end
end