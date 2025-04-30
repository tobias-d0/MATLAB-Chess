classdef bishop < piece
    %BISHOP Class for the bishop piece
    %   Inherits from the piece class.

    properties
    end

    methods
        function b = bishop(colour, currentPosition)
            %BISHOP Construct an instance of this class
            %   Takes the colour and current position of the bishop
            %   and instantiates how it can move.
            b.DirectionVectors = [
                1, 1; % up-right
	            1, -1; % down-right
	            -1, -1; % down-left
	            -1, 1; % up-left
                ];
            b.Colour = colour;
            b.CurrentPosition = currentPosition;
            b.Symbol = "B";
            % Bishops move diagonally multiple squares at a time
            b.ContinuousMovement = true;
            if colour == "White"
                b.FilePath = "..\src\images\white-bishop.png";
            else
                b.FilePath = "..\src\images\black-bishop.png";
            end
        end
    end
end