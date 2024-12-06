# Sudoku in Assembly

## Project Overview
This project is a Sudoku game coded entirely in assembly language. It is designed to run on DOSBox and provides an interactive experience with various features to enhance gameplay. The game includes options for hints, notes, undo functionality, scoring, and even an easter egg for players to discover.

---

## Features

### **1. Hints**
- Players can request up to **4 hints** during the game.
- To use a hint:
  1. Move the cursor to the desired cell where you need assistance.
  2. Press **`H`**.
  3. The correct number for the selected cell will appear.
- **Scoring Impact:** Each hint deducts **5 points** from the score.

### **2. Notes**
- Players can add notes (numbers 1-9) to cells for planning their moves.
- To use notes:
  - **Enable Notes:** Press **`N`** to activate note-taking mode.
  - **Disable Notes:** Press **`N`** again to confirm input and switch back to normal mode.
- Notes can be updated or removed as needed.

### **3. Undo Functionality**
- Players can undo their actions:
  - **Undo a Mistake:** Press **`U`** to reverse the last confirmed input.
  - **Undo Notes:** If multiple notes are added (e.g., 1, 2, 3), pressing **`U`** will remove the most recent one (e.g., 3 will be removed).

### **4. Scoring System**
- Earn **+10 points** for every correct answer.
- Lose **-8 points** for every mistake.
- Lose **-5 points** for every hint used.

### **5. Easter Egg**
- Discover a surprise winner screen:
  - Press **`I`** to activate the winner screen at any time.

### **6. Quit Option**
- To exit the game, press **`Q`** at any time.

---

## Gameplay Instructions
1. **Start the Game:** Launch the game in DOSBox.
2. **Navigate:** Use the arrow keys to move the cursor across the Sudoku grid. Users can navigate through the board using the arrow keys.
3. **Input Numbers:** Enter numbers directly to fill the cells.
4. **Use Features:**
   - **Hints:** Press `H` while on the desired cell.
   - **Notes:** Toggle notes with `N` to add temporary numbers.
   - **Undo:** Press `U` to undo mistakes or remove notes.
   - **Easter Egg:** Press `I` to trigger the winner screen.
   - **Quit:** Press `Q` to quit the game.
5. **Score:** Aim to solve the Sudoku puzzle while maintaining a high score.

---

## Technical Details
- **Language:** Assembly
- **Platform:** DOSBox
- **Controls:**
  - Arrow keys for navigation
  - `H`, `N`, `U`, `I`, and `Q` for features

---

## Notes
- The game enforces a limit of **4 hints** to maintain a balance between gameplay challenge and assistance.
- Players are encouraged to use notes strategically and avoid excessive reliance on hints to maximize their score.
- The easter egg is a fun, hidden feature intended to surprise and delight players.

---

Enjoy solving Sudoku with this assembly-coded masterpiece! Feedback and suggestions are welcome.

