classdef knight < piece
    %KNIGHT Class for the knight piece
    %   Inherits from the piece class. Adds additional functionality as
    %   knights move in a specific way.

    properties
    end

    methods
        function n = knight(colour, currentPosition)
            %KNIGHT Construct an instance of this class
            %   Detailed explanation goes here
            n.MoveIndices = [
                2, 1;
	            -2, 1;
	            -2, -1;
	            2, -1;
	            1, 2;
	            -1, 2;
	            -1, -2;
                1, -2;
                ]; % This covers all 8 positions knights can move to
            n.Colour = colour;
            n.CurrentPosition = currentPosition;
            n.Symbol = "N";
            n.ContinuousMovement = false;
        end
    end
end