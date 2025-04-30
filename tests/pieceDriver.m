clear;
clc;


%%%%%% IMPORTANT %%%%%%
% testing for: piece.generatePossibleMoves()

% Expected: The queen should have 21 possible moves from its starting
% square on an empty board
q = queen("White", [4, 8]);
possibleMoves = q.generatePossibleMoves();
% disp(possibleMoves);
disp(length(possibleMoves));
% Actual: The queen has 21 possible moves


% Expected: The pawn should have 3 possible moves from its starting
% square on an empty board (forward 1, forward 2, forward-right (when
% taking)
p = pawn("White", [1, 7]);
possibleMoves = p.generatePossibleMoves();
% disp(possibleMoves);
disp(length(possibleMoves));
% Actual: The pawn has 3 possible moves


% Expected: The pawn should have 4 possible moves from its starting
% square on an empty board (forward 1, forward 2, forward-right (when
% taking), forward-left (when taking))
p2 = pawn("White", [2, 7]);
possibleMoves = p2.generatePossibleMoves();
% disp(possibleMoves);
disp(length(possibleMoves));
% Actual: The pawn has 4 possible moves
p2.moved();
possibleMoves = p2.generatePossibleMoves();
% Expected: Number of possible moves reduced by one, since the pawn can no
% longer move two squares forward
disp(length(possibleMoves));
% Actual: 3 Possible moves


% Expected: The knight should have 8 possible moves from its starting
% square on an empty board
n = knight("White", [4, 4]);
possibleMoves = n.generatePossibleMoves();
% disp(possibleMoves);
disp(length(possibleMoves));
% Actual: The knight has 8 possible moves


% Expected: The knight should have 3 possible moves from its starting
% square on an empty board
n2 = knight("White", [7, 8]);
possibleMoves = n2.generatePossibleMoves();
% disp(possibleMoves);
disp(length(possibleMoves));
% Actual: The knight has 3 possible moves


% Expected: The bishop should have 7 possible moves from its starting
% square on an empty board
b = bishop("White", [6, 8]);
possibleMoves = b.generatePossibleMoves();
% disp(possibleMoves);
disp(length(possibleMoves));
% Actual: The bishop has 7 possible moves

%%%%%% IMPORTANT %%%%%%
% testing for: piece.generateLegalMoves() && piece.isLegal() (also subclass
% implementations of this too like the pawn)

b = board();

p3 = b.BoardMatrix{2,7}; % a black pawn
p3PossibleMoves = p3.generatePossibleMoves();
% disp(p3PossibleMoves);
p3LegalMoves = p3.generateLegalMoves(b);
% Expected: 2 legal moves for this pawn off its starting square at the
% start of the game, Actual: 2 legal moves
disp(p3LegalMoves);

q2 = b.BoardMatrix{1,4}; % the black queen
q2PossibleMoves = q2.generatePossibleMoves();
% disp(q2PossibleMoves);
q2LegalMoves = q2.generateLegalMoves(b);
% Expected: 0 legal moves for the queen (stuck behind a wall of pawns and
% surrounded by the king and a bishop), Actual: 0 legal moves
disp(q2LegalMoves);