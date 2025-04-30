function colourImg = generateColourImg(width,height,colour)
%GENERATECOLOURIMG Generates an image matrix with size width x height
%filled with a solid colour
% Colour must be an array containing RGB values (8 bit unsigned integers)
    % Preallocate
    colourImg = zeros(width, height, 3, 'uint8');
    for i = 1:width
        for j = 1:height
            for k = 1:3
                colourImg(i,j,k) = colour(k);
            end
        end
    end
end