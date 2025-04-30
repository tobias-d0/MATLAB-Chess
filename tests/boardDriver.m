clear;
clc;

% Expected: Creates a 1x1 board object
% Actual: Creates a 1x1 board object
b = board();

% Expected: Displays a chess board with all pieces in starting positions
% Actual: Displays a chess board with all pieces in starting positions
b.disp();

b2 = board();
b2 = b2.updatePieceMoves("White");

for i = 1:length(b2.PieceMoves)
    fprintf("Piece at [%d,%d] can move to:\n", b2.PieceMoves(i).CurrentPos);
    disp(b2.PieceMoves(i).LegalMoves)
end

%%%%%%%% EXPECTED %%%%%%%%

%{

Piece at [7,1] can move to:
     6     1
     5     1

Piece at [7,2] can move to:
     6     2
     5     2

Piece at [7,3] can move to:
     6     3
     5     3

Piece at [7,4] can move to:
     6     4
     5     4

Piece at [7,5] can move to:
     6     5
     5     5

Piece at [7,6] can move to:
     6     6
     5     6

Piece at [7,7] can move to:
     6     7
     5     7

Piece at [7,8] can move to:
     6     8
     5     8

Piece at [8,1] can move to:
Piece at [8,2] can move to:
     6     3
     6     1

Piece at [8,3] can move to:
Piece at [8,4] can move to:
Piece at [8,5] can move to:
Piece at [8,6] can move to:
Piece at [8,7] can move to:
     6     8
     6     6

Piece at [8,8] can move to:

%%%%%% ACTUAL %%%%%

Piece at [7,1] can move to:
     6     1
     5     1

Piece at [7,2] can move to:
     6     2
     5     2

Piece at [7,3] can move to:
     6     3
     5     3

Piece at [7,4] can move to:
     6     4
     5     4

Piece at [7,5] can move to:
     6     5
     5     5

Piece at [7,6] can move to:
     6     6
     5     6

Piece at [7,7] can move to:
     6     7
     5     7

Piece at [7,8] can move to:
     6     8
     5     8

Piece at [8,1] can move to:
Piece at [8,2] can move to:
     6     3
     6     1

Piece at [8,3] can move to:
Piece at [8,4] can move to:
Piece at [8,5] can move to:
Piece at [8,6] can move to:
Piece at [8,7] can move to:
     6     8
     6     6

Piece at [8,8] can move to:

(They're the same)
%}