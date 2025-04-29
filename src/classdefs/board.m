classdef board
    %BOARD Contains logic for the board
    
    properties
        BoardMatrix (8,8)
        LegalMoves (1,:) % unsure if using Chess notation (string) or something else
        WhiteCanCastle logical = true
        BlackCanCastle logical = true
    end

    methods
        function b = board()
            %BOARD Construct an instance of this class
            %   Detailed explanation goes here

            % Populate the 8x8 board matrix:
            for row = 1:8
                if row > 2 && row < 7
                    % These rows should not be populated
                    continue;
                end
                if row == 1 || row == 2
                    colour = "Black";
                else
                    colour = "White";
                end
                currentPosition = [row, col];
                for col = 1:8
                    if row == 1 || row == 8
                        switch col
                            case [1,8]
                                b.BoardMatrix(row, col) = rook(colour, currentPosition);
                            case [2,7]
                                b.BoardMatrix(row, col) = knight(colour, currentPosition);
                            case [3,6]
                                b.BoardMatrix(row, col) = bishop(colour, currentPosition);
                            case 4
                                b.BoardMatrix(row, col) = queen(colour, currentPosition);
                            case 5
                                b.BoardMatrix(row, col) = king(colour, currentPosition);
                        end
                    else
                        b.BoardMatrix(row, col) = pawn(colour, currentPosition);
                    end
                end
            end
        end

        function gameOver = isGameOver(board, playerToMove)
            if isCheckmate(board, playerToMove) || isStalemate(board, playerToMove)
                gameOver = true;
                return;
            end
            gameOver = false;
        end

        function check = isInCheck(board, playerToMove)
        end

        function checkmate = isCheckmate(board, playerToMove)
        end

        function stalemate = isStalemate(board, playerToMove)
        end

        function legalMoves = getLegalMoves(board, playerToMove)
            %LEGALMOVES Returns the player's legal moves
            %   Each piece will generate all of its possible moves which
            %   will then be checked to ensure they are legal. Legal moves
            %   are returned in the vector legalMoves.
        end

        function disp(board)
            %DISP Display the board graphically
            %   Uses data from the board matrix and stitches an image using
            %   the chess images pieces in the images folder to create a
            %   graphical representation of the board
            
        end
    end
end