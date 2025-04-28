classdef pawn < piece
    %PAWN Class for the pawn piece
    %   Inherits from the piece class. Adds additional functionality as
    %   pawns capture in a specific way.

    properties
        CaptureIndices (2,2) = [1,1 ; -1,1] % Forward-right, forward-left
        FirstMove = true
    end

    methods
        function p = pawn(colour, currentPosition)
            %PAWN Construct an instance of this class
            %   Detailed explanation goes here
            p.MoveIndices = [0,1]; % forward
            p.Colour = colour;
            p.CurrentPosition = currentPosition;
            p.Symbol = ""; % No symbol for a pawn
            p.ContinuousMovement = false;
        end
    end
end