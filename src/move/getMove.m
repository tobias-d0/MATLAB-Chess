% Function get move from user

function move = getMove(board, player)
    while true
        move = input("Enter your move: ", "s");
        if isValidMove(board, player, move)
            return
        end
        fprintf("This is not a valid move! Please try a different one.\n")
    end
end