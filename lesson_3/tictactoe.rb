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
player_score = 0
computer_score = 0
# =========================================================
def prompt(msg)
  puts "=> #{msg}"
end

def select_settings
  difficulty = validate_user_input('Difficulty', "Please select the computer's difficulty:
    \n   1 - Easy
    \n   2 - Normal", %w[1 2])
  total_matches = validate_user_input('Total Matches', 'Please select number of matches this game:
  (3, 5 or 7)', %w[3 5 7])
  current_player = validate_user_input('Who First', 'Would you like to choose who goes first? (y/n)', ['y'])
  [difficulty, total_matches, current_player]
end

def validate_user_input(setting, msg, valid_options)
  loop do
    prompt msg
    input = gets.chomp
    input = input[0].downcase if setting == 'Who First'
    if valid_options.include?(input)
      case setting
      when 'Difficulty'
        return input == 1 ? 'Easy' : 'Normal'
      when 'Total Matches'
        return input.to_i
      when 'Who First'
        prompt 'Will you go first? (y/n)'
        input = gets.chomp
        return input.start_with?('y') ? 'Player' : 'Computer'
      end
    else
      sleep 1
      if ['Difficulty' 'Total Matches'].include?(setting)
        prompt "Sorry, that's not a valid response."
      elsif setting == 'Who First'
        return %w[Player Computer].sample
      end
    end
  end
end

def joinor(empty_squares_arr, delimiter = ', ', conjunction = 'or')
  case empty_squares_arr.size
  when 0 then ''
  when 1 then empty_squares_arr[0]
  when 2 then empty_squares_arr.join(" #{conjunction} ")
  else
    joined_squares = empty_squares_arr.join("#{delimiter}")
    joined_squares.insert(-2, "#{conjunction} ")
  end
end

def initialize_board
  new_board = {}
  (1..9).each { |quadrant| new_board[quadrant] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd)
  # system('clear')
  puts "You're #{PLAYER_MARKER}. Computer's #{COMPUTER_MARKER}."
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
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  loop do
    prompt "Choose a square to mark: #{joinor(empty_squares(brd))}"
    square = gets.chomp
    if empty_squares(brd).include?(square.to_i)
      brd[square.to_i] = PLAYER_MARKER
      break
    else
      prompt "Sorry, that's not a valid choice"
    end
  end
end

def computer_places_piece!(brd)
  if detect_winning_square(brd)
    brd[detect_winning_square(brd)] = COMPUTER_MARKER
  elsif detect_at_risk_square(brd)
    brd[detect_at_risk_square(brd)] = COMPUTER_MARKER
  elsif empty_squares(brd).include?(5)
    brd[5] = COMPUTER_MARKER
  else
    square = empty_squares(brd).sample
    brd[square] = COMPUTER_MARKER
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd, check_grand_winner = false, player_score = 0, computer_score = 0)
  if check_grand_winner
    return true if player_score >= 5 || computer_score >= 5
    false
  else
    !!detect_match_winner(brd)
  end
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

def update_score(winner, player_score, comp_score)
  if winner == 'Player'
    player_score += 1
  else
    comp_score += 1
  end
  return player_score, comp_score
end

def detect_at_risk_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 2
      line.each do |square|
        if brd[square] == INITIAL_MARKER
          return square
        end
      end
    end
  end
  nil
end

def detect_winning_square(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(COMPUTER_MARKER) == 2
      line.each do |square|
        if brd[square] == INITIAL_MARKER
          return square
        end
      end
    end
  end
  nil
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end
# =========================================================
prompt 'Welcome to Tic-Tac-Toe!'
sleep 1
difficulty, total_matches, who_first = select_settings
binding.pry

loop do
  board = initialize_board
  loop do
    display_board(board) if current_player == 'Player'
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    match_winner = detect_match_winner(board)
    player_score, computer_score = update_score(match_winner, player_score, computer_score)
    prompt "#{match_winner} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Player score: #{player_score}, Computer score: #{computer_score}"

  if someone_won?(board, true, player_score, computer_score)
    prompt "#{match_winner} won 5 times! Game Over."
    break
  end

  prompt 'Play again? (y/n)'
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt 'Thanks for playing Tic-Tac-Toe!'
prompt 'Goodbye!'
