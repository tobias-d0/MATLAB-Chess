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
            
        end

        function run(game)
            while ~game.Board.isGameOver()
                inputStr = ("It is " + game.PlayerTurn + "'s turn.\n" + ...
                    game.PlayerTurn +"'s move: ");
                playerMove = input(inputStr, "s");
            end

        end

    end
end