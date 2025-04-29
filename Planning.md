***This document contains my thoughts for the project:***

*This includes:*
- The overall plan for the project
- What object methods and general functions I may need to write so I can simplify my code
- Problems I encounter and what solutions I develop

---

**Overall Plan**

- The plan is to create two-player chess in MATLAB.
- There will be a GUI created by stitching images together.
- Players will be able to make moves by entering Chess notation into the command line (e.g. e4, Nf4), however, this could be difficult to implement if multiple pieces could move to the same position (two horses move to the same position. The notation becomes much more complex). Alternatively, I could allow the user to use the GUI to make moves, however I have no idea how to do this.
- I want to implement all the rules of Chess as best as I can, except for en-passant. This may prove difficult.

**Classes and methods required:**

1. **Game Class**
    - Contains the core logic for the game
    - isGameOver() method
2. **Board Class**
    - Contains the logic for the board
    - displayBoard() method
    - movePiece() method
    - isStalemate() method
    - isCheck() method
    - if isCheck() == true, call isCheckmate() method
3. **Piece Class**
    - All other piece classes (Pawn, Knight, Bishop, Rook, Queen, King) will inherit from this class.
    - Defines methods which are overridden by child classes
    - All child classes will have properties that declare how they can move

**Problems Encountered So Far**

- I didn't realise how difficult this would be without OOP. I need to learn to use MATLAB OOP. Solution: https://matlabacademy.mathworks.com/details/object-oriented-programming-onramp/oroop. Since I already know Python OOP, and a bit of JS and C++ OOP, learning new syntax shouldn't be too difficult. I need a Game object, Board object, and a Piece Object which all other pieces can inherit from.