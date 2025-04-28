classdef game
    %GAME Contains logic for a single game
    %   This object will exist for the duration of a game until stalemate
    %   or checkmate. `game` prompts the players for their moves and relays
    %   this information to the `board` object.

    properties
        Board (1,1) board
        PlayerTurn (1,1) string {mustBeMember(PlayerTurn,["White", "Black"])} = "White"
    end

    methods
        function g = game()
            %GAME Construct an instance of this class
            %   Detailed explanation goes here
            
        end

    end
end