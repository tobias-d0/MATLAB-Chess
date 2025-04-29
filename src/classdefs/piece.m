classdef piece
    %PIECE Superclass for all piece objects
    %   Pawns, knights, bishops, rooks, queens, and kings inherit from this
    %   base class. The core logic and definitions are encapsulated in this
    %   class and overridden in subclasses

    properties
        PossibleMoves
        MoveIndices (2,:) {mustBeNumeric, mustBeInteger}
        Colour (1,1) string {mustBeMember(Colour, ["White", "Black"])}
        CurrentPosition
        ContinuousMovement logical % Bishops, Rooks, Queens
        Symbol % For chess notation (King = K, Knight = N, Queen = Q, etc)
        FilePath

    end

    methods
        % No constructor for base class

        function moves = generatePossibleMoves(obj, board)
            %GENERATEPOSSIBLEMOVES Generates the possible moves for a given
            % piece
            %   Uses MoveIndices to generate all moves for this piece, even
            %   if they aren't legal.
            
        end
    end
end