21:
V1 overview:
Initialize deck
(Player draws, dealer draws) x2
Start loop
Display player cards and 1 dealer card
Prompt player to hit or stay
Dealer evaluates and chooses to hit or stay
Ask if both stay, exit loop
Loop back
Determine winner and display 

V1 corrections:
Forgot check if player busts, player draw phase and bust evaluation finishes before computer turn starts

V2:
  Game Flow:
    Intro
    Game

  Assets:
    Data + Data Structures
    Graphics

Organize/Categorize by:
  High Level
    Components
    Abstraction level
    Minimum Viable vs Bonus Features
  
  Mid Level
    Variables vs Methods
  Low Level

# ============================================================

Goal: Make a 21 card game
  Refresh Understanding - Game Overview:
    13 card values (2, 3, 4,...J, Q, K, A) for 
    4 suits (hearts, diamonds, clubs, and spades)
    
    J, Q, K == 10
    *Ace''s value depends on situation, can be either 1 or 11.
    
    Player vs Dealer
    
    Both draw 2 cards initially. Player sees his hand and one of dealer''s cards.
    
    Parties don''t alternate drawing during game flow. Player draws first, decides whether
    to keep drawing, and finishes draws before dealer draws.
    2 Actions player can take. Hit = draw, Stay = not draw and move on to dealer''s actions.
    
    Player loses if draws over 21 value sum - event is called a bust.
    
    Dealers draw logic: stop drawing once sum in hand is over 17.
    
    Dealer can bust too.
    
    Whoever gets closest to 21 wins
  Data structure for deck and cards:
  
  Ace value method:
  
  Player Turn:
  
  Dealer Turn:
  

Data Structure:



Algorithm:
  Setup
    Initialize deck of cards
      Shuffle
      Insert Ace value calculator method
    Deal cards
  Player Turn
    Display player hand and dealer card
    Display info hub
      Goal of game
      Current sum
      Options to hit or stay
  Dealer Turn
  Determine and Display Winner
  
Bonus: (Add these after minimum version is made)
  Graphics for player and dealer hands (dynamic)




# ============================================================

# Variables
deck
player_hand
computer_hand
hands -> {Player: [player_hand], Dealer: [computer_hand]}
current_player -> 'Player' or 'Dealer'

# Methods
  # Components
    # Initialization
      adjust_aces_values
      compute_sum_in_hand(hand)
      initialize_deck
    # Game logic
      alternate_player(current_player)
      hit!(current_player, hands)
      stay
      bust?(hand)
        compute_sum_in_hand(hand)
    # Player Turn
      
    # Computer Turn
    # Win Results

Display board
Prints row by row
Frame - 2 rectangles. Dealer and player 
Have hard coded areas and dynamic empty slots 

Alt 1:
1 row max cards, like say 8, cycles with arrow key left right


After dealing cards, after each hit player or comp
Update computer hand
  Show first card
  Empty placeholder car for all other 
  
Animation
Yaml

Other students good ideas:
Constants - score 21
Dealer min
Saying hearts instead of h
Message after draw saying received

Messaging system
Display motif variables - blank line, separator
Sequencing for enhanced ux - sleep and messages

Improve UX
  clearing screen
  showing dealer hand at end
  
Can include an improvements section as comment.

# ============================================================

Improving Graphics:

╔═══╗
║9  ║
║ ♥ ║
║  9║
╚═══╝

puts <<-CARD
  ╔═══╗
  ║10 ║
  ║ ♥ ║
  ║ 10║
  ╚═══╝
CARD
# Account for 10

puts <<-CARD
  ╔═══╗
  ║#{9}  ║
  ║ ♥ ║
  ║  9║
  ╚═══╝
CARD

# ============================================================

What I like about twenty-one game - first commit
  overall surprised by how display_length constant easily adjusts display allowing me
  to play on coderpad which is less than default 80
  
  grouped my methods.
  
  methods need work.
  
# ============================================================

Post code-review revisions:
- removed self evident, tried to make wording less algorithmic looking
- renamed `who` parameters to `hand_holder`
- eliminated `player_choosing` parameter by moving prompt 'hit or stay' into `play_hit_stay`

- changed gameplay, revealed dealer's hand when dealer's turn