classdef board
    %BOARD Contains logic for the board
    
    properties
        BoardMatrix
        SquareSize = 128 % pixels
        LightSquareColour = [255, 253, 223]
        DarkSquareColour = [240, 140, 20]
        PieceMoves struct = struct([]); % Holds current position of piece and legal moves
        WhiteCastleQueenSide logical = true
        WhiteCastleKingSide logical = true
        BlackCastleQueenSide logical = true
        BlackCastleKingSide logical = true
    end

    methods
        function b = board()
            %BOARD Construct an instance of this class
            %   Detailed explanation goes here

            % Populate the 8x8 board matrix:
            b.BoardMatrix = cell(8,8);
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
                for col = 1:8
                    currentPosition = [row, col];
                    if row == 1 || row == 8
                        switch col
                            case {1,8}
                                b.BoardMatrix{row, col} = rook(colour, currentPosition);
                            case {2,7}
                                b.BoardMatrix{row, col} = knight(colour, currentPosition);
                            case {3,6}
                                b.BoardMatrix{row, col} = bishop(colour, currentPosition);
                            case 4
                                b.BoardMatrix{row, col} = queen(colour, currentPosition);
                            case 5
                                b.BoardMatrix{row, col} = king(colour, currentPosition);
                        end
                    else
                        b.BoardMatrix{row, col} = pawn(colour, currentPosition);
                    end
                end
            end
        end

        function gameOver = isGameOver(obj, playerToMove)
            if isCheckmate(obj, playerToMove)
                gameOver = true;
                return;
            end
            gameOver = false;
        end

        function checkmate = isCheckmate(obj, playerToMove)
            %ISCHECKMATE Check if the game is in checkmate
            %   Check if the player to move is in checkmate. This means that
            %   the player is in check and has no legal moves left.
        
            checkmate = false;
        
            % Check if the player's king has been captured
            for row = 1:8
                for col = 1:8
                    piece = obj.BoardMatrix{row, col};
                    if ~isempty(piece) && piece.Colour == playerToMove && piece.Symbol == "K"
                        % The king has not been captured, so the game is not over
                        return;
                    end
                end
            end
        
            checkmate = true;
        end

        function obj = movePiece(obj, piece, newRow, newCol)
            %MOVEPiece Move a piece to a new position on the board
            %   Moves the piece to the new position and updates the board
            %   matrix
    
        
            % Move the piece to the new position
            obj.BoardMatrix{newRow, newCol} = piece;
            % Remove the old piece
            obj.BoardMatrix{piece.CurrentPosition(1), piece.CurrentPosition(2)} = [];
        
            % Update piece's current position
            piece.CurrentPosition = [newRow, newCol];
        end

        function obj = updatePieceMoves(obj, playerToMove)
            %UPDATEPIECEMOVES Store current positions and legal moves of all active pieces
        
            moves = struct('CurrentPos', {}, 'LegalMoves', {});
            index = 1;
        
            for row = 1:8
                for col = 1:8
                    piece = obj.BoardMatrix{row, col};
                    if ~isempty(piece) && piece.Colour == playerToMove
                        moves(index).CurrentPos = [row, col];
                        moves(index).LegalMoves = piece.generateLegalMoves(obj);
                        index = index + 1;
                    end
                end
            end
        
            obj.PieceMoves = moves;
        end
        

        function disp(obj)
            %DISP Display the board graphically
            %   Uses data from the board matrix and stitches an image using
            %   the chess images pieces in the images folder to create a
            %   graphical representation of the board
            boardImg = zeros(128*8, 128*8, 3, 'uint8');
            for row = 1:8
                for col = 1:8
                    if mod(row+col, 2) == 1
                        squareImg = generateColourImg(obj.SquareSize, ...
                            obj.SquareSize,obj.DarkSquareColour);
                    else
                        squareImg = generateColourImg(obj.SquareSize, ...
                            obj.SquareSize, obj.LightSquareColour);
                    end
                    if ~isempty(obj.BoardMatrix{row,col})
                        filePath = obj.BoardMatrix{row,col}.FilePath;
                        [pieceCData, ~, pieceAlphaData] = imread(filePath);
                        
                        pieceImgRGB = greyscaleToRGB(pieceCData);
                        squareImg = overlayImg(pieceImgRGB, pieceAlphaData, squareImg);
                    end
                    squareAlphaData = 255 * ones(obj.SquareSize, obj.SquareSize, 'uint8');
                    boardImg = overlayImg(squareImg, squareAlphaData, ...
                        boardImg, [(row-1)*obj.SquareSize, ...
                        (col-1)*obj.SquareSize]);
                end
            end
            imshow(boardImg);        
        end
    end
end