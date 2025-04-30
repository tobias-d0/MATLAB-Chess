classdef rook < piece
    %ROOK Class for the rook piece
    %   Inherits from the piece class.

    properties
        CanCastle logical = true % Rooks can castle unless they have moved
    end

    methods
        function r = rook(colour, currentPosition)
            %ROOK Construct an instance of this class
            %   Takes the colour and current position of the rook
            %   and instantiates how it can move.
            r.DirectionVectors = [
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
                r.FilePath = "..\src\images\white-rook.png";
            else
                r.FilePath = "..\src\images\black-rook.png";
            end
        end

        function moved(obj)
            obj.CanCastle = false; % Rooks cannot castle after they have moved
        end
    end
end