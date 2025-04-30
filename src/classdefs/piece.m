classdef piece < handle
    %PIECE Superclass for all piece objects
    %   Pawns, knights, bishops, rooks, queens, and kings inherit from this
    %   base class. The core logic and definitions are encapsulated in this
    %   class and overridden in subclasses

    properties
        PossibleMoves
        DirectionVectors (:,2) {mustBeNumeric, mustBeInteger}
        Colour (1,1) string
        CurrentPosition
        ContinuousMovement logical % Bishops, Rooks, Queens
        Symbol (1,1) string % For chess notation (King = K, Knight = N, Queen = Q, etc)
        FilePath (1,1) string

    end

    methods
        % No constructor for base class

        function possibleMoves = generatePossibleMoves(obj)
            %GENERATEPOSSIBLEMOVES Generates the possible moves for a given
            % piece
            %   Uses DirectionVectors to generate all moves for this piece, even
            %   if they aren't legal.
            possibleMoves = [];

            curRow = obj.CurrentPosition(1);
            curCol = obj.CurrentPosition(2);
            
            for i = 1:length(obj.DirectionVectors)
                dirRow = obj.DirectionVectors(i, 1);
                dirCol = obj.DirectionVectors(i, 2);
                moveRow = curRow + dirRow;
                moveCol = curCol + dirCol;
                while (moveRow >= 1 && moveRow <= 8) && (moveCol >= 1 && moveCol <= 8)
                    possibleMoves = [possibleMoves; moveRow, moveCol];
                    if ~obj.ContinuousMovement
                        break;
                    end
                    moveRow = moveRow + dirRow;
                    moveCol = moveCol + dirCol;
                end
            end
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
            % capture your own piece.
            if ~isempty(board.BoardMatrix{moveRow, moveCol}) && board.BoardMatrix{moveRow, moveCol}.Colour == obj.Colour
                legal = false;
                return;
            end

            % 2. If obj.ContinousMovement == true, is there a clear path to
            % move to the square?
            if obj.ContinuousMovement
                if curRow > moveRow
                    dirRow = -1;
                elseif curRow < moveRow
                    dirRow = 1;
                else
                    dirRow = 0;
                end
                if curCol > moveCol
                    dirCol = -1;
                elseif curCol < moveCol
                    dirCol = 1;
                else
                    dirCol = 0;
                end
                newRow = curRow+dirRow;
                newCol = curCol+dirCol;
                while newRow ~= moveRow || newCol ~= moveCol
                    if ~isempty(board.BoardMatrix{newRow, newCol})
                        legal = false;
                        return;
                    end
                    newRow = newRow+dirRow;
                    newCol = newCol+dirCol;
                end
            end
            
            % Could implement pins (to stop pieces moving that cause the
            % king to be in check (however, I have decided this is a lot of
            % extra conditions and it would be simpler to just let players
            % take each others kings, hence ending the game (instead of
            % checking for checkmate each time).

        end

        function legalMoves = generateLegalMoves(obj, board)
            %GENERATELEGALMOVES Generates the legal moves for a given piece
            %   Uses generatePossibleMoves() and the board to determine
            %   which moves for this piece are legal.
            legalMoves = [];
            possibleMoves = obj.generatePossibleMoves();

            for i = 1:size(possibleMoves, 1)
                moveRow = possibleMoves(i, 1);
                moveCol = possibleMoves(i, 2);
                if obj.isLegalMove(board, moveRow, moveCol)
                    legalMoves = [legalMoves; moveRow, moveCol];
                end
            end
        end

        
        function moved(obj)
            %MOVED Optional method to be called when a piece moves
            %   This is useful for pieces that have special rules after they move:
            %   e.g. After a pawn moves, it cannot move two squares
            %   e.g. After a king moves, it cannot castle
            %   e.g. After a rook moves, it cannot castle
            %   Must be overridden in subclasses
        end
    end
end