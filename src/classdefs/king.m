classdef king < piece
    %KING Class for the king piece
    %   Inherits from the piece class.

    properties
    end

    methods
        function k = king(colour, currentPosition)
            %KING Construct an instance of this class
            %   Takes the colour and current position of the king
            %   and instantiates how it can move.
            k.MoveIndices = [
                1, 0; % right
	            0, 1; % up
	            -1, 0; % left
	            0, -1; % down
	            1, 1; % up-right
	            1, -1; % down-right
	            -1, -1; % down-left
	            -1, 1; % up-left
                ];
            k.Colour = colour;
            k.CurrentPosition = currentPosition;
            k.Symbol = "K";
            % Kings move horizontally, vertically and diagonally
            % one square at a time
            k.ContinuousMovement = false; 
        end
    end
end