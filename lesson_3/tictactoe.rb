INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]]              # diagonals
# Game board and scores:
def prompt(msg)
  puts "=> #{msg}"
end

def initialize_board
  new_board = {}
  (1..9).each { |quadrant| new_board[quadrant] = INITIAL_MARKER }
  new_board
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, round, total_matches, scores)
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
  if round > 1
    prompt "Player score: #{scores[:Player]}, " \
           "Computer score: #{scores[:Computer]}"
  end
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
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

def update_scores!(winner, scores)
  if winner == 'Player'
    scores[:Player] += 1
  elsif winner == 'Computer'
    scores[:Computer] += 1
  end
end

def display_grand_winner(scores)
  prompt "Final player score: #{scores[:Player]}, " \
         "Final computer score: #{scores[:Computer]}"
  case scores[:Player] <=> scores[:Computer]
  when 0
    prompt 'Game Over.'
  when 1
    prompt 'You are the grand winner! Game Over.'
  when -1
    prompt 'Computer is the grand winner! Game Over.'
  end
end

# Initiating settings by user input:
def select_setting(setting, input)
  case setting
  when 'Difficulty'
    input == '1' ? 'Easy' : 'Normal'
  when 'Total Matches'
    input.to_i
  when 'Who First'
    case input
    when '1'
      'Player'
    when '2'
      'Computer'
    end
  end
end

def validate_input(setting, msg, valid_options)
  loop do
    prompt msg
    input = gets.chomp
    return select_setting(setting, input) if valid_options.include?(input)
    return %w(Player Computer).sample if setting == 'Who First' && input == '3'
    sleep 1
    prompt "Sorry, that's not a valid response."
  end
end

def initiate_settings
  difficulty = validate_input('Difficulty', 'Please select ' \
  "the computer's difficulty:
    \n   1 - Easy
    \n   2 - Normal", %w(1 2))
  total_matches = validate_input('Total Matches', 'Please ' \
    'select number of matches this game:
    (3, 5 or 7)', %w(3 5 7))
  who_first = validate_input('Who First', 'Please select who ' \
    "gets first turn of match 1:
    \n 1 - You (Player)
    \n 2 - Computer
    \n 3 - Random", %w(1 2))

  [difficulty, total_matches, who_first]
end

# Player turn helpers:
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

def process_player_input(brd, input, help_guide_open)
  return nil if input.start_with?('h') && !help_guide_open

  if empty_squares(brd).include?(input.to_i)
    brd[input.to_i] = PLAYER_MARKER
    true
  else
    prompt "Sorry, that's not a valid choice"
    false
  end
end

def display_help_guide?(help_guide_open, input = '')
  if input.start_with?('h') && help_guide_open == 'false'
    prompt 'Enter a number to mark the corresponding empty square:'
    puts ' 1 | 2 | 3 '
    puts '---+---+---'
    puts ' 4 | 5 | 6 '
    puts '---+---+---'
    puts ' 7 | 8 | 9 '
    help_guide_open.replace('true')
  end
  help_guide_open == 'true'
end
# Computer turn helpers:

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
# Main actions:

def alternate_player(current_player)
  current_player == 'Player' ? 'Computer' : 'Player'
end

def player_places_piece!(brd)
  help_guide_open = 'false'.dup
  loop do
    msg = "Choose a square to mark: #{joinor(empty_squares(brd))}"
    msg += ' (enter h for help)' unless display_help_guide?(help_guide_open)
    prompt msg
    input = gets.chomp
    break if
      process_player_input(brd, input, display_help_guide?(help_guide_open))

    display_help_guide?(help_guide_open, input)
  end
end

def computer_places_piece!(brd, difficulty)
  if difficulty == 'Easy'
    play_easy(brd)
  elsif difficulty == 'Normal'
    play_normal(brd)
  end
end

def place_piece!(board, current_player, difficulty)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board, difficulty)
  end
end
# main game loop
loop do
  system 'clear'
  prompt 'Welcome to Tic-Tac-Toe!'
  sleep 1
  difficulty, total_matches, who_first = initiate_settings
  scores = { Player: 0, Computer: 0 }

  total_matches.times do |round|
    sleep 2 if round > 0
    current_player = who_first
    who_first = alternate_player(who_first)
    board = initialize_board
    display_board(board, round + 1, total_matches, scores)

    loop do
      sleep 1 if current_player == 'Computer'
      place_piece!(board, current_player, difficulty)
      display_board(board, round + 1, total_matches, scores)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      match_winner = detect_match_winner(board)
      prompt "#{match_winner} won!"
    else
      prompt "It's a tie!"
    end

    update_scores!(match_winner, scores)

    display_grand_winner(scores) if round == total_matches - 1
  end

  prompt 'Would you like to restart the game? (y/n)'
  answer = gets.chomp
  next if answer.start_with?('y')
  break
end

prompt 'Thanks for playing Tic-Tac-Toe!'
prompt 'Goodbye!'
