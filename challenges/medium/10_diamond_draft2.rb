# Refactor
# Redefine the problem:

# Algo:
# Let''s adjust the iteration:
# instead of iterating from row 1,
# lets iterate from the longest row and concat "sandwich" style

# iterate down from the letter to letter A
#   (each letter has a specific distance part)
#   ()
#   iterate down from diamond_size until 1



# helper values:
# letter -> diamond size
# - exception for letter A
# letter -> row size

# letter_
# row = " " * row_size
# row[0], row[-1] = letter, letter
# row.center(diamond_size)

# High Lvl
# - get diamond size from input letter and set row_size == diamond size, loop from row_size
# down to 1 by iterations of -2 (using Numeric#step), with []
# - when array empty << once
# else insert at beginning and end
# umm. pause

# While refactoring, I realized the complexity is because there are multiple attributes
# to track over the iteration, and challenge is selecting which attribute to iterate over
# and figuring out the relationship of those other attributes to the attribute being iterate over

# Here, each iteration we must track:
# - row size
# - letter of that row

# {
# A -> 1
# B -> 3
# C -> 5
# }

# ^ after I realized each letter has a unique row size, we can just represenet them as a key_value pair
# and iterate through them so we have both values to construct each row per iteration

# return 'A' if letter = 1

# we create the letter => row size hash
# we select the subhash that have keys equal and less than input letter
# set list_of_rows = []
# we reverse iterate through subhash, set 'row_letter' and 'row_size'
#   - call `generate_row` assign to current_row
#   - if list_of_rows empty
#     concat current row to
#   else
#     insert current row to begin and end of list of rows
# return list of rows joined

class Diamond
  ALPHABET = ('A'..'Z').to_a

  LETTER_TO_ROW_WIDTH = {}
  ALPHABET.each_with_index do |letter, idx|
  LETTER_TO_ROW_WIDTH[letter] = 2 * idx + 1
  end

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
      letters_to_print.reverse_each do |row_letter, row_width|
        current_row = letter_to_row(row_letter, max_width)
        if list_of_rows.empty?
          list_of_rows << current_row
        else
          list_of_rows.insert(0, current_row)
          list_of_rows.insert(-1, current_row)
        end
      end
      list_of_rows.join
    end

    def letter_to_row(letter, max_width)
      row = " " * LETTER_TO_ROW_WIDTH[letter]
      row[0], row[-1] = letter, letter
      row.center(max_width) + "\n"
    end
  end
end

puts Diamond.make_diamond('E')