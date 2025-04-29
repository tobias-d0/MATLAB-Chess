classdef rook < piece
    %ROOK Class for the rook piece
    %   Inherits from the piece class.

    properties
    end

    methods
        function r = rook(colour, currentPosition)
            %ROOK Construct an instance of this class
            %   Takes the colour and current position of the rook
            %   and instantiates how it can move.
            r.MoveIndices = [
                1, 0; % right
	            0, 1; % up
	            -1, 0; % left
	            0, -1; % down
                ];
            r.Colour = colour;
            r.CurrentPosition = currentPosition;
            r.Symbol = "R";
            % Rooks move horizontally and vertically multiple squares at a time
            r.ContinuousMovement = true;
            if colour == "White"
                r.FilePath = "..\images\white-rook.png";
            else
                r.FilePath = "..\images\black-rook.png";
            end
        end
    end
end