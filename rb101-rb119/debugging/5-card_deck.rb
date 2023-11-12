# We started working on a card game but got stuck. Check out why the code below raises a TypeError.

# Once you get the program to run and produce a sum, you might notice that the sum is off: It's lower than it should be. Why is that?

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map do |card| # change to map!
    score(card)
  end
  sum += remaining_cards.sum # reassignment unnecessary
end

puts sum

# Taking few minutes to understand the problem
# Taking few minutes to understand #reduce here.

# On line 33, the Enumerable#reduce call (not Array#reduce) is iterating through each suit set, but on line 38, a type error is raised because we are calling Array#sum method on an array object that sometimes contains a mix of integers and symbols (from :jack, :queen, etc...). Funnily enough, on line 34-36, array#map is called on the array object for remaining cards but nothing is done with the transformed array returned by this method because map returns a new array which was never used. To fix this, simplest solution is to change to the mutative #map method so that `remaining_cards` elements all get transformed by the `score` method within the #map block. 
# spent over 30 minutes - couldn't figure out 2nd part of question..