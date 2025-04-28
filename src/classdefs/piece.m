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

        X =[
    1, 0; % right
	0, 1; % up
	-1, 0; % left
	0, -1; % down
	1, 1; % up-right
	1, -1; % down-right
	-1, -1; % down-left
	-1, 1; % up-left

	% Knight moves
	2, 1;
	-2, 1;
	-2, -1;
	2, -1;
	1, 2;
	-1, 2;
	-1, -2;
	1, -2;
]
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