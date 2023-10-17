21:
Initialize deck
(Player draws, dealer draws) x2
Display player cards and 1 dealer card
Start loop
Prompt player to hit or stay
Dealer evaluates and chooses to hit or stay
Ask if both stay, exit loop
Loop back
Determine winner and display 

Forgot check if player busts

V2:
  Game Flow:
    Intro
    Game

  Assets:
    Data + Data Structures
    Graphics
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



# ============================================================




# ============================================================