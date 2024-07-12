# 1 hour, 12 minutes, 30 seconds to complete w/o rubocop
# about 1 h, 20 minutes to also have rubocop done

# Post completion thoughts:
- problem solving stage
  - I found myself jumping early on writing the algo
  - I found myself intermittently coming up with helper methods while I understood the problem

- Cases/Examples
  - this part was shortest by nature

- DS

- algo phase
  - definitely struggled the most here, esp when I was trying to write helper to convert
  diamond size to a list where each element represented the letter for that row

  - also the naming of my methods felt kinda longish

- C
  - I had trouble when writing private class methods, got to resolve that. for some reason
  i opened the eigenclass and no method detected, I think I forgot to remove the `self`, once
  in the eigenclass, I can just define as normal instance methods,
  - glad i decided to test as I coded definitely caught some errors in my logic

- debugging
  - had to fix some logic when calculating distance between letters, should have been based on letter itself
  not by row index

- rubocop


Communication: okay in beginning, but floundered as I was struggling to write the helper methods

Conclusion: overall, my performance was not without hurdles
though I felt like i was in control all throughout process so that''s good
but there were areas for improvement:
1. my thought process was not organized, I feel like there was not clear transition rather I jumped
2. not sure why, but I felt like writing the logic for those helpers took too long
3. debugging still had issues, meaning despite time I spent, pseudocode still had an error

never had time to go back and write a clean summary of pseudocdoe


# g: letters (a-z)
# r: diamond consisting of letters (1 or more rows of strings outputted)

# explicit:
# - 2 halves of diamonds
#   - first half starts ascending from A to midpoint (widest length row)
#   - second half starts from midpoint descends to A

# - the length and width of the diamond are the same
#   # of row (length) = length of each row (width)


# - first and last row only have one A

# implicit
#   - all rows have equal length
#   - no outputs
#   - return value is a single string, where each row ends with a new line "\n"



# What are potential inputs?
# - A-Z, a-z?
#   assume A-Z are only inputs


# DS:
# collection to store the rows? and join the rows into a single string at end

# [A, B, C,.. Z]
# array#index
# [0, 1, 2, 3, 4]

# index * 2 + 1
# ->

# [1, 3, 5]

# 9

# ->

# [A, B, C, D, E, D, C, B, A]

# 1.upto(index(letter))


# ->



# for each iteration based on index (row):
#   -
#   - distance between

# Algo
# iteration, for each row, the letter changes and the distance between each letter of that row changes
# but for each row, the leter is identical
# ^ the index of say a collection represented each row may relate to the distance between the two identical letters

# given a row, how many iterations or how many rows to print?

# helper
# diamond size -> each_row_letter
# [A, B, C, D, E, D, C, B, A] 9 -> 5
# 8 -> 4
# [A, B, C, D, C, B, A]
# 7 ->

# return [A] if diamon_size == 1
# each_row_letter = []

# 0.upto(index(letter)) set idx
# each_row_letter << alphabet[idx]

# (index(letter) - 1).downto(0), set idex
# each_row_letter << alphabet[idx]

# return each_row_letter
# ^ rename to letter_per_row

# transform letter per row into final_rows and then join
# [A, B, C, D, C, B, A]
# #each_with_index.map set, 'letter', 'index'
# - if letter == 'A'
#   row = 'A'
# else
#   get distance between spaces
#   row = "#{letter}{spaces}{letter}"

# get distance_between_space helper method:
# given index, return distance between letters
# 1 -> 1
# 2 -> 3
# 3 -> 5
# 4 -> 7
# 1 + (idx -1) * 2


# row.center(diamond_size) + w



# High levl
#   - given `letter`
#   - get `diamond_size` from letter

class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    diamond_size = get_diamond_size(letter)
    letter_per_row = get_letter_per_row(letter, diamond_size)

    letter_per_row.each_with_index.map do |letter, idx| # rubocop helped spot this, we're not using index, var shaodwing
      if letter == 'A'
        row = 'A'
      else
        distance_between_letters = get_distance_between_letters(letter)
        row = letter + (" " * distance_between_letters) + letter
      end
      row.center(diamond_size) + "\n"
    end.join

  end

  def self.get_diamond_size(letter)
    ALPHABET.index(letter) * 2 + 1
  end

  def self.get_letter_per_row(letter, diamond_size)
    return ['A'] if diamond_size == 1
    letter_per_row = []
    0.upto(ALPHABET.index(letter)) { |index| letter_per_row << ALPHABET[index] }
    (ALPHABET.index(letter) - 1).downto(0) { |index| letter_per_row << ALPHABET[index] }
    letter_per_row
  end

  def self.get_distance_between_letters(letter)
    1 + (ALPHABET.index(letter) - 1) * 2
  end
end