# Tic-tac-toe

# Overview
# 2 player game
# 3 x 3 board
# Players take turns marking an empty space on board
# Win condition = 3 marks in a row by 1 player (diagonal including)
# Tie condition = board filled, no rows by either player
# Video extracts hard values to constants

# frozen_string_literal: true

require 'pry'
require 'pry-byebug'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
# =========================================================
def prompt(msg)
  puts "=> #{msg}"
end

def initiate_settings
  difficulty = get_and_validate_input('Difficulty', "Please select the computer's difficulty:
    \n   1 - Easy
    \n   2 - Normal", %w[1 2])
  total_matches = get_and_validate_input('Total Matches', 'Please select number of matches this game:
  (3, 5 or 7)', %w[3 5 7])
  who_first = get_and_validate_input('Who First', 'Would you like to choose who goes first? (y/n)', ['y'])
  [difficulty, total_matches, who_first]
end

def get_and_validate_input(setting, msg, valid_options)
  loop do
    prompt msg
    input = gets.chomp
    input = input[0].downcase if setting == 'Who First'
    return select_setting(setting, input) if valid_options.include?(input)

    sleep 1
    if ['Difficulty', 'Total Matches'].include?(setting)
      prompt "Sorry, that's not a valid response."
    elsif setting == 'Who First'
      return %w[Player Computer].sample
    end
  end
end

def select_setting(setting, input)
  case setting
  when 'Difficulty'
    input == '1' ? 'Easy' : 'Normal'
  when 'Total Matches'
    input.to_i
  when 'Who First'
    prompt 'Will you go first? (y/n)'
    answer = gets.chomp
    answer.start_with?('y') ? 'Player' : 'Computer'
  end
end

def joinor(empty_squares_arr, delimiter = ', ', conjunction = 'or')
  case empty_squares_arr.size
  when 0 then ''
  when 1 then empty_squares_arr[0]
  when 2 then empty_squares_arr.join(" #{conjunction} ")
  else
    joined_squares = empty_squares_arr.join(delimiter)
    joined_squares.insert(-2, "#{conjunction} ")
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |quadrant| new_board[quadrant] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, round, total_matches)
  system 'clear'
  puts ''
  puts '     |     |     '
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts '     |     |     '
  puts '-----+-----+-----'
  puts '     |     |     '
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts '     |     |     '
  puts ''
  prompt "Match #{round} of #{total_matches}"
  prompt "You're #{PLAYER_MARKER}. Computer's #{COMPUTER_MARKER}." if round == 1
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_help_guide
  prompt 'Enter a number to mark the corresponding empty square:'
  puts ' 1 | 2 | 3 '
  puts '---+---+---'
  puts ' 4 | 5 | 6 '
  puts '---+---+---'
  puts ' 7 | 8 | 9 '
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  help_guide_open = false
  loop do
    msg = "Choose a square to mark: #{joinor(empty_squares(brd))}"
    msg += ' (enter h for help)' unless help_guide_open
    prompt msg
    square = gets.chomp
    if square.start_with?('h') && !help_guide_open
      display_help_guide
      help_guide_open = true
      next
    end
    if empty_squares(brd).include?(square.to_i)
      brd[square.to_i] = PLAYER_MARKER
      break
    else
      prompt "Sorry, that's not a valid choice"
    end
  end
end

def computer_places_piece!(brd, difficulty)
  if difficulty == 'Easy'
    play_easy(brd)
  elsif difficulty == 'Normal'
    play_normal(brd)
  end
end

def play_easy(brd)
  random_square = empty_squares(brd).sample
  brd[random_square] = COMPUTER_MARKER
end

def play_normal(brd)
  if detect_winning_square(brd)
    brd[detect_winning_square(brd)] = COMPUTER_MARKER
  elsif detect_at_risk_square(brd)
    brd[detect_at_risk_square(brd)] = COMPUTER_MARKER
  elsif empty_squares(brd).include?(5)
    brd[5] = COMPUTER_MARKER
  else
    random_square = empty_squares(brd).sample
    brd[random_square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_match_winner(brd)
end

def detect_match_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).all?(PLAYER_MARKER)
      return 'Player'
    elsif brd.values_at(*line).all?(COMPUTER_MARKER)
      return 'Computer'
    end
  end
  nil
end

def update_and_display_scores(winner, player_score, comp_score)
  if winner == 'Player'
    player_score += 1
  elsif winner == 'Computer'
    comp_score += 1
  end
  prompt "Player score: #{player_score}, Computer score: #{comp_score}"
  [player_score, comp_score]
end

def detect_at_risk_square(brd)
  WINNING_LINES.each do |line|
    next if brd.values_at(*line).count(PLAYER_MARKER) != 2

    line.each do |square|
      return square if brd[square] == INITIAL_MARKER
    end
  end
  nil
end

def detect_winning_square(brd)
  WINNING_LINES.each do |line|
    next if brd.values_at(*line).count(COMPUTER_MARKER) != 2

    line.each do |square|
      return square if brd[square] == INITIAL_MARKER
    end
  end
  nil
end

def place_piece!(board, current_player, difficulty)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board, difficulty)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def display_grand_winner(player_score, computer_score)
  case player_score <=> computer_score
  when 0
    prompt 'Game Over.'
  when 1
    prompt 'You are the grand winner! Game Over.'
  when -1
    prompt 'Computer is the grand winner! Game Over.'
  end
end
# =========================================================
prompt 'Welcome to Tic-Tac-Toe!'
sleep 1
difficulty, total_matches, who_first = initiate_settings
player_score = 0
computer_score = 0

total_matches.times do |round|
  current_player = who_first
  who_first = alternate_player(who_first)
  board = initialize_board
  display_board(board, round + 1, total_matches)

  loop do
    sleep 1 if current_player == 'Computer'
    place_piece!(board, current_player, difficulty)
    display_board(board, round + 1, total_matches)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  if someone_won?(board)
    match_winner = detect_match_winner(board)
    prompt "#{match_winner} won!"
  else
    prompt "It's a tie!"
  end

  player_score, computer_score = update_and_display_scores(match_winner, player_score, computer_score)

  if round == total_matches - 1
    display_grand_winner(player_score, computer_score)
  else
    prompt 'Start next match? (y/n)'
    answer = gets.chomp
    break if answer.downcase.start_with?('n')
  end
end

prompt 'Thanks for playing Tic-Tac-Toe!'
prompt 'Goodbye!'
