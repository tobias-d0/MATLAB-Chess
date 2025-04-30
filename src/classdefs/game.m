classdef game
    %GAME Contains logic for a single game
    %   This object will exist for the duration of a game until stalemate
    %   or checkmate. `game` prompts the players for their moves and relays
    %   this information to the `board` object, which exists inside this object.

    properties
        Board (1,1) board
        PlayerTurn (1,1) string {mustBeMember(PlayerTurn,["White", "Black"])} = "White"
    end

    methods
        function g = game()
            %GAME Construct an instance of this class
            %   Create the board object and start the game by calling the
            %   run() method
            b = board();
            g.Board = b;
            g.run();

            
        end

        function run(obj)
            while ~obj.Board.isGameOver(obj.PlayerTurn)
                % Display the board
                obj.Board.disp();
                obj.Board.updatePieceMoves(obj.PlayerTurn);
                % Get the piece to be moved from the player
                inputStr = ("It is " + obj.PlayerTurn + "'s turn.\n" + ...
                    obj.PlayerTurn + ...
                    ", which piece do you want to move? (enter in format row,col): ");
                [pieceRow, pieceCol] = obj.sanitiseInput(input(inputStr, "s"));
                while pieceRow == -1 || pieceCol == -1
                    [pieceRow, pieceCol] = obj.sanitiseInput(input("Please enter a valid position (row,col): ", "s"));
                end
                piece = obj.Board.BoardMatrix{pieceRow, pieceCol};
                fprintf("You have selected the %s piece at [%d,%d]\n", piece.Colour, pieceRow, pieceCol);
                fprintf("Your piece has the following legal moves:\n");
                % Display the legal moves for the piece
                legalMoves = piece.generateLegalMoves(obj.Board);
                if isempty(legalMoves)
                    fprintf("This piece has no legal moves.\n");
                    continue;
                end
                for i = 1:size(legalMoves, 1)
                    fprintf("[%d,%d]\n", legalMoves(i, 1), legalMoves(i, 2));
                end
                % Get the destination square from the player
                inputStr = ("Where do you want to move this piece? (enter in format row,col): ");

                hasMoved = false;
                while ~hasMoved
                    % Get the destination square from the player
                    [moveRow, moveCol] = obj.sanitiseInput(input(inputStr, "s"));
                    while moveRow == -1 || moveCol == -1
                        [moveRow, moveCol] = obj.sanitiseInput(input("Please enter a valid position (row,col): ", "s"));
                    end

                    % Check if the move is in the list of legal moves for this piece
                    isLegalMove = false;
                    for i = 1:size(legalMoves, 1)
                        if legalMoves(i, 1) == moveRow && legalMoves(i, 2) == moveCol
                            isLegalMove = true;
                            break;
                        end
                    end
                    if ~isLegalMove
                        fprintf("Illegal move. Please try again.\n");
                        continue;
                    else
                        hasMoved = true;
                        
                    end
                end
                obj.Board = obj.Board.movePiece(piece, moveRow, moveCol);
                % Call the moved() method for the piece
                piece.moved();
                % Check if the game is over
                if obj.Board.isGameOver(obj.PlayerTurn)
                    obj.Board.disp();
                    fprintf("Game over! %s wins!\n", obj.PlayerTurn);
                    return;
                end
                % Switch the player turn
                if obj.PlayerTurn == "White"
                    obj.PlayerTurn = "Black";
                else
                    obj.PlayerTurn = "White";
                end

            end

        end

        function [row, col] = sanitiseInput(obj, inputStr)
            if length(inputStr) ~= 3 || inputStr(2) ~= ','
                row = -1;
                col = -1;
                return;
            end
            row = str2double(inputStr(1));
            col = str2double(inputStr(3));
            if isnan(row) || isnan(col) || row < 1 || row > 8 || col < 1 || col > 8
                row = -1;
                col = -1;
                return;
            end

        end

    end
end