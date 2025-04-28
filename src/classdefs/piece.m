classdef piece
    %PIECE Superclass for all piece objects
    %   Pawns, knights, bishops, rooks, queens, and kings inherit from this
    %   base class. The core logic and definitions are encapsulated in this
    %   class and overridden in subclasses

    properties
        PossibleMoves
        MoveIndices
        Colour
    end

    methods
        % No constructor for base class

        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end