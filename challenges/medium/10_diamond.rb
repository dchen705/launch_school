# frozen_string_literal: true

# Diamond class
class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    diamond_size = get_diamond_size(letter)
    letter_per_row = get_letter_per_row(letter, diamond_size)

    letter_per_row.map do |row_letter|
      distance_between_letters = get_distance_between_letters(row_letter)
      row = row_letter == 'A' ? 'A' : row_letter + (' ' * distance_between_letters) + row_letter
      "#{row.center(diamond_size)}\n"
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
