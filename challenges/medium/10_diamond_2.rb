# frozen_string_literal: true

# class
class Diamond
  ALPHABET = ('A'..'Z').to_a

  # LETTER_TO_ROW_WIDTH = {}
  # ALPHABET.each_with_index do |letter, idx|
  #   LETTER_TO_ROW_WIDTH[letter] = 2 * idx + 1
  # end

  # ^ changing this to appease needing to freeze constant suggestion of rubocop
  LETTER_TO_ROW_WIDTH = ALPHABET.each_with_index.with_object({}) do |(letter, idx), hash|
    hash[letter] = 2 * idx + 1
  end.freeze

  def self.make_diamond(letter)
    return 'A' if letter == 'A'

    max_width = LETTER_TO_ROW_WIDTH[letter]
    letters_to_print = LETTER_TO_ROW_WIDTH.select { |row_letter, _| row_letter <= letter }
    generate_rows(letters_to_print, max_width)
  end

  class << self
    private

    def generate_rows(letters_to_print, max_width)
      list_of_rows = []
      letters_to_print.reverse_each do |row_letter, row_width| # another unused parameter, i realize hash is not appropriate
      # here, I could have reverse iterated letters only and used a single purpose method to get the distance_betwen_letters
        current_row = letter_to_row(row_letter, max_width) # we can start with list of rows as the max row in an array and reverse iterate from remaining smaller letters
        if list_of_rows.empty?  
          list_of_rows << current_row
        else
          list_of_rows.insert(0, current_row)
          list_of_rows.insert(-1, current_row)
        end
      end
      list_of_rows.join
    end

    def letter_to_row(letter, max_width) # this method can probably be condensed into a single string interpolation
      row = ' ' * LETTER_TO_ROW_WIDTH[letter]
      row[0] = letter
      row[-1] = letter
      "#{row.center(max_width)}\n"
    end
  end
end

puts Diamond.make_diamond('E')

# Refactoring pseudocode:
- given letter
- return 'A' if 'A'
- given array of letters set to ALPHABET
- get and assign to `max_width`
- call `gen_row(current_letter)` and place in `list_of_rows` array
- reverse_iterate from subset of ALPHABET less than letter, set `row_letter`
  - get and assign `current_row
  - list_of_rows = current_row + list_of_rows + current_row
- return list_of_rows joined

`gen_row(letter, max_width)`
- "#{letter}#{' ' * dis_between_letter(letter)}#{letter}".center(max_width) + "\n"

`dis_between_letter`(letter)`
ALPBAHET.index(letter) * 2 + 1 - 2