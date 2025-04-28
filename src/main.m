%{

While user wants to play:
    Let user select black or white
    flag whitesTurn = true
    While ~gameEnd (draw or checkmate)
        move = getPlayerMove()
        
        whitesTurn = ~whitesTurn

%}

% Update flag to stop playing
continuePlaying = true;

while continuePlaying
    player = "White";
    board = initializeBoard();
    while isGameOver(board, player)


        player = changePlayerTurn(player);
    end
    fprintf("%s's turn!", player);
    continuePlaying = logical(input("Enter 1 to play again, 0 to quit: "));
end
