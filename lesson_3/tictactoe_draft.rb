# Tic-tac-toe 

# Overview
  # 2 player game
  # 3 x 3 board
  # Players take turns marking an empty space on board
  # Win condition = 3 marks in a row by 1 player (diagonal including)
  # Tie condition = board filled, no rows by either player

# Video extracts hard values to constants
require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

# Set up and display board
  # puts ""
  # puts "     |     |     "
  # puts "     |     |     "
  # puts "     |     |     "
  # puts "-----+-----+-----"
  # puts "     |     |     "
  # puts "     |     |     "
  # puts "     |     |     "
  # puts "-----+-----+-----"
  # puts "     |     |     "
  # puts "     |     |     "
  # puts "     |     |     "
  # puts ""

  # ^ each row -> element of array
  # note there's 3 rows - each with 3 indices -> that
  # make up all the 9 empty spaces
  
  # video adds:
    # displaying board is repeated, so should define method
    # display board output will be variable dependent on how players
    # mark - which represented by argument, say quadrant 1-9
    
    # data structure suggestions:
    # besides arrays, there's hashes and nested arrays.
    # {1 => 'X', 2 => ' ', 3 => 'O', etc...}
    


  def display_board(brd)
    # system('clear')
    puts ""
    puts "     |     |     "
    puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
    puts "     |     |     "
    puts "-----+-----+-----"
    puts "     |     |     "
    puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
    puts "     |     |     "
    puts ""
  end
  
 def initialize_board
   new_board = {}
   (1..9).each { |quadrant| new_board[quadrant] = INITIAL_MARKER}
   new_board
 end
 
 board = initialize_board
 
 
  # video note: assigning `board` effectively lets us save the board state

# Player Turn

  # Loop
  # Ask player to input 1-9
  # If board[input] == ' '
  #   board[input] == 'X' or 'O'
  #   break
  # else
  #   display error: 
  
  # do we need to do input validation?
  
  def prompt(msg)
    puts "=> #{msg}"
  end
  
  def empty_squares(brd)
    brd.keys.select{|num| brd[num] == INITIAL_MARKER}
  end
  
  def player_places_piece!(brd)
    # what if user inputs something not 1-9? -> new hash key gets created
    # user inputs 1-9 when 1-9 already filled
    loop do 
      prompt "Choose a square #{empty_squares(brd).join(',')}: "
      # ^ video added the dynamic empty squares - pretty clever
      square = gets.chomp
      unless ('1'..'9').include?(square)
        prompt "Please enter a number between 1-9"
        next
      end
      square = square.to_i
      unless brd[square] == INITIAL_MARKER
        prompt "Selected square is already filled."
        next
      end
      brd[square] = PLAYER_MARKER
      # if empty_squares(brd).include?(square.to_i)
        # break
      # else
      #   prompt "Sorry, that's not a valid choice"
      # end
      break
    end
  end
  
# Main game loop

  def computer_places_piece!(brd)
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
  
  def board_full?(brd)
    empty_squares(brd).empty?
  end
  
  def someone_won?(brd)
    !!detect_winner(brd)
  end
  
  def detect_winner(brd)
    winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                    [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                    [[1, 5, 9], [3, 5, 7]]              # diagonals
                    
    winning_lines.each do |line|
      if brd[line[0]] == PLAYER_MARKER && 
         brd[line[1]] == PLAYER_MARKER && 
         brd[line[2]] == PLAYER_MARKER
         return 'Player'
      elsif brd[line[0]] == COMPUTER_MARKER && 
          brd[line[1]] == COMPUTER_MARKER && 
          brd[line[2]] == COMPUTER_MARKER
          return 'Computer'
      end
    end
    nil
  end
  
  loop do
    display_board(board)
    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)
    computer_places_piece!(board)
    display_board(board)
    break if someone_won?(board) || board_full?(board)
  end
  
  display_board(board)
  
  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end
  
  # UI
    start interface prompts
    readability
    Number to space indicator
    clearing space
    
  # Game Features
    # Best of
    # Difficulty Select
    # Toggle who goes first
    # E to exit
    # Sleep
  
  # Unbeatable AI
  
  Design an algorithm for computer that can't lose:
  
  # ================================================
Problem

  Winning lines classification points:
  "possible allocation method consists in assigning a certain win for A(AI) as +1 and for B(player) as −1"
  
  Winning line, 2 Computer Marks == +1
  Winning line, 2 Player Marks == -1

  Scenarios:
    (1) Computer goes first and marks center
      - (2) Player marks corner
        
      - (2) Player marks non-corner
        "   "
        " O "
        " X " <- picking either space on this row ensures win.
          "   "
          " O "
          " XO"
          
          " O "
          " O "
          " X "
          
          "   "
          " OO"
          " X "
          
          "  O"
          " O "
          " X "
    
    (1) Player goes first and marks center
    
    (1) Player goes first and marks non-center
      - (2) Computer marks center
      
    Priority Moves (highest to lowest):
    win -> defend -> mark center -> ??
    
    
Ttt
Priority
Win>defend>5>minmax 
Minmax ->
Each space ->  value integer
Value integer is +1 for every available winning line and -1 for every dead winning line
Select space with highest value int

Dead line = 
Risk line = before computer move, winning line has player but no computer
Available = before computer move, no player marker
Cusp of win = before computer move, space has 2 winning line with 1 computer each no player, +2

Better to evaluate value by board state after comp moves

Scenarios:
Comp first middle-> player corner
Comp first middle-> player non corner -> comp wins

Algo
-recursive method that toggles between picking lowest and highest score (ai picks highest score, next recursive iteration represents players turn assumed most minimizing
-‘calc score’ method inside recursive ‘pick minmax’ method
-array of square options -> array of winnability scores
-in tic-tac-toe there’ll be multiple squares with same winnability score so pick at random
-base case is when board full or winner detected
-bloated inefficient algo but point i think is to check every possible combination of move scenario
Calc_score(
-recursion means we are working in reverse game, the results of the top of the stack (end) are used
for the penultimate and so on.
-fundamental misunderstanding: I was trying to assign minmax value to the move when the wiki says minmax
is assigned to the board state of the game.

Examples / Test Cases

Data Structure

Algorithm

My strat for constructing the algo is first write the beginning of call stack then write the end of call stack

Start of recursive call stack:
`pick_min_max` {1:'X', 2: ' ', etc} -> [1,2,3,etc...] -> 2
`calc_score 2 -> +1

  [-get an array of empty spaces and assign to `markable_squares` <- this can be done in `pick_min_max`]
  -call `pick_min_max` passing in `board` and `maximizing` = true which 
  returns the integer of square that maximizes winnability and assign to `best_option`
  -assign key of `board`[`best_option] to Computer_Marker
  
  `pick_min_max`(`brd`, `maximizing=true)
    `markable_squares` = empty_squares(brd)
    `board_state_value_per_move = {}
    if maximizing = true
      iteratively, ___ `markable_squares`, set `square` to current element
        brd[`square`] = 'COMPUTER_MARKER'
        board_state_value = calc_board_state_value(brd)
        board_state_value_per_move[square] = board_state_value
        brd[`square`] = 'INITIAL_MARKER'
        
    
    elsif maximizing != true (*minimizing instead)
    
  
  epiphany: while struggling to write the beginning, i set my goal to working towards the base case.
    

  
  
  
  # ================================================
  
  
  
  # ================================================
  
  
  
  # ================================================