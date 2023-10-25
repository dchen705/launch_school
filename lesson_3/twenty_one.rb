VALUES = ('2'..'10').to_a + ['J', 'Q', 'K', 'A']
SUITS = ['♥', '♦', '♣', '♠']

MAX_SUM = 21 # maximum value before bust
DEALER_MIN = 17 # minimum value for dealer to stay
DISPLAY_LENGTH = 80
# -------------------- MESSAGING METHODS --------------------
# MESSAGING > HELPERS
def prompt(msg)
  puts ">> #{msg}"
end

def reply(msg, delay: 0.75)
  prompt(msg)
  sleep delay
end

def put_empty_line
  puts
end

def put_line_border
  puts '-' * DISPLAY_LENGTH
end

def display_centered(title)
  puts title.center(DISPLAY_LENGTH)
end

# MESSAGING > INTRO PHASE
def display_welcome
  system 'clear'
  display_centered('======== Welcome to Twenty-One ========')
  put_empty_line
  put_line_border
  display_centered('HOW TO PLAY:')
  display_rules
  put_line_border
  put_empty_line
  prompt "Press enter to start"
  gets
end

def display_rules
  puts <<-RULES
WIN CONDITION: Player vs Dealer - Whoever draws a hand closest to 21 without
going over wins. Going over 21 is an immediate loss and is called a bust.

CARD VALUES:
  - 1-10 are face value
  - Jack, Queen, King are worth 10.
  - Ace is worth 11 unless being worth 11 causes sum in hand to be over 21 in
    which case that Ace is worth 1.

GAME FLOW:
  1) INTIAL DEAL
    - Both Parties are dealed 2 cards.
  2) PLAYER TURN
    - Player can see own hand and 1 of Dealer's cards.
    - During each turn, both Parties can choose 1 of 2 actions.
        1) Hit = draw (*can keep drawing until stay or bust)
        2) Stay = not draw and end turn
    - If Player stays before busting, Dealer's turn starts.
  3) DEALER TURN
    - Dealer will keep hitting until at least 17
    - If both Parties stay and neither bust, then...
  4) DECIDE WINNER
  RULES
end

# MESSAGING > RESULTS
def display_winner(winner, hand_sums)
  puts "Dealer sum: #{hand_sums[:Dealer]}"
  case winner
  when :Player
    prompt 'You won the match!'
  when :Dealer
    prompt 'Dealer won the match!'
  else
    prompt "It's a tie!"
  end
end

def display_grand_winner(scoreboard)
  case scoreboard['Scores'][:Player] <=> scoreboard['Scores'][:Dealer]
  when 1
    reply "You are the grand winner!"
  when -1
    reply "Dealer is the grand winner!"
  when 0
    reply "There's no grand winner. It's a tie!"
  end
end
# -------------------- GAME FLOW METHODS --------------------
# GAME FLOW > INITIAL

def select_best_of
  prompt "How many rounds would you like to play? (3, 5, 7)"
  loop do
    answer = gets.chomp
    if %w(3 5 7).include?(answer)
      reply "Ok, we'll play best of #{answer}."
      return answer.to_i
    else
      prompt "Sorry, that's not a valid choice. Please enter 3, 5 or 7."
    end
  end
end

def initialize_deck
  deck = SUITS.product(VALUES)
  deck.shuffle!
end

# GAME FLOW > DISPLAY

def display_board(hands, hand_sums, scoreboard, player_choosing: false,
                  end_game: false)
  system 'clear'
  score_msg = "Player: #{scoreboard['Scores'][:Player]}, " \
              "Dealer: #{scoreboard['Scores'][:Dealer]}"
  display_centered("Round #{scoreboard['Current Round']} of " \
                   "#{scoreboard['Total Rounds']}")
  puts score_msg.rjust(DISPLAY_LENGTH)
  display_hand(:Dealer, hands, end_game: end_game)

  put_line_border
  display_hand(:Player, hands)
  puts "Player sum: #{hand_sums[:Player]}"
  prompt 'Hit or stay?' if player_choosing
end

def display_hand(who, hands, end_game: false)
  # Example Card Structure:
  # ['♥', '2']
  # Example Hand Structure:
  # [["♣", "6"], ["♥", "6"], ["♣", "2"]]
  puts "#{who}'s Hand:"
  return if hands[who].empty?
  hand = [hands[who][0]] + hands[who][1..-1].map { ['?', ' '] }
  hand = hands[who] if end_game || who == :Player
  hand = graphicalize_hand(hand)
  puts hand
end

def graphicalize_hand(hand)
  set_of_cards_as_rows = graphicalize_each_card_then_split_into_rows(hand)
  set_of_unjoined_graphic_rows = []
  num_of_rows_to_print = set_of_cards_as_rows[0].size
  num_of_rows_to_print.times { set_of_unjoined_graphic_rows << [] }

  set_of_cards_as_rows.each do |set_of_card_lines|
    set_of_card_lines.each_with_index do |line, idx|
      set_of_unjoined_graphic_rows[idx] << line
    end
  end
  set_of_unjoined_graphic_rows.map(&:join)
end

def graphicalize_each_card_then_split_into_rows(hand)
  hand.reduce([]) do |set_of_cards_as_rows, (suit, value)|
    card = <<-CARD
      ╔═══╗
      ║#{value}  ║
      ║ #{suit} ║
      ║  #{value}║
      ╚═══╝
    CARD
    card_as_rows = card.split("\n")
    if value == '10'
      card_as_rows[1].slice!(card_as_rows[1].index('10') + 2)
      card_as_rows[-2].slice!(card_as_rows[-2].index('10') - 1)
    end
    set_of_cards_as_rows << card_as_rows
  end
end
# GAME FLOW > TURN CONTROL

def draw!(who, deck, hands)
  hands[who] << deck.pop
end

def starting_deal(deck, hands)
  4.times do |n|
    who_draws = n.even? ? :Player : :Dealer
    reply 'Dealing...'
    draw!(who_draws, deck, hands)
    system 'clear'
    display_hand(:Dealer, hands)
    put_line_border
    display_hand(:Player, hands)
  end
end

def player_turn(deck, hands, hand_sums, scoreboard)
  update_hand_sums!(:Player, hands, hand_sums)
  display_board(hands, hand_sums, scoreboard, player_choosing: true)
  play_hit_stay(deck, hands, hand_sums, scoreboard)
  display_board(hands, hand_sums, scoreboard)
  reached_max(hand_sums, try_display: true)
end

def dealer_turn(deck, hands, hand_sums, scoreboard)
  reply "Dealer's turn starts."
  loop do
    break if hand_sums[:Dealer] >= DEALER_MIN || bust?(:Dealer, hand_sums)
    reply('Dealer is deciding...', delay: 1.5)
    draw!(:Dealer, deck, hands)
    update_hand_sums!(:Dealer, hands, hand_sums)
    display_board(hands, hand_sums, scoreboard, player_choosing: false)
    reply('Dealer decided to hit.', delay: 1)
  end
end

def play_hit_stay(deck, hands, hand_sums, scoreboard)
  loop do
    break if reached_max(hand_sums)
    answer = gets.chomp
    if answer.start_with?('h')
      hit!(deck, hands, hand_sums)
      break if bust?(:Player, hand_sums) || reached_max(hand_sums)
      display_board(hands, hand_sums, scoreboard, player_choosing: true)
    elsif answer.start_with?('s')
      reply 'You decided to stay!'
      break
    else
      prompt 'Please enter (h)it or (s)tay.'
    end
  end
end

def hit!(deck, hands, hand_sums)
  reply 'You decided to hit!'
  draw!(:Player, deck, hands)
  update_hand_sums!(:Player, hands, hand_sums)
end
# -------------------- CALCULATION METHODS --------------------
# CALCULATION > HAND

def bust?(who, hand_sums)
  hand_sums[who] > MAX_SUM
end

def reached_max(hand_sums, try_display: false)
  if try_display && hand_sums[:Player] == MAX_SUM
    reply "You reached the max sum of #{MAX_SUM}."
  end
  hand_sums[:Player] == MAX_SUM
end

def update_hand_sums!(who, hands, hand_sums)
  return if hands[who].empty?
  aces_counter = 0
  sum = hands[who].reduce(0) do |run_total, card|
    value = card[1]
    if value == 'A'
      aces_counter += 1
      run_total + 11
    elsif value.to_i == 0 # Jack, Queen, or King
      run_total + 10
    else
      run_total + value.to_i
    end
  end
  hand_sums[who] = adjust_aces(sum, aces_counter)
end

def adjust_aces(sum, aces_counter)
  aces_counter.times { sum -= 10 if sum > MAX_SUM }
  sum
end

# CALCULATION > SCORES
def update_score!(winner, scoreboard)
  scoreboard['Scores'][winner] += 1 if [:Player, :Dealer].include?(winner)
end

def decide_winner(hand_sums)
  case hand_sums[:Player] <=> hand_sums[:Dealer]
  when 1
    :Player
  when 0
    :Tie
  when -1
    :Dealer
  end
end
# -------------------- MAIN GAME LOOP --------------------
loop do
  display_welcome
  total_rounds = select_best_of
  scoreboard = { 'Total Rounds' => total_rounds, 'Current Round' => 1,
                 'Scores' => { Player: 0, Dealer: 0 } }
  total_rounds.times do |round|
    scoreboard['Current Round'] += 1 if round > 0
    hands = { Player: [], Dealer: [] }
    hand_sums = { Player: 0, Dealer: 0 }

    deck = initialize_deck

    starting_deal(deck, hands)

    player_turn(deck, hands, hand_sums, scoreboard)

    if bust?(:Player, hand_sums)
      update_score!(:Dealer, scoreboard)
      display_board(hands, hand_sums, scoreboard, end_game: true)
      prompt 'You busted. You lose!'
    else
      dealer_turn(deck, hands, hand_sums, scoreboard)

      if bust?(:Dealer, hand_sums)
        update_score!(:Player, scoreboard)
        display_board(hands, hand_sums, scoreboard, end_game: true)
        prompt "Dealer busted. You win!"
        puts "Dealer sum: #{hand_sums[:Dealer]}"
      else
        winner = decide_winner(hand_sums)
        update_score!(winner, scoreboard)
        display_board(hands, hand_sums, scoreboard, end_game: true)
        prompt "Dealer decided to stay."
        display_winner(winner, hand_sums)
      end
    end
    unless round == total_rounds - 1
      prompt 'Press enter for next round.'
      gets
    end
  end
  display_grand_winner(scoreboard)
  prompt 'Restart game? (y/n)'
  answer = gets.chomp
  break if answer.start_with?('n')
  reply "Ok, restarting game..."
end

puts "Thanks for playing Twenty-One! Goodbye."

# Possible Improvements:
## - either changing `graphicalize_hand` method or
##   breaking apart the `graphicalize_each_card_then_split_into_rows`
##   method (to make easier to understand).
## - further abstracting out the main game loop
