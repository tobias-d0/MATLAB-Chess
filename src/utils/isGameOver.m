% Function to tell if the game is over

function gameOver = isGameOver()
    if isCheckmate() || isDraw()
        gameOver = true;
    else
        gameOver = false;
end