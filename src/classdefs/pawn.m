classdef pawn < piece
    %PAWN Class for the pawn piece
    %   Inherits from the piece class. Adds addtional functionality as
    %   pawns capture in a specific way.

    properties
        CaptureIndices (2,2) = [1,1 ; -1,1] % Forward-right, forward-left
        FirstMove = true
    end

    methods
        function p = pawn(colour)
            %PAWN Construct an instance of this class
            %   Detailed explanation goes here
            p.MoveIndices = [0,1]; % forward
            p.Colour = colour;
        end
    end
end