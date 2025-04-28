classdef board
    %BOARD Contains logic for the board
    %{
        Let:
            empty space = 0
            pawn        = 1
            knight      = 2
            bishop      = 3
            rook        = 4
            queen       = 5
            king        = 6
    %}

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
            %METHOD1 Display the board graphically
            %   Uses data from the board matrix and stitches an image using
            %   the chess images pieces in the images folder to create a
            %   graphical representation of the board
            
        end
    end
end