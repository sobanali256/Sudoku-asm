[org 0x0100]

jmp start

;====================Variables for Game=========================;

header: db '-- Sudoku --', 0
	first_row db '____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____ ____', 0
    second_row db '\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\\___\', 0

	; Options for Home Page :

	opt11: db 'Play', 0
	opt12: db 'Help', 0
	opt13: db 'Quit', 0

	; Option for Play Page :

	opt21: db 'Easy', 0
	opt22: db 'Medium', 0
	opt23: db 'Hard', 0
	opt24: db 'Back', 0

	; Options for Help Page :

	opt31: db 'Hints', 0
	opt32: db 'Theme', 0
	opt33: db 'Audio', 0
	opt34: db 'Close', 0

	; Additional Sub-Option :

	opt41: db 'Disable', 0
	opt42: db 'Enable ', 0
	opt43: db 'Dark   ', 0
	opt44: db 'Light  ', 0
	opt45: db 'Disable', 0
	opt46: db 'Enable ', 0

	; Choices for Home Page :
	selectedopt1: db 0
	; Choices for Play Page :
	selectedopt2: db 0
	; Choices for Help Page :
	selectedopt3: db 0
	; Choices for Sub Menus :
	selectedopt4: db 0
	selectedopt5: db 0	
	selectedopt6: db 0
	
	; Extra Labels for func :
	currentHints: db 0
	currentTheme: db 0
	currentAudio: db 0
	
	boxBoundary: db '++===++';
	optionBoundary: db '+----+';
	optionDivider: db "|"
	noteText: db 'Note';
	quitText: db 'Quit';
	hintText: db 'Hint';
	undoText: db 'Undo';
	String1: db 'Score   :', 0
	String2: db 'Mistakes:', 0
	Text: db '   ', 0;
	
	gameWinMessage: db 'Congratulations, You Have Won the Game', 0
	gameLossMessage: db 'Alas, You have Lost. Better luck next time', 0
	gameCloseMessage: db 'You are Leaving, Thanks for playing', 0


;=====================SUDOKU BOARD FILLING======================;

	Easy1: db 6, 8, 0, 0, 0, 5, 4, 3, 1
           db 0, 0, 7, 9, 0, 4, 2, 6, 5
           db 4, 0, 5, 1, 0, 0, 0, 7, 9
           db 2, 5, 8, 4, 0, 0, 0, 9, 3
           db 0, 0, 0, 0, 9, 0, 1, 0, 4
           db 0, 0, 0, 8, 6, 3, 0, 0, 7
           db 7, 1, 3, 0, 0, 0, 9, 4, 0
           db 0, 9, 0, 6, 0, 0, 0, 0, 8
           db 8, 0, 0, 0, 0, 0, 7, 0, 2

	solEasy1: db 6, 8, 9, 7, 2, 5, 4, 3, 1
              db 1, 3, 7, 9, 8, 4, 2, 6, 5
              db 4, 2, 5, 1, 3, 6, 8, 7, 9
              db 2, 5, 8, 4, 7, 1, 6, 9, 3
              db 3, 7, 6, 5, 9, 2, 1, 8, 4
              db 9, 4, 1, 8, 6, 3, 5, 2, 7
              db 7, 1, 3, 2, 5, 8, 9, 4, 6
              db 5, 9, 2, 6, 4, 7, 3, 1, 8
              db 8, 6, 4, 3, 1, 9, 7, 5, 2
			  
	Easy2: db 2, 0, 0, 8, 1, 0, 4, 0, 0
           db 7, 4, 6, 5, 2, 3, 9, 0, 8
           db 0, 0, 0, 4, 0, 6, 0, 0, 0
           db 0, 6, 7, 3, 0, 0, 0, 0, 1
           db 0, 2, 4, 6, 0, 1, 0, 0, 5
           db 0, 0, 1, 7, 4, 2, 0, 0, 3
           db 4, 8, 0, 0, 0, 7, 0, 2, 0
           db 0, 1, 0, 2, 6, 0, 8, 7, 0
           db 6, 7, 2, 0, 3, 8, 1, 0, 0
	       
	solEasy2: db 2, 3, 5, 8, 1, 9, 4, 6, 7
              db 7, 4, 6, 5, 2, 3, 9, 1, 8
              db 1, 9, 8, 4, 7, 6, 5, 3, 2
              db 8, 6, 7, 3, 9, 5, 2, 4, 1
              db 3, 2, 4, 6, 8, 1, 7, 9, 5
              db 9, 5, 1, 7, 4, 2, 6, 8, 3
              db 4, 8, 9, 1, 5, 7, 3, 2, 6
              db 5, 1, 3, 2, 6, 4, 8, 7, 9
              db 6, 7, 2, 9, 3, 8, 1, 5, 4
	
	Easy3: db 3, 0, 0, 0, 6, 5, 7, 2, 9
           db 0, 5, 0, 0, 0, 8, 0, 0, 3
           db 9, 0, 1, 3, 0, 0, 0, 0, 4
           db 0, 7, 0, 0, 1, 3, 4, 0, 0
           db 2, 1, 6, 0, 5, 4, 9, 3, 0
           db 0, 0, 0, 0, 8, 0, 1, 5, 7
           db 6, 0, 5, 2, 0, 9, 8, 0, 1
           db 0, 4, 7, 8, 0, 0, 2, 9, 5
           db 0, 0, 9, 0, 4, 1, 3, 7, 6
		  
	solEasy3: db 3, 8, 4, 1, 6, 5, 7, 2, 9
              db 7, 5, 2, 4, 9, 8, 6, 1, 3
              db 9, 6, 1, 3, 2, 7, 5, 8, 4
              db 5, 7, 8, 9, 1, 3, 4, 6, 2
              db 2, 1, 6, 7, 5, 4, 9, 3, 8
              db 4, 9, 3, 6, 8, 2, 1, 5, 7
              db 6, 3, 5, 2, 7, 9, 8, 4, 1
              db 1, 4, 7, 8, 3, 6, 2, 9, 5
              db 8, 2, 9, 5, 4, 1, 3, 7, 6
			  
	Easy4: db 6, 8, 0, 0, 0, 5, 9, 0, 7
              db 7, 0, 4, 0, 1, 0, 2, 8, 3
              db 0, 1, 0, 7, 0, 3, 5, 0, 6
              db 3, 6, 0, 0, 5, 2, 0, 0, 8
              db 0, 9, 0, 1, 0, 7, 0, 2, 4
              db 2, 0, 0, 3, 9, 0, 6, 0, 1
              db 0, 2, 8, 0, 0, 9, 0, 7, 5
              db 4, 0, 0, 5, 2, 0, 8, 3, 9
              db 5, 0, 0, 8, 0, 0, 1, 0, 2
			  
	solEasy4: db 6, 8, 3, 2, 4, 5, 9, 1, 7
              db 7, 5, 4, 9, 1, 6, 2, 8, 3
              db 9, 1, 2, 7, 8, 3, 5, 4, 6
              db 3, 6, 1, 4, 5, 2, 7, 9, 8
              db 8, 9, 5, 1, 6, 7, 3, 2, 4
              db 2, 4, 7, 3, 9, 8, 6, 5, 1
              db 1, 2, 8, 6, 3, 9, 4, 7, 5
              db 4, 7, 6, 5, 2, 1, 8, 3, 9
              db 5, 3, 9, 8, 7, 4, 1, 6, 2
	
	Easy5: db 9, 6, 7, 5, 0, 1, 2, 0, 0
		   db 8, 0, 5, 9, 0, 6, 0, 0, 7
		   db 3, 0, 4, 8, 7, 0, 6, 5, 9
		   db 1, 5, 6, 0, 9, 4, 0, 8, 3
		   db 7, 0, 9, 1, 5, 0, 4, 0, 2
		   db 4, 0, 2, 7, 6, 8, 0, 1, 5
		   db 6, 9, 0, 4, 0, 5, 8, 7, 1
		   db 2, 4, 0, 3, 1, 7, 5, 9, 6
		   db 5, 7, 1, 6, 8, 9, 3, 2, 0

	
	solEasy5: db 9, 6, 7, 5, 3, 1, 2, 4, 8
              db 8, 2, 5, 9, 4, 6, 1, 3, 7
              db 3, 1, 4, 8, 7, 2, 6, 5, 9
              db 1, 5, 6, 2, 9, 4, 7, 8, 3
              db 7, 8, 9, 1, 5, 3, 4, 6, 2
              db 4, 3, 2, 7, 6, 8, 9, 1, 5
              db 6, 9, 3, 4, 2, 5, 8, 7, 1
              db 2, 4, 8, 3, 1, 7, 5, 9, 6
              db 5, 7, 1, 6, 8, 9, 3, 2, 4
	Medium1: db 6, 0, 0, 8, 0, 7, 0, 0, 1
			 db 1, 0, 0, 5, 0, 6, 7, 0, 4
			 db 0, 0, 7, 0, 2, 0, 0, 3, 0
			 db 9, 0, 4, 6, 0, 3, 0, 0, 7
			 db 0, 0, 1, 0, 5, 9, 6, 0, 0
			 db 3, 6, 5, 0, 1, 4, 0, 2, 0
			 db 0, 1, 9, 0, 0, 8, 4, 0, 2
			 db 0, 0, 8, 1, 9, 2, 0, 6, 5
			 db 2, 3, 0, 4, 7, 0, 9, 1, 0

	solMedium1: db 6, 5, 3, 8, 4, 7, 2, 9, 1
              db 1, 9, 2, 5, 3, 6, 7, 8, 4
              db 8, 4, 7, 9, 2, 1, 5, 3, 6
              db 9, 2, 4, 6, 8, 3, 1, 5, 7
              db 7, 8, 1, 2, 5, 9, 6, 4, 3
              db 3, 6, 5, 7, 1, 4, 8, 2, 9
              db 5, 1, 9, 3, 6, 8, 4, 7, 2
              db 4, 7, 8, 1, 9, 2, 3, 6, 5
              db 2, 3, 6, 4, 7, 5, 9, 1, 8
			  
	Medium2: db 8, 0, 0, 2, 0, 7, 9, 0, 1
			 db 2, 0, 9, 3, 0, 4, 0, 7, 5
			 db 5, 4, 0, 1, 9, 0, 2, 6, 0
			 db 4, 0, 5, 6, 0, 1, 0, 2, 9
			 db 9, 6, 2, 5, 7, 3, 4, 0, 8
			 db 3, 0, 1, 4, 0, 9, 6, 0, 7
			 db 6, 0, 8, 9, 1, 0, 7, 0, 4
			 db 1, 9, 0, 7, 4, 6, 5, 0, 2
			 db 7, 5, 4, 0, 3, 2, 1, 9, 0

	solMedium2: db 8, 3, 6, 2, 5, 7, 9, 4, 1
              db 2, 1, 9, 3, 6, 4, 8, 7, 5
              db 5, 4, 7, 1, 9, 8, 2, 6, 3
              db 4, 7, 5, 6, 8, 1, 3, 2, 9
              db 9, 6, 2, 5, 7, 3, 4, 1, 8
              db 3, 8, 1, 4, 2, 9, 6, 5, 7
              db 6, 2, 8, 9, 1, 5, 7, 3, 4
              db 1, 9, 3, 7, 4, 6, 5, 8, 2
              db 7, 5, 4, 8, 3, 2, 1, 9, 6

	Medium3: db 7, 0, 0, 0, 0, 2, 0, 0, 0
			 db 0, 0, 0, 0, 0, 0, 0, 0, 9
			 db 0, 0, 0, 0, 9, 0, 0, 0, 7
			 db 0, 0, 6, 0, 1, 4, 0, 0, 3
			 db 4, 3, 2, 0, 5, 8, 0, 0, 0
			 db 1, 0, 7, 0, 0, 0, 9, 0, 4
			 db 0, 1, 0, 0, 0, 0, 4, 0, 6
			 db 0, 7, 0, 0, 0, 9, 0, 1, 8
			 db 8, 0, 0, 0, 0, 6, 3, 7, 2

	solMedium3: db 7, 6, 9, 4, 8, 2, 1, 3, 5
              db 5, 4, 1, 6, 3, 7, 8, 2, 9
              db 3, 2, 8, 5, 9, 1, 6, 4, 7
              db 9, 8, 6, 7, 1, 4, 2, 5, 3
              db 4, 3, 2, 9, 5, 8, 7, 6, 1
              db 1, 5, 7, 2, 6, 3, 9, 8, 4
              db 2, 1, 3, 8, 7, 5, 4, 9, 6
              db 6, 7, 4, 3, 2, 9, 5, 1, 8
              db 8, 9, 5, 1, 4, 6, 3, 7, 2
			  
	Medium4: db 4, 0, 0, 9, 0, 3, 0, 0, 0
			 db 0, 3, 0, 6, 0, 0, 2, 0, 4
			 db 2, 0, 1, 0, 5, 8, 9, 0, 0
			 db 5, 8, 0, 7, 4, 9, 0, 1, 6
			 db 1, 6, 0, 3, 8, 0, 4, 0, 5
			 db 3, 9, 4, 1, 0, 5, 7, 0, 2
			 db 0, 1, 9, 5, 3, 4, 6, 2, 7
			 db 7, 2, 3, 8, 9, 6, 5, 0, 1
			 db 6, 0, 5, 0, 7, 1, 8, 3, 9

			  
	solMedium4: db 4, 5, 6, 9, 2, 3, 1, 7, 8
              db 9, 3, 8, 6, 1, 7, 2, 5, 4
              db 2, 7, 1, 4, 5, 8, 9, 6, 3
              db 5, 8, 2, 7, 4, 9, 3, 1, 6
              db 1, 6, 7, 3, 8, 2, 4, 9, 5
              db 3, 9, 4, 1, 6, 5, 7, 8, 2
              db 8, 1, 9, 5, 3, 4, 6, 2, 7
              db 7, 2, 3, 8, 9, 6, 5, 4, 1
              db 6, 4, 5, 2, 7, 1, 8, 3, 9
			  
			  
	Medium5: db 3, 1, 0, 2, 0, 9, 0, 7, 4
             db 7, 0, 2, 6, 0, 4, 3, 0, 9
             db 5, 0, 9, 7, 3, 1, 0, 2, 0
             db 6, 0, 1, 9, 2, 3, 4, 5, 0
             db 2, 0, 5, 4, 7, 8, 0, 0, 1
             db 8, 3, 4, 5, 0, 6, 2, 9, 0
             db 1, 2, 0, 8, 4, 7, 9, 6, 5
             db 4, 6, 7, 3, 9, 5, 1, 0, 0
             db 9, 5, 0, 1, 6, 2, 0, 4, 3
			 
	solMedium5: db 3, 1, 6, 2, 8, 9, 5, 7, 4
                  db 7, 8, 2, 6, 5, 4, 3, 1, 9
                  db 5, 4, 9, 7, 3, 1, 8, 2, 6
                  db 6, 7, 1, 9, 2, 3, 4, 5, 8
                  db 2, 9, 5, 4, 7, 8, 6, 3, 1
                  db 8, 3, 4, 5, 1, 6, 2, 9, 7
                  db 1, 2, 3, 8, 4, 7, 9, 6, 5
                  db 4, 6, 7, 3, 9, 5, 1, 8, 2
                  db 9, 5, 8, 1, 6, 2, 7, 4, 3
				
	Hard1: db 0, 0, 0, 9, 0, 6, 2, 0, 0
           db 7, 0, 0, 3, 0, 0, 0, 6, 0
           db 0, 0, 9, 0, 0, 8, 0, 0, 5
           db 1, 0, 0, 6, 0, 7, 0, 9, 0
           db 0, 8, 3, 0, 0, 5, 0, 0, 0
           db 6, 5, 7, 0, 9, 0, 0, 8, 0
           db 4, 0, 0, 8, 0, 1, 0, 5, 0
           db 5, 0, 6, 7, 0, 9, 8, 0, 0
           db 0, 0, 0, 5, 0, 4, 0, 2, 7
				
    solHard1: db 3, 4, 5, 9, 7, 6, 2, 1, 8
                  db 7, 1, 8, 3, 5, 2, 4, 6, 9
                  db 2, 6, 9, 1, 4, 8, 7, 3, 5
                  db 1, 2, 4, 6, 8, 7, 5, 9, 3
                  db 9, 8, 3, 2, 1, 5, 6, 7, 4
                  db 6, 5, 7, 4, 9, 3, 1, 8, 2
                  db 4, 7, 2, 8, 3, 1, 9, 5, 6
                  db 5, 3, 6, 7, 2, 9, 8, 4, 1
                  db 8, 9, 1, 5, 6, 4, 3, 2, 7
	Hard2: db 0, 0, 0, 8, 0, 0, 0, 5, 0
                  db 8, 0, 0, 3, 0, 5, 0, 7, 0
                  db 0, 0, 7, 1, 0, 0, 6, 0, 9
                  db 4, 0, 3, 5, 0, 1, 9, 0, 8
                  db 7, 0, 0, 6, 0, 9, 4, 0, 0
                  db 5, 0, 9, 0, 0, 2, 0, 6, 1
                  db 1, 7, 0, 2, 4, 0, 3, 9, 0
                  db 0, 3, 0, 9, 5, 6, 0, 1, 0
                  db 6, 9, 0, 0, 1, 0, 5, 4, 0

	
	solHard2: db 9, 9, 1, 8, 6, 7, 2, 5, 3
                  db 8, 2, 6, 3, 9, 5, 1, 7, 4
                  db 3, 5, 7, 1, 2, 4, 6, 8, 9
                  db 4, 6, 3, 5, 7, 1, 9, 2, 8
                  db 7, 1, 2, 6, 8, 9, 4, 3, 5
                  db 5, 8, 9, 4, 3, 2, 7, 6, 1
                  db 1, 7, 5, 2, 4, 8, 3, 9, 6
                  db 2, 3, 4, 9, 5, 6, 8, 1, 7
                  db 6, 9, 8, 7, 1, 3, 5, 4, 2
	
	Hard3: db 0, 0, 8, 0, 0, 3, 9, 0, 0
              db 0, 7, 0, 0, 4, 0, 3, 0, 0
              db 3, 0, 1, 0, 9, 0, 8, 0, 2
              db 4, 0, 5, 0, 0, 6, 7, 0, 0
              db 0, 8, 6, 0, 0, 4, 0, 9, 0
              db 1, 0, 2, 0, 0, 9, 4, 0, 0
              db 6, 1, 3, 0, 8, 2, 5, 0, 9
              db 9, 0, 0, 3, 6, 0, 2, 8, 0
              db 8, 0, 7, 0, 0, 1, 0, 3, 0
			  
	solHard3: db 2, 4, 8, 6, 1, 3, 9, 5, 7
              db 5, 7, 9, 2, 4, 8, 3, 1, 6
              db 3, 6, 1, 7, 9, 5, 8, 4, 2
              db 4, 9, 5, 1, 3, 6, 7, 2, 8
              db 7, 8, 6, 5, 2, 4, 1, 9, 3
              db 1, 3, 2, 8, 7, 9, 4, 6, 5
              db 6, 1, 3, 4, 8, 2, 5, 7, 9
              db 9, 5, 4, 3, 6, 7, 2, 8, 1
              db 8, 2, 7, 9, 5, 1, 6, 3, 4
			  
	Hard4: db 5, 0, 0, 6, 0, 2, 0, 0, 1
              db 0, 0, 9, 0, 8, 0, 7, 0, 0
              db 3, 0, 0, 0, 4, 0, 0, 9, 0
              db 4, 0, 0, 1, 0, 6, 0, 7, 0
              db 0, 9, 0, 0, 7, 0, 1, 5, 0
              db 6, 0, 1, 9, 0, 0, 2, 0, 4
              db 1, 3, 0, 0, 2, 7, 0, 6, 0
              db 9, 0, 0, 0, 0, 0, 0, 2, 7
              db 0, 5, 2, 0, 6, 0, 8, 0, 3

	solHard4: db 5, 4, 7, 6, 9, 2, 3, 8, 1
              db 2, 6, 9, 3, 8, 1, 7, 4, 5
              db 3, 1, 8, 7, 4, 5, 6, 9, 2
              db 4, 2, 5, 1, 3, 6, 9, 7, 8
              db 8, 9, 3, 2, 7, 4, 1, 5, 6
              db 6, 7, 1, 9, 5, 8, 2, 3, 4
              db 1, 3, 4, 8, 2, 7, 5, 6, 9
              db 9, 8, 6, 5, 1, 3, 4, 2, 7
              db 7, 5, 2, 4, 6, 9, 8, 1, 3
	
	Hard5: db 6, 0, 0, 9, 0, 8, 2, 0, 4
              db 0, 9, 7, 0, 5, 0, 8, 6, 0
              db 0, 0, 4, 7, 0, 6, 3, 0, 9
              db 5, 0, 9, 0, 8, 1, 4, 0, 7
              db 0, 4, 0, 6, 2, 5, 1, 9, 0
              db 2, 1, 8, 4, 7, 9, 5, 3, 6
              db 1, 0, 0, 5, 0, 2, 0, 4, 0
              db 4, 0, 2, 1, 0, 0, 9, 8, 0
              db 0, 0, 0, 0, 0, 0, 6, 1, 0

	solHard5: db 6, 5, 1, 9, 3, 8, 2, 7, 4
              db 3, 9, 7, 2, 5, 4, 8, 6, 1
              db 8, 2, 4, 7, 1, 6, 3, 5, 9
              db 5, 6, 9, 3, 8, 1, 4, 9, 7
              db 7, 4, 3, 6, 2, 5, 1, 9, 8
              db 2, 1, 8, 4, 7, 9, 5, 3, 6
              db 1, 8, 6, 5, 9, 2, 7, 4, 3
              db 4, 7, 2, 1, 6, 3, 9, 8, 5
              db 9, 3, 5, 8, 4, 7, 6, 1, 2

;=====================BOARD DESIGN==============================;
boundary: db '++===+===+===++===+===+===++===+===+===++' ;length = 41
spacer: db   '||-----------||-----------||-----------||' ;length = 41
divider: db '||' ;legnth = 2
rowSpace: db '   |   |   ' ;length = 11

;VARIABLES FOR RANDOM GENERATOR
seed: dw 0
result: db 0

curBoardPlayed: dw 0
curBoardSol: dw 0

completionColor: db 0x4e
;BOARD DETAILS
;ON EACH PAGE BOARD STARTS FROM 0X0002 LOCATION THAT IS 0 ROW 2 COLUMN (COUNTING FROM 0)
;9 COLUMN AND 2 ROW IS WHERE THE FINALISED NUMBER SHOULD COME

;CURSOR LOWEST COLUMN LOCATION IS 5 AND MAX COLUMN LOCATION IS 39
;WITH A BOX JUMP OF 4 COLUMNS AND IF BOX IS CHANGING THEN A JUMP OF 5 COLUMNS IS REQUIRED
;IN ORDER TO CHECK HOW MANY COLUMNS TO JUMP WE CAN TAKE CURRENT COLUMN MOD 13 IF MOD = 0 THEN JUMP 5
;COLUMN IS 39 THEN RESET IT TO 5

;===================BOARD ACCESSORIES============================;

timerTag: db 'Time:' ;length = 5
countMS: dw 0
countSecond: dw 0
countMin: dw 0

printHelper: db ' '
validity: db 1 ; 0 = invalid, 1 = valid

;WHAT UNDO STORES
; 0 = noteSelected, 2 = ROW (DH), 4 = COL (DL), 6 = CHANGE IN SCORE, 8 = current page
undoSpace: times 256*8  dw 0; 
currentUndoPtr: dw 0
;================================================================;

curPage:  db 0
playerScore: dw 0
mistakes: db 0
hintCount: db 4
remainingEntries: db 81

noteSelected: db 0 ;0 = notes are off, 1 = notes are on
nextNoteCol: db 0x8e 
stopTimer: dw 0
;================================================================;

; Subroutine: LCG to generate a pseudo-random number
generate_random:
    mov ax, [seed]   ; Load the current seed
    mov bx, 1103515245
    imul bx          ; Multiply seed by 'a' (result in DX:AX)
    add ax, 12345    ; Add constant 'c'
    mov [seed], ax   ; Update seed with the new value

    ; Scale to range 1-9
    mov bx, 5        ; Upper rangeHello how are you what's up hello hello hello hello Hello how are you 
    xor dx, dx       ; Clear DX for division
    div bx           ; AX = AX / BX, remainder in DX
    add dl, 1        ; Shift range from 0-8 to 1-9
    mov [result], dl ; Store result
    ret

; Subroutine: Initialize seed dynamically using timer ticks
init_seed:
	pusha
    mov ah, 00h       ; Get system timer ticks
    int 1Ah           ; Call BIOS interrupt
    mov [seed], dx    ; Use the timer ticks as the seed
	popa
    ret

;================================================================;

printnum: 
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx

		mov ax, 0xb800
		mov es, ax ; point es to video base
		mov ax, [countMin] ; load number in ax
		mov bx, 10 ; use base 10 for division
		mov cx, 0 ; initialize count of digits
		
nextdigit: 
		
		mov dx, 0 ; zero upper half of dividend
		div bx ; divide by 10
		add dl, 0x30 ; convert digit into ascii value
		push dx ; save ascii value on stack
		inc cx ; increment count of values
		cmp ax, 0 ; is the quotient zero
		jnz nextdigit ; if no divide it again
		
		;==================================================;
		
		;CHECKING ON WHICH PAGE TO PRINT THE TIMER
		cmp byte [curPage], 1
		jne curPageIs0
		
		mov di, 4378
		
		jmp nextpos

curPageIs0:		
		mov di, 282; 
		
		;==================================================;
		
nextpos: 
		pop dx ; remove a digit from the stack
		
		cmp byte [currentTheme], 0
		je tDark1
		mov dh, 0x70 ; use normal attribute
		jmp Tprint1
tDark1:
		mov dh, 0x0f ; use normal attribute

Tprint1:
		mov [es:di], dx ; print char on screen
		add di, 2 ; move to next screen location
		loop nextpos ; repeat for all digits on stack
	
		mov byte [es:di], ':'
		mov byte [es:di + 1], dh
		add di, 2
		
		mov ax, [countSecond] ; load number in ax
		mov bx, 10 ; use base 10 for division
		mov cx, 0 ; initialize count of digits
		
		
nextdigit1: 
		
		mov dx, 0 ; zero upper half of dividend
		div bx ; divide by 10
		add dl, 0x30 ; convert digit into ascii value
		push dx ; save ascii value on stack
		inc cx ; increment count of values
		cmp ax, 0 ; is the quotient zero
		jnz nextdigit1 ; if no divide it again
		
		cmp cx, 1
		jne nextpos1
		
		mov byte [es:di], '0'
			
		cmp byte [currentTheme], 0
		je tDarkcolon
		mov byte [es:di + 1], 0x70 ; use normal attribute
		jmp nextpos1
tDarkcolon:
		mov byte [es:di + 1], 0x0f ; use normal attribute
		
		add di, 2
		
nextpos1: 
		pop dx ; remove a digit from the stack
		
		cmp byte [currentTheme], 0
		je tDark2
		mov dh, 0x70 ; use normal attribute
		jmp Tprint2
tDark2:
		mov dh, 0x0f ; use normal attribute

Tprint2:
	
		mov [es:di], dx ; print char on screen
		add di, 2 ; move to next screen location
		loop nextpos1 ; repeat for all digits on stack
		

	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 

; timer interrupt service routine
timer: 
	push di
	push ax
	
	cmp word [stopTimer], 1
	je endTimer
	
	add word [countMS], 55
	
	cmp word[countMS], 1000
	jb endTimer
	
	mov word [countMS], 0
	inc word[countSecond]
	
	cmp word[countSecond], 60
	jb printSecond
	
	mov word [countSecond], 0
	inc word [countMin]
	
	
printSecond:	
	
	call printnum ; print tick count
	
endTimer:
	mov al, 0x20
	out 0x20, al ; end of interrupt
	pop ax
	pop di
	iret

;====================================================================;


;====================================================================;
printDivider:
	push ax
	push bx 
	push cx
	push es
	push bp
	
	cmp byte [currentTheme], 0
	jne printDividerLight
	mov bl, 1101b ; normal attrib
	jmp PD_print
	
printDividerLight:	
	mov bl, 0111_1011b ; normal attrib
	
PD_print:

	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 1101b
	mov cx, 2 ; length of string
	push cs
	pop es ; segment of string
	mov bp, divider ; offset of string
	int 0x10
	
	add dl, 2
	
	pop bp
	pop es
	pop cx
	pop bx
	pop ax
	ret
;====================================================================;

printRowSpace:
	push ax
	push bx 
	push cx
	push es
	push bp
	 
	cmp byte [currentTheme], 0
	jne printRowLight
	mov bl, 1101b ; normal attrib
	jmp PR_print
	
printRowLight:	
	mov bl, 0111_0000b ; normal attrib
	
PR_print:
	 
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	mov cx, 11 ; length of string
	push cs
	pop es ; segment of string
	mov bp, rowSpace ; offset of string
	int 0x10
	
	add dl, 11
	
	pop bp
	pop es
	pop cx
	pop bx
	pop ax
	ret
;====================================================================;

printSpacer:
	push ax
	push bx 
	push cx
	push es
	push bp
	
	cmp byte [currentTheme], 0
	jne printSpacerLight
	mov bl, 1101b ; normal attrib
	jmp PS_print
	
printSpacerLight:	
	mov bl, 0111_1011b ; normal attrib
PS_print:
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 1101b ; normal attrib
	mov cx, 41 ; length of string
	push cs
	pop es ; segment of string
	mov bp, spacer ; offset of string
	int 0x10
	
	inc dh
	
	pop bp
	pop es
	pop cx
	pop bx
	pop ax
	ret

;====================================================================;

printBounderies:
	push ax
	push bx 
	push cx
	push es
	push bp

	cmp byte [currentTheme], 0
	jne printBoundaryLight
	mov bl, 1101b ; normal attrib
	jmp PB_print
	
printBoundaryLight:	
	mov bl, 0111_1011b ; normal attrib
PB_print:
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 1101b ; normal attrib
	mov cx, 41 ; length of string
	push cs
	pop es ; segment of string
	mov bp, boundary ; offset of string
	int 0x10
	
	add dh, 1
	
	pop bp
	pop es
	pop cx
	pop bx
	pop ax
	ret
;====================================================================;
printingRows:
	push ax
	push bx 
	push cx
	push es
	push bp

	mov bh, 3
	mov bl, 3
	mov cx, 3
	mov al, 2
	
printAgain:
	call printDivider
	call printRowSpace
	dec bl
	
	;Checking one row is completely printed or not
	cmp bl, 0
	jne printAgain
	
	call printDivider
	
	dec bh
	inc dh
	
	;reset column location for the new row
	
	mov dl, 0x02
	mov bl, 3
	
	;Checking if 3 rows are printed or not (these are not 3 sudoko rows rather 1 sudoko row occupied 3 rows on screen
	cmp bh, 0
	jne printAgain
	
	mov bh, 3
	
	cmp al, 0
	je noSpace
	
	call printSpacer
	
	dec al
	
noSpace:
	loop printAgain
	

	pop bp
	pop es
	pop cx
	pop bx
	pop ax
	ret
;====================================================================;


initialiseTheBoard:
	pusha
	
	mov ax, 0xb800
	mov es, ax ;video mode set
	
	
	;mov ax, [curBoardPlayed]
	;mov es, ax
	
	xor ax, ax
	
	;first 6 rows are on page 0
	
	mov cx, 54 ;counter to print 6 rows
	mov dl, 3 ;after printing 3 numbers a jump of 5 is required else 4
	mov bl, 9 ;loop runs till 9 numbers then move to the next row
	
	mov dh, 0 ;keeps count if all rows are printed
	

	
	mov di, 322 ;initial location where first number is to be printed
	xor si, si ;indexing to get numbers from the array
	mov si, [curBoardPlayed]
	
sudokoNoPrint:		
	
	mov al, [si]
	
	inc si
	
	cmp al, 0
	je skipNumber
	
	dec byte [remainingEntries]
	
	add al, '0' ;convert to ascii
	mov ah, 0x4e
	
	cmp dl, 0
	jne takeJumpOf4
	
takeJumpOf5:
	add di, 10
	mov dl, 2
	mov [es:di], ax
	jmp loopSNP

takeJumpOf4:
	dec dl
	add di, 8
	mov [es:di], ax
	jmp loopSNP
	
skipNumber:
	
	cmp dl, 0
	jne skipJump4

skipJump5:
	mov dl, 2
	add di, 10
	jmp loopSNP

skipJump4:
	dec dl
	add di, 8
	jmp loopSNP
	
	
loopSNP:
	dec bl
	
	cmp bl, 0
	jne noChangeSNP
	
	sub di, 76
	add di, 640
	
	mov dl, 3
	mov bl, 9
	
noChangeSNP:
	loop sudokoNoPrint
	
	;LOCATION TO START PRINGTING FROM SECOND PAGE
	mov di, 4418
	
	mov cx, 25
	
	inc dh
	
	cmp dh, 2
	jb sudokoNoPrint
	
	popa
	ret


;====================================================================;
printTimerTag:
	push ax
	push bx 
	push cx
	push dx
	push es
	push bp

	cmp byte [currentTheme], 0
	je TimerTagDark
	
	mov bl, 0x70
	
	jmp nowPrintTag
TimerTagDark:
	mov bl, 15 ; normal attrib
	

nowPrintTag:	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 0 ; output on page 0
	
	mov dx, 0x0138 ; row 10 column 3
	mov cx, 5 ; length of string
	push cs
	pop es ; segment of string
	mov bp, timerTag ; offset of string
	int 0x10 ; call BIOS video service
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 1 ; output on page 0
	
	mov dx, 0x0138 ; row 10 column 3
	mov cx, 5 ; length of string
	push cs
	pop es ; segment of string
	mov bp, timerTag ; offset of string
	int 0x10 ; call BIOS video service
		
	pop bp
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	
	ret

;=================MAIN BOARD PRINT FUNCTIONS=========================;

printBoard:
	push ax
	push bx 
	push cx
	push dx
	push es
	push bp

	mov dx, 0x0002 ; row 10 column 3
	call printBounderies
	
	
	mov cx, 2
	
boardPrinting:
	call printingRows
	call printBounderies
	loop boardPrinting
	
	mov byte [curPage], 1
	mov dx, 0x0002 ; row 10 column 3
	call printNotesBox
	call printOptions
	call fillNotesBox2
	call printBounderies
	call printingRows
	call printBounderies
	call printDetails

	mov byte [curPage], 0
	call printDetails
	call printNotesBox
	call printOptions
	call fillNotesBox1
	
	pop bp
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	
	ret
	
;===============BOARD FUNCTION ENDS HERE=======================================;

;===============SUDOKO LOGIC STARTS HERE=======================================;
	
;______________________________________________________________________________;

updateCursorLocation:
	pusha
	mov ah, 2
    int 10h
	popa
	ret
;______________________________________________________________________________;

playGame:
	pusha
	
	;SET INITIAL CURSOR POSITION
	mov dh, 2
    mov dl, 5
    mov bh, 0
    mov ah, 2
    int 10h
	
infiniteLoop:
	mov ah, 0
	int 16h
	
	cmp ah, 0x4D
	je rightArrow
	
	cmp ah, 0x4B
	je leftArrow
	
	cmp ah, 0x48
	je upArrow
	
	cmp ah, 0x50
	je downArrow
	
	cmp al, 'n'
	je nKeyPressed
	
	cmp al, 'h'
	je hintPressed
	
	cmp al, 'u'
	je undoFunc
	
	cmp al, 'q'
	je endProg
	
	cmp al, 'i'
	je gameWin
	
	cmp al, 0x31
	jb infiniteLoop
	
	cmp al, 0x39
	ja infiniteLoop
	
	jmp numberKey
	
;~~~~~~~~~~~~~~~~~~~~~~~~~~~RIGHT KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
rightArrow:
	;get current cursor position
	mov ah, 03h
	int 10h
	
	cmp dl, 39
	jae resetRightArrow
	
	xor ax, ax
	
	mov al, dl
	mov bl, 13
	div bl
	
	cmp ah, 0
	je RAjmpBy5
	
RAjmpBy4:
	add dl, 4
	call updateCursorLocation
	jmp infiniteLoop
	
RAjmpBy5:
	add dl, 5
	call updateCursorLocation
	jmp infiniteLoop
	
resetRightArrow:
    mov dl, 5
    call updateCursorLocation
	jmp infiniteLoop
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~UNDO KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
undoFunc:
	
	push dx
	
		mov bx, [currentUndoPtr]
		shl bx, 4
		
		cmp bx, 0
		je infiniteLoop
		
		;SETTING DX
		mov ax, [undoSpace + bx + 2] ;GET ROW NO.
		mov dh, al
		
		mov ax, [undoSpace + bx + 4] ;GET COL NO.
		mov dl, al
		
	push bx
	
		mov ax, [undoSpace + bx + 8]	
		mov bh, al 
		
		mov ah, 2 ;POINTING CURSOR TO THE UNDO CELL LOCATION
		int 10h
		
		mov ah, 08h ;REA CHARACTER
		int 10h
	
	pop bx
	
		cmp ah, 0x4e
		je exitUF
		
		cmp ah, 0x5f
		je exitUF
		
		cmp word [undoSpace + bx], 1
		je undoNote
		
		dec byte [mistakes]
		call updateMistakeCount
			
	;--------------------------------------
	
	push bx
	
		mov ax, [undoSpace + bx + 2] ;GET ROW NO.
		mov dh, al
		
		mov ax, [undoSpace + bx + 4] ;GET COL NO.
		mov dl, al
		
		mov ax, [undoSpace + bx + 8]
		mov bh, al
		
		call clearBlockForNum
	
	pop bx
	
	;--------------------------------------
		
		mov ax, [undoSpace + bx + 6]
		mov [playerScore], ax
		
		push word [playerScore]
		call updatePlayerScore
		
		jmp exitUF

undoNote:
	
	push word [printHelper]
	
		mov ax, [undoSpace + bx + 8] ;Read Page Number
		mov bh, al
			
		mov al, ' '
		mov [printHelper], al
		
		mov ah, 0x13 ; service 13 - print string
		mov al, 1 ; subservice 01 – update cursor
		mov bl, 0x0d ; normal attrib
		mov cx, 1 ; length of string
		push cs
		pop es ; segment of string
		mov bp, printHelper ; offset of string
		int 0x10 ; call BIOS video service
		
	pop ax
		
		mov [printHelper], al
	
exitUF:
		
		dec word [currentUndoPtr]
	
	pop dx
	
		mov bh, [curPage]
		mov ah, 2
		int 10h
		
		jmp infiniteLoop

;~~~~~~~~~~~~~~~~~~~~~~~~~~~HINT KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

calcLocAndPrintHint:
	pusha

	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	je exitHint
	
	cmp ah, 0x5f
	je exitHint
	
	push dx
	
	dec byte [remainingEntries]
	
	sub word [playerScore], 4
	
	cmp word [playerScore], 0
	jg hintPrintScore  
	
	mov word [playerScore], 0
	
hintPrintScore:
	push word [playerScore]
	call updatePlayerScore
	
	xor ax, ax
	mov al, dh
	
	shr ax, 2
	
	mov bl, 9
	mul bl
	
	cmp bh, 1
	jne HintonDefaultPage
	
	add ax, 54

HintonDefaultPage:
		
	mov bx, [curBoardSol]
	
	cmp dl, 5
	je HintspecialCase5
	
	cmp dl, 39
	je HintspecialCase39
	
	
	mov di, ax ;copy row index in di
	
	push bx
	;Now calculate the column index
	mov al, dl
	mov bl, 5
	
	div bl
	
	pop bx
	
	xor ah, ah ;al holds the quotient and we only need that
	
	add di, ax
	
	pop dx
	
	push bx
	
	call clearBlockForNum
	
	mov bh, [curPage]
    mov ah, 2
    int 10h
	
	pop bx
	
	mov ah,09h
	mov al, [bx + di]
	add al, 0x30
	mov bl, 0x5f
	mov bh, [curPage]
	mov cx, 1
	int 10h
	
	jmp exitHint
	
HintspecialCase5:

	mov di, ax
	
	pop dx
	push bx
	
	call clearBlockForNum
	
	mov bh, [curPage]
    mov ah, 2
    int 10h
	
	pop bx
	
	mov ah,09h
	mov al, [bx + di]
	add al, 0x30
	mov bl, 0x5f
	mov bh, [curPage]
	mov cx, 1
	int 10h
	
	jmp exitHint
	
HintspecialCase39:
	mov di, ax

	pop dx
	push bx
	
	call clearBlockForNum
	
	mov bh, [curPage]
    mov ah, 2
    int 10h
	
	pop bx
	
	mov ah,09h
	mov al, [bx + di + 8]
	add al, 0x30
	mov bl, 0x5f
	mov bh, [curPage]
	mov cx, 1
	int 10h
	
exitHint:
	popa
	ret
	

hintPressed:
	
	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	je infiniteLoop
	
	cmp ah, 0x5f
	je infiniteLoop
	
	cmp byte [currentHints], 0
	je infiniteLoop 
	
	cmp byte [hintCount], 0
	jbe infiniteLoop
		
	cmp byte [hintCount], 4
	jne hintbelow4
	
	push ax
	push bx 
	push cx
	push dx  
	push word [printHelper]
	
	mov al, '3'
	mov [printHelper], al
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov dx, 0x083B
	mov bh, 0
	mov bl, 0x0e ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov dx, 0x083B
	mov bh, 1
	mov bl, 0x0e ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	
	pop ax
	
	mov [printHelper], al
	
	pop dx
	pop cx
	pop bx
	pop ax
	
	jmp displayPrint
	
hintbelow4:

	push ax
	push bx 
	push cx
	push dx  
	push word [printHelper]
	
	mov dx, 0x0837
	
	mov al, [hintCount]
	
	add dl, al
	
	inc dl
	
	mov byte [printHelper], ' '
	
	push ax
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 0
	mov bl, 0x0e ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	
	dec dl
	
	pop ax
	
	dec al
	
	add al, 0x30
		
	mov [printHelper], al
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 0
	mov bl, 0x0e ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 1
	mov bl, 0x0e ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	
	pop ax
	
	mov [printHelper], al
	
	pop dx
	pop cx
	pop bx
	pop ax
	
displayPrint:
	call calcLocAndPrintHint
	dec byte [hintCount]
	
	cmp byte [remainingEntries], 0
	je exitGameOver
	
	jmp infiniteLoop

;~~~~~~~~~~~~~~~~~~~~~~~~~~~LEFT KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
leftArrow:
	mov ah, 03h
	int 10h
	
	cmp dl, 5
	je resetLeftArrow

	xor ax, ax
	
	push dx
	
	sub dl, 5
	mov al, dl
	mov bl, 13
	div bl
	
	pop dx
	
	cmp ah, 0
	je LAjmpBy5

LAjmpby4:
	sub dl, 4
	call updateCursorLocation
	jmp infiniteLoop

LAjmpBy5:
	sub dl, 5
	call updateCursorLocation
	jmp infiniteLoop

resetLeftArrow:
	mov dl, 39
	call updateCursorLocation
	jmp infiniteLoop
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~UP KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
upArrow:
	mov ah, 03h
	int 10h
	
	cmp dh, 2 
	je row2CheckPage
	
UpKeyUpdateRow:
	sub dh, 4
	call updateCursorLocation
	jmp infiniteLoop
	
row2CheckPage:
	cmp bh, 0
	je UKswitchToPage2

UKswitchToPage1:
	mov word [curPage], 0
	mov  al, 00h   ; select display page 1
	mov  ah, 05h   ; function 05h: select active display page
	int  10h
	mov bh, 0
	mov dh, 22
	call updateCursorLocation
	jmp infiniteLoop

UKswitchToPage2:
	mov word [curPage], 1
	mov  al, 01h   ; select display page 1
	mov  ah, 05h   ; function 05h: select active display page
	int  10h
	mov bh, 1
	mov dh, 10
	call updateCursorLocation
	jmp infiniteLoop

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~DOWN KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

downArrow:
	mov ah, 03h
	int 10h
	
	cmp dh, 22 
	je DKswitchToPage2
	
	cmp dh, 10 
	je DKswitchToPage1
	
DownKeyUpdateRow:
	add dh, 4
	call updateCursorLocation
	jmp infiniteLoop
	

DKswitchToPage1:
	
	cmp bh, 0
	je DownKeyUpdateRow
	mov word [curPage], 0
	mov  al, 00h   ; select display page 1
	mov  ah, 05h   ; function 05h: select active display page
	int  10h
	mov bh, 0
	mov dh, 2
	call updateCursorLocation
	jmp infiniteLoop

DKswitchToPage2:
	mov word [curPage], 1
	mov  al, 01h   ; select display page 1
	mov  ah, 05h   ; function 05h: select active display page
	int  10h
	mov bh, 1
	mov dh, 2
	call updateCursorLocation
	jmp infiniteLoop

;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

;~~~~~~~~~~~~~~~~~~~~~~~~~~~NOTE KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

noteButtonAnimation:
	pusha
	push dx
	call key_sound
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov dx, 0x083F
	mov bh, 0
	mov bl, [nextNoteCol] ; normal attrib
	mov cx, 4 ; length of string
	push cs
	pop es ; segment of string
	mov bp, noteText ; offset of string
	int 0x10 ; call BIOS video service
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov dx, 0x083F
	mov bh, 1
	mov bl, [nextNoteCol] ; normal attrib
	mov cx, 4 ; length of string
	push cs
	pop es ; segment of string
	mov bp, noteText ; offset of string
	int 0x10 ; call BIOS video service
	
	cmp byte [nextNoteCol], 1111b
	je turnON
	
	mov byte [nextNoteCol], 1111b
	
	jmp exitNBA
	
turnON:
	mov byte [nextNoteCol], 0x8e

exitNBA:	
	pop dx
	
	mov ah, 2
	mov bh, [curPage]
	int 10h
	
	popa
	ret

nKeyPressed:
	cmp byte [noteSelected], 0
	jne noteOff
	
	call noteButtonAnimation
	mov byte [noteSelected], 1
	jmp infiniteLoop
	
noteOff:
	mov byte [noteSelected], 0
	call noteButtonAnimation
	jmp infiniteLoop
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


cardButtonAnimation:
	pusha
	call key_sound
	mov bh, [curPage]
	
	mov si, 7
	
	cmp byte [currentTheme], 0
	je cardButtonDark1
	
	mov bl, 0x7e
	jmp CBrow1
	
cardButtonDark1:
	mov bl, 0x0e
	
CBrow1:	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	mov cx,1 
	int 10h
	
	add dl, 1
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne CBrow1
	
	sub dl, 2
	
	inc dh
	
	mov si, 4

CBver1:
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0e
	mov cx,1 
	int 10h
	
	add dl, 1
	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0e
	mov cx,1 
	int 10h
	
	sub dl, 1
	
	add dh, 1
	
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne CBver1
	
	
	mov si, 5
	
	dec dh
	dec dl
	
CBrow2:	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0e
	mov cx,1 
	int 10h
	
	sub dl, 1
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne CBrow2
	
	
	mov si, 4
	
	dec dh
	inc dl
	
CBver2:
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0e
	mov cx,1 
	int 10h
	
	add dl, 1
	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0e
	mov cx,1 
	int 10h
	
	sub dl, 1
	
	sub dh, 1
	
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne CBver2
	
	mov si, 5
	
	inc dh
	
	cmp byte [currentTheme], 0
	je cardButtonDark2
	
	mov bl, 0x7f
	jmp RCBver2
	
cardButtonDark2:
	mov bl, 0x0d
	
RCBver2:
	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0d
	mov cx,1 
	int 10h
	
	inc dl
	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0d
	mov cx,1 
	int 10h
	
	sub dl, 1
	
	inc dh
	
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne RCBver2
	
	
	mov si, 6
	
	dec dh
	inc dl
	
RCBrow2:	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0d
	mov cx,1 
	int 10h
	
	inc dl
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne RCBrow2
	
	mov si, 4
	
	dec dh
	sub dl, 2
	
RCBver1:
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0d
	mov cx,1 
	int 10h
	
	inc dl
	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0d
	mov cx,1 
	int 10h
	
	dec dl
	
	dec dh
	
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne RCBver1
	

	mov si, 5
	inc dh
	dec dl
	
RCBrow1:	
	mov ah, 2
    int 10h
	
	mov ah, 08h
	int 10h
	
	mov ah, 09h
	;mov bl, 0x0d
	mov cx,1 
	int 10h
	
	dec dl
	dec si
	
	call sleeperFunc
	
	cmp si, 0
	jne RCBrow1
	
	popa
	ret
	
	
card1:
	pusha
	
	mov dh, 10
	mov dl, 48
	call cardButtonAnimation
	
	popa
	ret
	
card2:
	pusha
	mov dh, 10
	mov dl, 58
	call cardButtonAnimation
	popa
	ret
	
	
card3:
	pusha
	mov dh, 10
	mov dl, 68
	call cardButtonAnimation
	popa
	ret
	
card4:
	pusha
	mov dh, 15
	mov dl, 48
	call cardButtonAnimation
	popa
	ret
	
card5:
	pusha
	mov dh, 15
	mov dl, 58
	call cardButtonAnimation
	popa
	ret
	
card6:
	pusha
	mov dh, 15
	mov dl, 68
	call cardButtonAnimation
	popa
	ret
	
card7:
	pusha
	mov dh, 20
	mov dl, 48
	call cardButtonAnimation
	popa
	ret
	
card8:
	pusha
	mov dh, 20
	mov dl, 58
	call cardButtonAnimation
	popa
	ret
	
card9:
	pusha
	mov dh, 20
	mov dl, 68
	call cardButtonAnimation
	popa
	ret
	

;~~~~~~~~~~~~~~~~~~~~~~~~~NUMBER KEY PRESSED~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


saveNoteState:
	pusha
	
	inc word [currentUndoPtr]
	mov bx, [currentUndoPtr]
	shl bx, 4
	
	xor ah, ah
	mov al, [noteSelected]
	mov [undoSpace + bx], ax ;note state saved
	
	xor ah, ah
	mov al, dh
	mov [undoSpace + bx + 2], ax ; Save row 
	
	xor ah, ah
	mov al, dl
	mov [undoSpace + bx + 4], ax ; Save cols
	
	mov ax, [playerScore]
	mov [undoSpace + bx + 6], ax ;Save current score
	
	xor ah, ah
	mov al, [curPage] ;CURPAGE IN AL
	mov [undoSpace + bx + 8], ax ;Save current page
	
	popa
	ret

printingNoteOnBoard:
	pusha
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bl, 0x07 ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	
	popa
	ret

printNoteNum:
	pusha
	
	push dx
	
	mov ch, 32
	mov ah, 1
	int 10h
	
	cmp byte [printHelper], '1'
	je printNote1
		
	cmp byte [printHelper], '2'
	je printNote2
		
	cmp byte [printHelper], '3'
	je printNote3
		
	cmp byte [printHelper], '4'
	je printNote4
		
	cmp byte [printHelper], '5'
	je printNote5
		
	cmp byte [printHelper], '6'
	je printNote6
		
	cmp byte [printHelper], '7'
	je printNote7
		
	cmp byte [printHelper], '8'
	je printNote8
		
	cmp byte [printHelper], '9'
	je printNote9
		
	
printNote1:
	call card1
	dec dh
	dec dl
	
	call saveNoteState
	
	call printingNoteOnBoard
	jmp exitPNK
	
printNote2:
	call card2
	dec dh
	call saveNoteState
	call printingNoteOnBoard
	jmp exitPNK
	
printNote3:
	call card3
	dec dh
	inc dl
	call saveNoteState
	
	call printingNoteOnBoard
	jmp exitPNK
	
printNote4:
	call card4
	dec dl
	call saveNoteState
	
	call printingNoteOnBoard
	jmp exitPNK
	
printNote5:
	call card5
	call saveNoteState
	
	call printingNoteOnBoard
	jmp exitPNK
	
printNote6:
	call card6
	inc dl
	call saveNoteState
	
	call printingNoteOnBoard
	jmp exitPNK
	
printNote7:
	call card7
	inc dh
	dec dl
	call saveNoteState
	
	call printingNoteOnBoard
	jmp exitPNK
	
printNote8:
	call card8
	inc dh
	
	call saveNoteState
	call printingNoteOnBoard
	jmp exitPNK
	
printNote9:
	call card9
	inc dh
	inc dl
	
	call saveNoteState
	call printingNoteOnBoard
	jmp exitPNK
	
exitPNK:

	pop dx
	mov ch, 6
	mov cl, 7
	mov ah, 1
    int 10h

	popa
	ret
	
;______________________________________________________________________________;

helperCBN:
	pusha
	cmp byte [currentTheme], 0
	je helpCBNdark
	mov bl, 0x7e
	jmp helperCBNMain
	
helpCBNdark:
	mov bl, 0x0e
helperCBNMain:
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	popa
	ret
;______________________________________________________________________________;	

clearBlockForNum:
	pusha
	
	push dx
	
	push word [printHelper]
	
	mov byte [printHelper] , ' '
	
	mov ch, 32
	mov ah, 1
    int 10h
	
	dec dh
	dec dl
	call helperCBN
	
	inc dl
	call helperCBN
	
	inc dl
	call helperCBN
	
	inc dh
	call helperCBN
	
	dec dl
	call helperCBN
	
	dec dl 
	call helperCBN
	
	inc dh
	call helperCBN
	
	inc dl
	call helperCBN
	
	inc dl
	call helperCBN
	
	pop ax
	
	mov [printHelper], al
	
	pop dx
	
	mov ah, 2
	int 10h
	
	mov ch, 6
	mov cl, 7
    mov ah, 1
    int 10h
	
	popa
	ret
;______________________________________________________________________________;

printInvalidNumber:
	pusha
	
	mov bh, [curPage]
	
	mov al, [printHelper]
	mov ah, 09h
	mov bl, 0x1F
	mov cx, 1
	int 0x10 ; call BIOS video service
	
	dec dh
	dec dl
	mov ah, 2
	int 10h
	
	mov al, 'x'
	mov ah, 09h
	mov bl, 0x8F
	mov cx, 1
	int 0x10 ; call BIOS video service
	
	add dl, 2
	mov ah, 2
	int 10h
	
	mov al, 'x'
	mov ah, 09h
	mov bl, 0x8F
	mov cx, 1
	int 0x10 ; call BIOS video service
	
	add dh, 2
	mov ah, 2
	int 10h
	
	mov al, 'x'
	mov ah, 09h
	mov bl, 0x8F
	mov cx, 1
	int 0x10 ; call BIOS video service
	
	sub dl, 2
	mov ah, 2
	int 10h
	
	mov al, 'x'
	mov ah, 09h
	mov bl, 0x8F
	mov cx, 1
	int 0x10 ; call BIOS video service
	
	popa
	ret
	
;______________________________________________________________________________;	


checkValidity:
	pusha
	
	;DH = rows DL = COLUMNS
	;After some analysis of the board division by 4 gives us row num (of the array) and division by 5 gives us the COLUMNS
	;For columns there are 2 special cases edge cases which are to be handled separately
	;They are col 5 and col 39
	
	xor ax, ax
	mov al, dh
	
	shr ax, 2
	
	mov bl, 9
	mul bl
	
	cmp bh, 1
	jne onDefaultPage
	
	add ax, 54

onDefaultPage:
		
	mov bx, [curBoardSol]
	
	push dx
	
		cmp dl, 5
		je specialCase5
		
		cmp dl, 39
		je specialCase39
		
		
		mov di, ax ;copy row index in di
	
	push bx
		;Now calculate the column index
		mov al, dl
		mov bl, 5
		
		div bl
	
	pop bx
	
		xor ah, ah ;al holds the quotient and we only need that
		
		add di, ax
		
		mov al, [printHelper]
		
		sub al, 0x30

		cmp al, [bx + di]
		je validNumber
		
		jmp invalidNumber
	
specialCase5:

		mov di, ax
		
		mov al, [printHelper]
		
		sub al, 0x30

		cmp al, [bx + di]
		je validNumber
		
		jmp invalidNumber
	
specialCase39:
		mov di, ax
		mov al, [printHelper]

		sub al, 0x30
		
		cmp al, [bx + di + 8]
		
		je validNumber
		
		jmp invalidNumber

validNumber:
		mov byte [validity], 1
		dec byte [remainingEntries]
		add byte [playerScore], 10
	
	
		push word [playerScore]
		call updatePlayerScore
		cmp byte [remainingEntries], 0
		je gameWin
		jmp exitCV

invalidNumber:

		call printInvalidNumber
		inc byte [mistakes]
		mov byte [validity], 0
		call updateMistakeCount
	
		inc word [currentUndoPtr]
		mov bx, [currentUndoPtr]
		shl bx, 4
		
		xor ah, ah
		mov al, [noteSelected]
		mov [undoSpace + bx], ax ;note state saved
		
		xor ah, ah
		mov al, dh
		mov [undoSpace + bx + 2], ax ; Save row 
		
		xor ah, ah
		mov al, dl
		mov [undoSpace + bx + 4], ax ; Save cols
		
		mov ax, [playerScore]
		mov [undoSpace + bx + 6], ax ;Save current score
		
		xor ah, ah
		mov al, [curPage] ;CURPAGE VALUE IN AL
		mov [undoSpace + bx + 8],  ax; Save curPage
	
		cmp byte [mistakes], 5
		je gameLoss
		
		sub word [playerScore], 8
		
		cmp word [playerScore], 0
		jnge setScoreToZero
		
		
		jmp exitCV	

setScoreToZero:
		mov word [playerScore], 0

exitCV:	
		push word [playerScore]
		call updatePlayerScore
		
	pop dx
	popa
	ret
	
;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$;

sleeperFunc:
	push cx
	mov cx, 0xAfff
delay:
	loop delay
	pop cx
	ret

helperCA:
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bl, [completionColor] ; normal attrib
	mov cx, 1 ; length of string
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10 ; call BIOS video service
	ret
;______________________________________________________________________________;	

completionAnimation:
	pusha
	call sounds
	push dx
	
	push word [printHelper]
	
	mov byte [printHelper] , ' '
	
	mov ch, 32
	mov ah, 1
    int 10h
	
	dec dh
	dec dl
	call helperCA
	
	call sleeperFunc
	
	inc dl
	call helperCA
	
	call sleeperFunc
	
	inc dl
	call helperCA
	
	call sleeperFunc
	
	inc dh
	call helperCA
	
	call sleeperFunc
	
	dec dl
	;call helperCBN
	
	dec dl 
	call helperCA
	
	call sleeperFunc
	
	inc dh
	call helperCA
	
	call sleeperFunc
	
	inc dl
	call helperCA
	
	call sleeperFunc
	
	inc dl
	call helperCA
	
	call sleeperFunc
		
	pop ax
	
	mov [printHelper], al
	
	pop dx
	
	mov ah, 2
	int 10h
	
	mov ch, 6
	mov cl, 7
    mov ah, 1
    int 10h
	
	popa
	ret


checkRowCompletion:
	pusha
		
	mov dl, 5
	
	mov cx, 3
	
RowCheck1:
	mov ah, 2
	int 10h
	
	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	jne exitCRC
	
	add dl, 4
	
	loop RowCheck1
	
	add dl, 1
	
	mov cx, 3
	
RowCheck2:
	mov ah, 2
	int 10h
	
	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	jne exitCRC
	
	add dl, 4
	
	loop RowCheck2
	
	add dl, 1
	
	mov cx, 3
	
RowCheck3:
	mov ah, 2
	int 10h
	
	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	jne exitCRC
	
	add dl, 4
	
	loop RowCheck3
	
	
	mov byte [completionColor], 0xD0
	
	mov dl, 5

	call completionAnimation
	
	add dl, 4
	call completionAnimation
	
	add dl, 4
	call completionAnimation
	
	add dl, 5
	call completionAnimation
	
	add dl, 4
	call completionAnimation
	
	add dl, 4
	call completionAnimation
	
	add dl, 5
	call completionAnimation
	
	add dl, 4
	call completionAnimation
	
	add dl, 4
	call completionAnimation
	
	
	call sleeperFunc
	
	mov byte [completionColor], 0x4e
	
	call completionAnimation
	
	sub dl, 4 
	call completionAnimation
	
	sub dl, 4 
	call completionAnimation

	sub dl, 5
	call completionAnimation
	
	sub dl, 4 
	call completionAnimation
	
	sub dl, 4 
	call completionAnimation

	sub dl, 5
	call completionAnimation
	
	sub dl, 4 
	call completionAnimation
	
	sub dl, 4 
	call completionAnimation
	
exitCRC:
	popa
	ret
	
;$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$;

checkColCompletion:
	pusha
	
	mov bh, 0 ;even if the cursor is on page 1 bring to page 0 so we can check from the start
	
	mov dh, 2
	
	mov ah, 2
	int 10h
	
	mov cx, 6
	
colCheck1:
	mov ah, 2
	int 10h
	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	jne exitCCC
	
	add dh, 4
	loop colCheck1
	
	
	mov bh, 1 ;even if the cursor is on page 1 bring to page 0 so we can check from the start
	mov dh, 2
	mov ah, 2
	int 10h
	
	mov cx, 3
	
colCheck2:
	mov ah, 2
	int 10h
	mov ah, 08h
	int 10h
	
	cmp ah, 0x4e
	jne exitCCC
	
	add dh, 4
	loop colCheck2
	

	;ANIMATION STARTS FROM PAGE 1
	
	mov bh, 0 ;even if the cursor is on page 1 bring to page 0 so we can check from the start
	mov dh, 2
	mov ah, 2
	int 10h
	
	mov byte [completionColor], 0xD0
	
	mov dh, 2
	
	call completionAnimation
	
	mov cx, 5
	
loopHere2:
	
	add dh, 4
	call completionAnimation
	
	loop loopHere2

	
	mov bh, 1
	
	mov dh, 2
	
	call completionAnimation
	
	add dh, 4
	
	call completionAnimation
	
	add dh, 4
	
	call completionAnimation

	;===========================================================
	
	call sleeperFunc
	
	mov byte [completionColor], 0x4e
	
	call completionAnimation
	
	sub dh, 4
	
	call completionAnimation
	
	sub dh, 4
	
	call completionAnimation
	
	mov bh, 0
	
	mov dh, 22
	
	call completionAnimation

	mov cx, 6
loopHere:
	sub dh, 4
	call completionAnimation
	loop loopHere

exitCCC:	
	popa
	ret

	
;______________________________________________________________________________;

numberKey:
	
	mov [printHelper], al
	
	;GET CURSOR LOCATION
	mov ah, 03h
	int 10h
	
	;DH = ROWS DL = COLS BH = PAGE NUMBER
	
	mov  ah, 08h
	int 10h
	
	cmp ah, 0x4e
	je numPrinted
	
	cmp ah, 0x5f
	je numPrinted
	
	cmp byte [noteSelected], 1
	jne printConfirmNum
	
	call printNoteNum
	jmp numPrinted

printConfirmNum:
	mov al, [printHelper]
	sub al, 0x30
	
	cmp al, 1
	je animationCN1

	cmp al, 2
	je animationCN2
	
	cmp al, 3
	je animationCN3
	
	cmp al, 4
	je animationCN4
	
	cmp al, 5
	je animationCN5
	
	cmp al, 6
	je animationCN6
	
	cmp al, 7
	je animationCN7
	
	cmp al, 8
	je animationCN8
	
	cmp al, 9
	je animationCN9
	
animationCN1:
	call card1
	jmp animationCNComplete
	
animationCN2:
	call card2
	jmp animationCNComplete
	
animationCN3:
	call card3
	jmp animationCNComplete
	
animationCN4:
	call card4
	jmp animationCNComplete
	
animationCN5:
	call card5
	jmp animationCNComplete
	
animationCN6:
	call card6
	jmp animationCNComplete
	
animationCN7:
	call card7
	jmp animationCNComplete
	
animationCN8:
	call card8
	jmp animationCNComplete
	
animationCN9:
	call card9
	jmp animationCNComplete
	

	
animationCNComplete:
	
	call clearBlockForNum
	call checkValidity
	
	cmp byte [validity], 0
	je numPrinted
	
	
	mov al, [printHelper]
	mov ah, 09h
	mov bl, 0x4e
	mov cx, 1
	int 0x10 ; call BIOS video service
	
	call checkRowCompletion
	call checkColCompletion
		
numPrinted:
	
	;reset cursor location
	mov ah, 2
    int 10h

	cmp byte [mistakes], 5
	je exitGameOver
	
	cmp byte [remainingEntries], 0
	jbe exitGameOver
	
	jmp infiniteLoop
	
exitGameOver:
	popa
	ret
;==============================================================================

boardSelecter:
	pusha
	
	call generate_random
	
	cmp byte [selectedopt2], 0
	je easyBoard
	
	cmp byte [selectedopt2], 1
	je mediumBoard
	
	cmp byte [selectedopt2], 2
	je hardBoard
	
	popa
	ret
	
easyBoard:
	
	cmp byte [result], 1
	je loadE1
	
	cmp byte [result], 2
	je loadE2
	
	cmp byte [result], 3
	je loadE3
	
	cmp byte [result], 4
	je loadE4
	
	cmp byte [result], 5
	je loadE5
	
loadE1:
	mov ax, Easy1
	mov [curBoardPlayed], ax
	mov ax, solEasy1
	mov [curBoardSol], ax
	jmp existEB
	
loadE2:
	mov ax, Easy2
	mov [curBoardPlayed], ax
	mov ax, solEasy2
	mov [curBoardSol], ax
	jmp existEB
	
loadE3:
	mov ax, Easy3
	mov [curBoardPlayed], ax
	mov ax, solEasy3
	mov [curBoardSol], ax
	jmp existEB
	
loadE4:
	mov ax, Easy4
	mov [curBoardPlayed], ax
	mov ax, solEasy4
	mov [curBoardSol], ax
	jmp existEB
	
loadE5:
	mov ax, Easy5
	mov [curBoardPlayed], ax
	mov ax, solEasy5
	mov [curBoardSol], ax
	jmp existEB
	
;------------------------------------------------------------------------------

mediumBoard:
	
	cmp byte [result], 1
	je loadM1
	
	cmp byte [result], 2
	je loadM2
	
	cmp byte [result], 3
	je loadM3
	
	cmp byte [result], 4
	je loadM4
	
	cmp byte [result], 5
	je loadM5
	
loadM1:
	mov ax, Medium1
	mov [curBoardPlayed], ax
	mov ax, solMedium1
	mov [curBoardSol], ax
	jmp existEB
	
loadM2:
	mov ax, Medium2
	mov [curBoardPlayed], ax
	mov ax, solMedium2
	mov [curBoardSol], ax
	jmp existEB
	
loadM3:
	mov ax, Medium3
	mov [curBoardPlayed], ax
	mov ax, solMedium3
	mov [curBoardSol], ax
	jmp existEB
	
loadM4:
	mov ax, Medium4
	mov [curBoardPlayed], ax
	mov ax, solMedium4
	mov [curBoardSol], ax
	jmp existEB
	
loadM5:
	mov ax, Medium5
	mov [curBoardPlayed], ax
	mov ax, solMedium5
	mov [curBoardSol], ax
	jmp existEB

hardBoard:	

	cmp byte [result], 1
	je loadH1
	
	cmp byte [result], 2
	je loadH2
	
	cmp byte [result], 3
	je loadH3
	
	cmp byte [result], 4
	je loadH4
	
	cmp byte [result], 5
	je loadH5
	
loadH1:
	mov ax, Hard1
	mov [curBoardPlayed], ax
	mov ax, solHard1
	mov [curBoardSol], ax
	jmp existEB
	
loadH2:
	mov ax, Hard2
	mov [curBoardPlayed], ax
	mov ax, solHard2
	mov [curBoardSol], ax
	jmp existEB
	
loadH3:
	mov ax, Hard3
	mov [curBoardPlayed], ax
	mov ax, solHard3
	mov [curBoardSol], ax
	jmp existEB
	
loadH4:
	mov ax, Hard4
	mov [curBoardPlayed], ax
	mov ax, solHard4
	mov [curBoardSol], ax
	jmp existEB
	
loadH5:
	mov ax, Hard5
	mov [curBoardPlayed], ax
	mov ax, solHard5
	mov [curBoardSol], ax
	jmp existEB

existEB:
	popa
	ret

;==============================================================================

markopt11:
	mov bl, 0x0B;
	jmp _play

markopt12:
	mov bl, 0x0B;
	jmp _help

markopt13:
	mov bl, 0x0B;
	jmp _quit

markopt21:
	mov bl, 0x0B;
	jmp _easy

markopt22:
	mov bl, 0x0B;
	jmp _mean

markopt23:
	mov bl, 0x0B;
	jmp _hard

markopt24:
	mov bl, 0x0B;
	jmp _back

markopt31:
	mov bl, 0x0B;
	jmp _hints

markopt32:
	mov bl, 0x0B;
	jmp _theme

markopt33:
	mov bl, 0x0B;
	jmp _audio

markopt34:
	mov bl, 0x0B;
	jmp _close

markopt41:
	mov bl, 0x0B;
	jmp _disable1

markopt42:
	mov bl, 0x0B;
	jmp _enable1

markopt43:
	mov bl, 0x0B;
	jmp _dark

markopt44:
	mov bl, 0x0B;
	jmp _light

markopt45:
	mov bl, 0x0B;
	jmp _disable2

markopt46:
	mov bl, 0x0B;
	jmp _enable2
	
;===============CLEAR SCREEN=========================================;


clrscr:
	
	pusha
	mov ax, 0xB800
	mov es, ax
	xor di, di
	
	cmp byte [currentTheme] , 0
	jne _lightTheme1
	mov ax, 0x0720
	mov cx, 4100
	jmp printBackground1
	
	_lightTheme1:
	mov ax, 0x7720
	mov cx, 4100
	
	printBackground1:
	cld
	rep stosw
	popa
	ret

;===============CLEAR SCREEN WITH BOUNDARY===============================;

clearscr:
	pusha
	mov ax, 0xB800
	mov es, ax
	xor di, di

	cmp byte [currentTheme] , 0
	jne _lightTheme2
	mov ax, 0x0720
	mov cx, 4100
	jmp printBackground2
	
	_lightTheme2:
	mov ax, 0x7720
	mov cx, 4100
	
	printBackground2:
	cld
	rep stosw

	mov ax, 0xB800
	mov es, ax

	xor di, di
	call print_first_row

	mov di, 160
	call print_second_row

	mov di, 3680 
	call print_first_row

	mov di, 3840 
	call print_second_row 
		popa
		ret
		
	print_first_row:
	mov si, first_row 
	mov cx, 80 
	call print_row
	ret

	print_second_row:
		mov si, second_row 
		mov cx, 80
		call print_row 
	ret

	print_row:
		print_loop:
			lodsb 
			mov ah, 0x0B 
			mov [es:di], ax
			add di, 2
			loop print_loop
	ret	


gamehead:

	call clearscr
	pusha
	mov ah, 0x13
	mov al, 0x01
	mov cx, 0x0C 
	push cs
	pop  es
	
	mov bh , 0x00
	mov bl , 0x0C
	mov dx , 0x041F
	mov bp , header
	int 10h
	
	popa
	ret

_mainmenu:
	call gamehead
	
	pusha
	
	
	mov ah , 0x13
	mov al , 0x01

	mov cx , 0x04
	push cs;
	pop  es;

	mov bh , 0x00
	cmp byte [currentTheme], 0
	jne _lightBoundary3
	mov bl, 0x0A
	jmp printing4
	_lightBoundary3:
	mov bl, 0111_1011b 
	printing4:
	cmp byte [selectedopt1] , 0
	je  markopt11
	_play:
	mov dx , 0x0823
	mov bp , opt11
	int 10h
	
	
	cmp byte [currentTheme], 0
	jne _lightBoundary4
	mov bl, 0x0A
	jmp printing5
	_lightBoundary4:
	mov bl, 0111_1011b 
	printing5:
	cmp byte [selectedopt1] , 1
	je  markopt12
	_help:
	mov dx , 0x0A23
	mov bp , opt12
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary5
	mov bl, 0x0A
	jmp printing6
	_lightBoundary5:
	mov bl, 0111_1011b 
	printing6:
	cmp byte [selectedopt1] , 2
	je  markopt13
	_quit:
	mov dx , 0x0C23
	mov bp , opt13
	int 10h
	popa
	ret
	
_playmenu:
	call gamehead
	pusha
	mov ah , 0x13;
	mov al , 0x01;

	mov cx , 0x04;
	push cs;
	pop  es;

	mov bh , 0x00;
	cmp byte [currentTheme], 0
	jne _lightBoundary6
	mov bl, 0x0A
	jmp printing7
	_lightBoundary6:
	mov bl, 0111_1011b 
	printing7:
	cmp byte [selectedopt2] , 0
	je  markopt21
	_easy:
	mov dx , 0x0723
	mov bp , opt21
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary7
	mov bl, 0x0A
	jmp printing8
	_lightBoundary7:
	mov bl, 0111_1011b 
	printing8:
	cmp byte [selectedopt2] , 1
	je  markopt22
	_mean:
	mov cx, 6
	mov dx , 0x0922
	mov bp , opt22
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary8
	mov bl, 0x0A
	jmp printing9
	_lightBoundary8:
	mov bl, 0111_1011b 
	printing9:
	cmp byte [selectedopt2] , 2
	je  markopt23
	_hard:
	mov cx, 4
	mov dx , 0x0B23
	mov bp , opt23
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary9
	mov bl, 0x0A
	jmp printing10
	_lightBoundary9:
	mov bl, 0111_1011b 
	printing10:
	cmp byte [selectedopt2] , 3
	je  markopt24
	_back:
	mov dx , 0x0D23
	mov bp , opt24
	int 10h
	
	popa
	ret

_helpmenu:
	call gamehead
	pusha
	mov ah , 0x13;
	mov al , 0x01;

	mov cx , 0x05;
	push cs;
	pop  es;

	mov bh , 0x00;
	cmp byte [currentTheme], 0
	jne _lightBoundary10
	mov bl, 0x0A
	jmp printing11
	_lightBoundary10:
	mov bl, 0111_1011b 
	printing11:
	cmp byte [selectedopt3] , 0
	je  markopt31
	_hints:
	mov dx , 0x0723
	mov bp , opt31
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary11
	mov bl, 0x0A
	jmp printing12
	_lightBoundary11:
	mov bl, 0111_1011b 
	printing12:
	cmp byte [selectedopt3] , 1
	je  markopt32
	_theme:
	mov dx , 0x0923
	mov bp , opt32
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary12
	mov bl, 0x0A
	jmp printing13
	_lightBoundary12:
	mov bl, 0111_1011b 
	printing13:
	cmp byte [selectedopt3] , 2
	je  markopt33
	_audio:
	mov dx , 0x0B23
	mov bp , opt33
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary13
	mov bl, 0x0A
	jmp printing14
	_lightBoundary13:
	mov bl, 0111_1011b 
	printing14:
	cmp byte [selectedopt3] , 3
	je  markopt34
	_close:
	mov dx , 0x0D23
	mov bp , opt34
	int 10h
	
	popa
	ret
	
	
_hintsmenu:
	call gamehead
	pusha
	mov ah , 0x13;
	mov al , 0x01;

	mov cx , 0x07;
	push cs;
	pop  es;

	cmp byte [currentTheme], 0
	jne _lightBoundary14
	mov bl, 0x0A
	jmp printing15
	_lightBoundary14:
	mov bl, 0111_1011b 
	printing15:
	cmp byte [selectedopt4] , 0
	je  markopt41
	_disable1:
	mov dx , 0x0723
	mov bp , opt41
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary15
	mov bl, 0x0A
	jmp printing16
	_lightBoundary15:
	mov bl, 0111_1011b 
	printing16:
	cmp byte [selectedopt4] , 1
	je  markopt42
	_enable1:
	mov dx , 0x0923
	mov bp , opt42
	int 10h
	popa
	ret
	
_thememenu:
	call gamehead
	pusha
	mov ah , 0x13;
	mov al , 0x01;

	mov cx , 0x05;
	push cs;
	pop  es;

	cmp byte [currentTheme], 0
	jne _lightBoundary16
	mov bl, 0x0A
	jmp printing17
	_lightBoundary16:
	mov bl, 0111_1011b 
	printing17:
	cmp byte [selectedopt5] , 0
	je  markopt43
	_dark:
	mov dx , 0x0723
	mov bp , opt43
	int 10h

	cmp byte [currentTheme], 0
	jne _lightBoundary17
	mov bl, 0x0A
	jmp printing18
	_lightBoundary17:
	mov bl, 0111_1011b 
	printing18:
	cmp byte [selectedopt5] , 1
	je  markopt44
	_light:
	mov dx , 0x0923
	mov bp , opt44
	int 10h
	popa
	ret
		
_audiomenu:
	call gamehead
	pusha
	mov ah , 0x13;
	mov al , 0x01;

	mov cx , 0x07;
	push cs;
	pop  es;

	mov bh , 0x00;
	cmp byte [currentTheme], 0
	jne _lightBoundary18
	mov bl, 0x0A
	jmp printing19
	_lightBoundary18:
	mov bl, 0111_1011b 
	printing19:
	cmp byte [selectedopt6] , 0
	je  markopt45
	_disable2:
	mov dx , 0x0723
	mov bp , opt45
	int 10h

	mov bh , 0x00;
	cmp byte [currentTheme], 0
	jne _lightBoundary19
	mov bl, 0x0A
	jmp printing20
	_lightBoundary19:
	mov bl, 0111_1011b 
	printing20:
	cmp byte [selectedopt6] , 1
	je  markopt46
	_enable2:
	mov dx , 0x0923
	mov bp , opt46
	int 10h
	popa
	ret
	
stroll_main_menu:
	call _mainmenu
	
	mov ah, 0x00
	int 16h
	
	cmp ah, 0x48
	jne _nextOpt1
	call _moveupOpt1
	
	_nextOpt1:
	cmp ah, 0x50
	jne _compOpt1
	call _movednOpt1
	
	_compOpt1:
	cmp ah, 0x1C
	jne _loopOpt1
	call _selectOpt1
	
	_loopOpt1:
	jmp stroll_main_menu

_moveupOpt1:
	pusha 
	mov ax, [selectedopt1]
	cmp ax, 0
	jne _decreOpt1
	add ax, 3
	
	_decreOpt1:
	sub ax, 1
	mov [selectedopt1], ax
	call stroll_main_menu
	popa
	ret

_movednOpt1:
	pusha 
	mov ax, [selectedopt1]
	cmp ax, 2
	jne _increOpt1
	sub ax, 3
	
	_increOpt1:
	add ax, 1
	mov [selectedopt1], ax
	call stroll_main_menu
	popa
	ret
	
_selectOpt1:
	pusha
	cmp byte[selectedopt1], 0
	jne _nexttab1
	call stroll_play_menu
	
	_nexttab1:
	cmp byte[selectedopt1], 1
	jne endProg
	call stroll_help_menu
	popa
	ret

stroll_play_menu:
	call _playmenu
	
	mov ah, 0x00
	int 16h
	
	cmp ah, 0x48
	jne _nextOpt2
	call _moveupOpt2
	
	_nextOpt2:
	cmp ah, 0x50
	jne _compOpt2
	call _movednOpt2
	
	_compOpt2:
	cmp ah, 0x1C
	jne _loopOpt2
	call _selectOpt2
	
	_loopOpt2:
	jmp stroll_play_menu

_moveupOpt2:
	pusha 
	mov ax, [selectedopt2]
	cmp ax, 0
	jne _decreOpt2
	add ax, 4
	
	_decreOpt2:
	sub ax, 1
	mov [selectedopt2], ax
	jmp stroll_play_menu
	popa
	ret

_movednOpt2:
	pusha 
	mov ax, [selectedopt2]
	cmp ax, 3
	jne _increOpt2
	sub ax, 4
	
	_increOpt2:
	add ax, 1
	mov [selectedopt2], ax
	jmp stroll_play_menu
	popa
	ret
	
_selectOpt2:
	pusha
	cmp byte[selectedopt2], 0
	jne _nexttab2
	jmp gamestart
	
	_nexttab2:
	cmp byte[selectedopt2], 1
	jne _comptab2
	jmp gamestart
	
	_comptab2:
	cmp byte[selectedopt2], 2
	jne stroll_main_menu
	jmp gamestart
	popa
	ret

stroll_help_menu:
	call _helpmenu
	
	mov ah, 0x00
	int 16h
	
	cmp ah, 0x48
	jne _nextOpt3
	call _moveupOpt3
	
	_nextOpt3:
	cmp ah, 0x50
	jne _compOpt3
	call _movednOpt3
	
	_compOpt3:
	cmp ah, 0x1C
	jne _loopOpt3
	call _selectOpt3
	
	_loopOpt3:
	jmp stroll_help_menu
	
_moveupOpt3:
	pusha 
	mov ax, [selectedopt3]
	cmp ax, 0
	jne _decreOpt3
	add ax, 4
	
	_decreOpt3:
	sub ax, 1
	mov [selectedopt3], ax
	jmp stroll_help_menu
	popa
	ret

_movednOpt3:
	pusha 
	mov ax, [selectedopt3]
	cmp ax, 3
	jne _increOpt3
	sub ax, 4
	
	_increOpt3:
	add ax, 1
	mov [selectedopt3], ax
	jmp stroll_help_menu
	popa
	ret
	
_selectOpt3:
	pusha
	cmp byte[selectedopt3], 0
	jne _nexttab3
	jmp stroll_hints_menu
	
	_nexttab3:
	cmp byte[selectedopt3], 1
	jne _comptab3
	jmp stroll_theme_menu
	
	_comptab3:
	cmp byte[selectedopt3], 2
	jne stroll_main_menu
	jmp stroll_audio_menu
	popa
	ret
	
stroll_hints_menu:
	call _hintsmenu
	
	mov ah, 0x00
	int 16h
	
	cmp ah, 0x48
	jne _nextOpt4
	call _moveupOpt4
	
	_nextOpt4:
	cmp ah, 0x50
	jne _compOpt4
	call _movednOpt4
	
	_compOpt4:
	cmp ah, 0x1C
	jne _loopOpt4
	call _selectOpt4
	
	_loopOpt4:
	jmp stroll_hints_menu
	
_moveupOpt4:
	pusha 
	mov ax, [selectedopt4]
	cmp ax, 0
	jne _decreOpt4
	add ax, 2
	
	_decreOpt4:
	sub ax, 1
	mov [selectedopt4], ax
	jmp stroll_hints_menu
	popa
	ret
_movednOpt4:
	pusha 
	mov ax, [selectedopt4]
	cmp ax, 1
	jne _increOpt4
	sub ax, 2
	
	_increOpt4:
	add ax, 1
	mov [selectedopt4], ax
	jmp stroll_hints_menu
	popa
	ret
_selectOpt4:
	pusha
	cmp byte[selectedopt4], 0
	jne _nexttab4
	mov byte [currentHints], 0
	jmp stroll_help_menu
	
	_nexttab4:
	mov byte [currentHints], 1
	jmp stroll_help_menu
	popa
	ret
	
stroll_theme_menu:
	call _thememenu
	
	mov ah, 0x00
	int 16h
	
	cmp ah, 0x48
	jne _nextOpt5
	call _moveupOpt5
	
	_nextOpt5:
	cmp ah, 0x50
	jne _compOpt5
	call _movednOpt5
	
	_compOpt5:
	cmp ah, 0x1C
	jne _loopOpt5
	call _selectOpt5
	
	_loopOpt5:
	jmp stroll_theme_menu
	
_moveupOpt5:
	pusha 
	mov ax, [selectedopt5]
	cmp ax, 0
	jne _decreOpt5
	add ax, 2
	
	_decreOpt5:
	sub ax, 1
	mov [selectedopt5], ax
	jmp stroll_theme_menu
	popa
	ret
_movednOpt5:
	pusha 
	mov ax, [selectedopt5]
	cmp ax, 1
	jne _increOpt5
	sub ax, 2
	
	_increOpt5:
	add ax, 1
	mov [selectedopt5], ax
	jmp stroll_theme_menu
	popa
	ret
_selectOpt5:
	pusha
	cmp byte[selectedopt5], 0
	jne _nexttab5
	mov byte [currentTheme], 0
	jmp stroll_help_menu
	
	_nexttab5:
	cmp byte[selectedopt5], 1
	jne stroll_help_menu
	mov byte [currentTheme], 1
	jmp stroll_help_menu

	popa
	ret
stroll_audio_menu:
	call _audiomenu
	
	mov ah, 0x00
	int 16h
	
	cmp ah, 0x48
	jne _nextOpt6
	call _moveupOpt6
	
	_nextOpt6:
	cmp ah, 0x50
	jne _compOpt6
	call _movednOpt6
	
	_compOpt6:
	cmp ah, 0x1C
	jne _loopOpt6
	call _selectOpt6
	
	_loopOpt6:
	jmp stroll_audio_menu
	
_moveupOpt6:
	pusha 
	mov ax, [selectedopt6]
	cmp ax, 0
	jne _decreOpt6
	add ax, 2
	
	_decreOpt6:
	sub ax, 1
	mov [selectedopt6], ax
	jmp stroll_audio_menu
	popa
	ret
_movednOpt6:
	pusha 
	mov ax, [selectedopt6]
	cmp ax, 1
	jne _increOpt6
	sub ax, 2
	
	_increOpt6:
	add ax, 1
	mov [selectedopt6], ax
	jmp stroll_audio_menu
	popa
	ret
_selectOpt6:
	pusha
	cmp byte[selectedopt6], 0
	jne _nexttab6
	mov byte [currentAudio], 1
	
	_nexttab6:
	mov byte [currentAudio], 0
	jmp stroll_help_menu
	popa
	ret
	
;=======================================================================

;=================MAIN BOARD PRINT FUNCTIONS=========================;

printDetails:

	cmp byte [currentTheme], 0
	je printDetailDark
	
	mov bl, 0x70
	jmp printDetailMain
	
printDetailDark:
	
	mov bl, 0x0f

printDetailMain:
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x0F ; normal attrib
	mov cx, 9 ; length of string
	mov dx, 0x032F
	push cs
	pop es ; segment of string
	mov bp, String1 ; offset of string
	int 0x10
	
	mov dx, 0x052F ;05 = ROW 2F = COLS
	push cs
	pop es ; segment of string
	mov bp, String2 ; offset of string
	int 0x10	
	
	mov al, '0'
	
	mov [printHelper], al
		
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x0F ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x0539
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x0F ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x0339
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov al, '/'
	
	mov [printHelper], al
		
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x0F ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x053b
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov al, '5'
	
	mov [printHelper], al
		
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x0F ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x053d
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
		

fillNotesBox1:

	pusha
	
	mov ax, 0xb800
	mov es, ax
	
	cmp byte[currentTheme] , 1
	jne _blackTheme1
	mov bx, 0x70
	jmp _print1
	_blackTheme1:
	mov bl, 0x07
	
	_print1:
	mov di, 2022
	mov byte[es:di], 0x31
	inc di
	mov byte[es:di], bl
	mov di, 2042
	mov byte[es:di], 0x32
	inc di
	mov byte[es:di], bl
	mov di, 2062
	mov byte[es:di], 0x33
	inc di
	mov byte[es:di], bl
	mov di, 2822
	mov byte[es:di], 0x34
	inc di
	mov byte[es:di], bl
	mov di, 2842
	mov byte[es:di], 0x35
	inc di
	mov byte[es:di], bl
	mov di, 2862
	mov byte[es:di], 0x36
	inc di
	mov byte[es:di], bl
	mov di, 3622
	mov byte[es:di], 0x37
	inc di
	mov byte[es:di], bl
	mov di, 3642
	mov byte[es:di], 0x38
	inc di
	mov byte[es:di], bl
	mov di, 3662
	mov byte[es:di], 0x39
	inc di
	mov byte[es:di], bl
		
	popa
	ret

fillNotesBox2:

	pusha
	
	mov ax, 0xb800
	mov es, ax
	cmp byte[currentTheme] , 1
	jne _blackTheme2
	mov bx, 0x70
	jmp _print2
	_blackTheme2:
	mov bl, 0x07
	
	_print2:
	mov di, 6118
	mov byte[es:di], 0x31
	inc di
	mov byte[es:di], bl
	mov di, 6138
	mov byte[es:di], 0x32
	inc di
	mov byte[es:di], bl
	mov di, 6158
	mov byte[es:di], 0x33
	inc di
	mov byte[es:di], bl
	mov di, 6918
	mov byte[es:di], 0x34
	inc di
	mov byte[es:di], bl
	mov di, 6938
	mov byte[es:di], 0x35
	inc di
	mov byte[es:di], bl
	mov di, 6958
	mov byte[es:di], 0x36
	inc di
	mov byte[es:di], bl
	mov di, 7718
	mov byte[es:di], 0x37
	inc di
	mov byte[es:di], bl
	mov di, 7738
	mov byte[es:di], 0x38
	inc di
	mov byte[es:di], bl
	mov di, 7758
	mov byte[es:di], 0x39
	inc di
	mov byte[es:di], bl
		
	popa
	ret
	
printOptionBoxes:
	pusha
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	cmp byte [currentTheme], 0
	jne _lightBoundary1
	mov bl, 1101b ; normal attrib
	jmp printing2
	_lightBoundary1:
	mov bl, 0111_1011b 
	printing2:
	mov cx, 6 ; length of string
	push cs
	pop es ; segment of string
	mov bp, optionBoundary ; offset of string
	int 0x10
	
	add dx , 0x0100
	mov cx, 1 ; length of string
	mov bp, optionDivider ; offset of string
	int 0x10
	
	add dx, 0x0001
	mov cx, 4 ; length of string
	mov bl, 1111b ; normal attrib
	mov bp, Text ; offset of string
	int 0x10
	
	add dx , 0x0004
	cmp byte [currentTheme], 0
	jne _lightBoundary2
	mov bl, 1101b ; normal attrib
	jmp printing3
	_lightBoundary2:
	mov bl, 0111_1011b 
	printing3:
	mov cx , 1
	mov bp, optionDivider ; offset of string
	int 0x10
	
	sub dx , 0x0005
	add dx , 0x0100
	
	mov cx, 6 ; length of string
	mov bp, optionBoundary ; offset of string
	int 0x10
	
	popa
	ret
	
printOptions:
	pusha
	
	mov dx, 0x072F
	mov al, [undoText]
	mov [Text], al
	mov al, [undoText + 1]
	mov [Text + 1], al
	mov al, [undoText + 2]
	mov [Text + 2], al
	mov al, [undoText + 3]
	mov [Text + 3], al
	call printOptionBoxes
	
	mov dx, 0x0737
	mov al, [hintText]
	mov [Text], al
	mov al, [hintText + 1]
	mov [Text + 1], al
	mov al, [hintText + 2]
	mov [Text + 2], al
	mov al, [hintText + 3]
	mov [Text + 3], al
	call printOptionBoxes
	
	mov dx, 0x073E
	mov al, [noteText]
	mov [Text], al
	mov al, [noteText + 1]
	mov [Text + 1], al
	mov al, [noteText + 2]
	mov [Text + 2], al
	mov al, [noteText + 3]
	mov [Text + 3], al
	call printOptionBoxes
	
	mov dx, 0x0746
	mov al, [quitText]
	mov [Text], al
	mov al, [quitText + 1]
	mov [Text + 1], al
	mov al, [quitText + 2]
	mov [Text + 2], al
	mov al, [quitText + 3]
	mov [Text + 3], al
	call printOptionBoxes

	popa
	ret

printNotesBoxBoundary:
	pusha
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	cmp byte [currentTheme], 0
	jne _lightBoundary
	mov bl, 1101b ; normal attrib
	jmp printing1
	_lightBoundary:
	mov bl, 0111_1011b ; normal attrib
	printing1:
	mov cx, 7 ; length of string
	push cs
	pop es ; segment of string
	mov bp, boxBoundary ; offset of string
	int 0x10
	
	add dx , 0x0100
	mov cx, 2 ; length of string
	mov bp, divider ; offset of string
	int 0x10
	
	add dx , 0x0005
	mov bp, divider ; offset of string
	int 0x10
	
	sub dx , 0x0005
	add dx , 0x0100
	
	mov bp, divider ; offset of string
	int 0x10
	
	add dx , 0x0005
	
	mov bp, divider ; offset of string
	int 0x10	
	
	sub dx, 0x0005
	add dx , 0x0100
	
	mov bp, divider ; offset of string
	int 0x10
	
	add dx , 0x0005
	
	mov bp, divider ; offset of string
	int 0x10	
	
	sub dx, 0x0005
	add dx, 0x0100
	
	mov cx, 7 ; length of string
	mov bp, boxBoundary ; offset of string
	int 0x10
	popa
	ret

printNotesBox:

	pusha
	
	mov dx, 0x0A30
	call printNotesBoxBoundary
	add dx, 0x000A
	call printNotesBoxBoundary
	add dx, 0x000A
	call printNotesBoxBoundary
	
	mov dx, 0x0F30
	call printNotesBoxBoundary
	add dx, 0x000A
	call printNotesBoxBoundary
	add dx, 0x000A
	call printNotesBoxBoundary
	
	mov dx, 0x1430
	call printNotesBoxBoundary
	add dx, 0x000A
	call printNotesBoxBoundary
	add dx, 0x000A
	call printNotesBoxBoundary
	
	popa
	ret
	
;===========================================================

;MISTAKE UPDATOR ON SCREEN

updateMistakeCount:
	pusha
	push word [printHelper]
	
	mov al, [mistakes]
	add al, 0x30
	mov [printHelper], al
	
	cmp byte [currentTheme], 0
	je updateMistakeDark
	
	mov bl, 0x70
	jmp updateMistakeMain
updateMistakeDark:
	mov bl, 0x0f
updateMistakeMain:
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 0 ; output on page 0
	
	mov cx, 1 ; length of string
	mov dx, 0x0539
	push cs;
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10

	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 1 ; output on page 0
	
	mov cx, 1 ; length of string
	mov dx, 0x0539
	push cs;
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	pop ax
	
	mov [printHelper], al
	
	popa
	ret

;===========================================================

;SCORE UPDATOR ON SCREEN

clearScoreScreen:
	pusha
	push word [printHelper]
	push dx
	mov al, ' '
	mov [printHelper], al
	
	cmp byte [currentTheme], 0
	je clearScoreDark
	
	mov bl, 0x70
	jmp clearScoreMain
	
clearScoreDark:
	
	mov bl, 0x0f

clearScoreMain:
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x07 ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x0339
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
;	mov bl, 0x07 ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x033A
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x07 ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x033B
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
;	mov bl, 0x07 ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x033C
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	;mov bl, 0x07 ; normal attrib
	mov cx, 1 ; length of string
	mov dx, 0x033D
	push cs
	pop es ; segment of string
	mov bp, printHelper ; offset of string
	int 0x10
	
	pop dx
	
	mov bh, [curPage]
	mov ah, 2
	int 10h
	
	
	pop ax
	
	mov [printHelper], al
	
	popa
	ret

updatePlayerScore:
	push bp
	mov bp, sp
	push es
	push ax
	push bx
	push cx
	push dx
	push di
		
		mov al, [curPage]
		mov byte [curPage], 0
		call clearScoreScreen
		mov byte [curPage], 1
		call clearScoreScreen
		
		mov [curPage], al
		
		mov bx, 2
		
		
		mov ax, 0xb800
		mov es, ax ; point es to video base
		mov ax, [bp+4] ; load number in ax
		mov bx, 10 ; use base 10 for division
		mov cx, 0 ; initialize count of digits
		
nextScoredigit: 

		mov dx, 0 ; zero upper half of dividend
		div bx ; divide by 10
		add dl, 0x30 ; convert digit into ascii value
		push dx ; save ascii value on stack
		inc cx ; increment count of values
		
		cmp ax, 0 ; is the quotient zero
		jnz nextScoredigit ; if no divide it again
		
		mov di, 594 ; point di to top left column
		mov si, 4690

		
		
		
nextScorepos: 
	pop dx ; remove a digit from the stack
	
	cmp byte [currentTheme], 0
		je updatePlayerDark
		
		mov dh, 0x70
		jmp printPlayerScore
		
updatePlayerDark:
		mov dh, 0x0f
printPlayerScore:
		;mov dh, 0x07 ; use normal attribute
		mov [es:di], dx ; print char on screen
		mov [es:si], dx ; print char on screen
		add di, 2 ; move to next screen location
		add si, 2
		
	loop nextScorepos ; repeat for all digits on stack
	
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop bp
	ret 2
		
;===========================================================

start:
	mov ch, 32
	mov ah, 1
	int 10h
	
	call stroll_main_menu
	

	gamestart:
	
	call clrscr
	call init_seed 
	call boardSelecter	
	xor ax, ax
	mov es, ax ; point es to IVT base
	cli ; disable interrupts
	mov word [es:8*4], timer; store offset at n*4
	mov [es:8*4+2], cs ; store segment at n*4+2
	sti ; enable interrupts
	
	;SHOW CURSOR AGAIN
	mov ch, 6
    mov cl, 7
    mov ah, 1
	int 10h
	
	call printBoard
	call printTimerTag
	call initialiseTheBoard
	call playGame
	
endProg:
	mov word [stopTimer], 1
	call gameExit
	mov ah, 0x00
	int 16h
	mov ax, 0x4c00
	int 21h
	
gameWin:
	mov word [stopTimer], 1
	call gamehead
	pusha
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 0 ; output on page 0
	mov bl, 1101b ; normal attrib
	mov cx, 38 ; length of string
	mov dx, 0x0A14
	push cs
	pop es ; segment of string
	mov bp, gameWinMessage ; offset of string
	int 0x10
	popa
	ret

gameLoss:
	mov word [stopTimer], 1
	call gamehead
	pusha
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, 0 ; output on page 0
	mov bl, 1101b ; normal attrib
	mov cx, 42 ; length of string
	mov dx, 0x0A12
	push cs
	pop es ; segment of string
	mov bp, gameLossMessage ; offset of string
	int 0x10
	popa
	ret
	
gameExit:
	mov word [stopTimer], 1
	call gamehead
	pusha
	mov ah, 0x13 ; service 13 - print string
	mov al, 1 ; subservice 01 – update cursor
	mov bh, [curPage] ; output on page 0
	mov bl, 1101b ; normal attrib
	mov cx, 35 ; length of string
	mov dx, 0x0A15
	push cs
	pop es ; segment of string
	mov bp, gameCloseMessage ; offset of string
	int 0x10
	popa
	ret
	
long_delay:
    push cx
    mov cx, 0xFFFF ; Longer pause for final tone
l2: 
    loop l2
    pop cx
    ret 

sounds:
	pusha
    mov cx, 4 ; Number of tones in the sequence
    mov ax, 2A00h ; Starting frequency value for ascending tones
	loop1:
    mov al, 0FEh
    out 43h, al

    ; Load the counter 2 value for the tone
    out 42h, al ; Low byte
    mov al, ah  ; High byte
    out 42h, al

    ; Turn the speaker on
    in al, 61h
    mov ah, al
    or al, 3h
    out 61h, al

    ; Play the tone and delay
    call long_delay
	call long_delay

    ; Turn the speaker off
    mov al, ah
    out 61h, al

    ; Gradually increase the frequency for ascending tones
    add ax, 0200h ; Smaller increment for smoother progression

    loop loop1

    ; Add a final, sweeter tone
    mov ax, 3200h ; Final tone frequency
    mov al, 0FEh
    out 43h, al

    out 42h, al ; Low byte
    mov al, ah  ; High byte
    out 42h, al

    ; Turn the speaker on
    in al, 61h
    mov ah, al
    or al, 3h
    out 61h, al

    ; Longer delay for final tone
    call long_delay
	call long_delay
	call long_delay

    ; Turn the speaker off
    mov al, ah
    out 61h, al
	
	popa 
	ret
	
key_sound:
	pusha 
    ; Set up tones for the sweet success sound
    mov cx, 2; Number of tones in the sequence
    mov ax, 3F00h ; Starting frequency value for ascending tones
	loop2:
    mov al, 0FEh
    out 43h, al

    out 42h, al ; Low byte
    mov al, ah  ; High byte
    out 42h, al

    ; Turn the speaker on
    in al, 61h
    mov ah, al
    or al, 3h
    out 61h, al

    ; Play the tone and delay
    call long_delay
	call long_delay

    ; Turn the speaker off
    mov al, ah
    out 61h, al

    loop loop2

    ; Add a final, sweeter tone
    mov ax, 3200h ; Final tone frequency
    mov al, 0FEh
    out 43h, al

    out 42h, al ; Low byte
    mov al, ah  ; High byte
    out 42h, al

    ; Turn the speaker on
    in al, 61h
    mov ah, al
    or al, 3h
    out 61h, al

    ; Longer delay for final tone
    call long_delay
	call long_delay
	call long_delay

    ; Turn the speaker off
    mov al, ah
    out 61h, al
	
	popa
	ret