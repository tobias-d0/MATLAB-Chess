classdef pawn < piece
    %PAWN Class for the pawn piece
    %   Inherits from the piece class. Adds additional functionality as
    %   pawns capture in a specific way.

    properties
        FirstMove = true
    end

    methods
        function p = pawn(colour, currentPosition)
            %PAWN Construct an instance of this class
            p.Colour = colour;
            if colour == "White"
                p.FilePath = "..\src\images\white-pawn.png";
                p.DirectionVectors = [
                    -1, 0; % forward
                    -1, 1; % forward-right
                    -1, -1; % forward-left
                    -2, 0; % forward (first move)
                    ];
            else
                p.FilePath = "..\src\images\black-pawn.png";
                p.DirectionVectors = [
                    1, 0; % forward
                    1, 1; % forward-right
                    1, -1 % forward-left
                    2, 0; % forward (first move)
                    ];
            end
            % Pawns can only move one square forward at a time, but can move
            % two squares forward on their first move

            p.CurrentPosition = currentPosition;
            p.Symbol = ""; % No symbol for a pawn
            p.ContinuousMovement = false;
        end

        function legal = isLegalMove(obj, board, moveRow, moveCol)
            %ISLEGALMOVE Determines whether a move is legal
            %   Goes through a series of steps to determine if a move is
            %   legal            

            % Store x and y values of current position into variables
            legal = true;
            curRow = obj.CurrentPosition(1);
            curCol = obj.CurrentPosition(2);

            % 1. Is the square [moveRow, moveCol] occupied by a piece of the
            % same colour? If so, the move is not legal as you cannot
            % capture your own piece. Also pawns cannot move to a square in front of them
            % occupied by any piece. Also, pawns can only move diagonally to capture pieces.
            if ~isempty(board.BoardMatrix{moveRow, moveCol}) && (board.BoardMatrix{moveRow, moveCol}.Colour == obj.Colour || moveCol == curCol)
                legal = false;
                return;
            end

            if isempty(board.BoardMatrix{moveRow, moveCol}) && (moveCol ~= curCol)
                legal = false;
                return;
            end

            % 2. For a pawn's first move, it can move two squares forward provided it is
            % not blocked
            if obj.FirstMove
                if curCol == moveCol && abs(curCol - moveCol) == 2
                    % Check if the square in between is empty
                    if ~isempty(board.BoardMatrix{(curRow + moveRow)/2, curCol})
                        legal = false;
                        return;
                    end
                end
            end

        end

        function moved(obj)
            % Remove the ability to move two squares forward
            obj.FirstMove = false;
            obj.DirectionVectors = obj.DirectionVectors(1:3, :);
        end
    end
end