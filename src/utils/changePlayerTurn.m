% Function to change player turn

function playerTurn = changePlayerTurn(currentPlayerTurn)
    if currentPlayerTurn == "White"
        playerTurn = "Black";
    else
        playerTurn = "White";
    end
end