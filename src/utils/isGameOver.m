% Function to tell if the game is over

function gameOver = isGameOver(board, player)
    if isCheckmate(board, player) || isStalemate(board, player)
        gameOver = true;
    else
        gameOver = false;
end