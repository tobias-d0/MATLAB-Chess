classdef queen < piece
    %QUEEN Class for the queen piece
    %   Inherits from the piece class.

    properties
    end

    methods
        function q = queen(colour, currentPosition)
            %QUEEN Construct an instance of this class
            %   Takes the colour and current position of the queen
            %   and instantiates how it can move.
            q.MoveIndices = [
                1, 0; % right
	            0, 1; % up
	            -1, 0; % left
	            0, -1; % down
	            1, 1; % up-right
	            1, -1; % down-right
	            -1, -1; % down-left
	            -1, 1; % up-left
                ];
            q.Colour = colour;
            q.CurrentPosition = currentPosition;
            q.Symbol = "Q";
            % Queens move horizontally, vertically and diagonally
            % multiple squares at a time
            q.ContinuousMovement = true; 
        end
    end
end