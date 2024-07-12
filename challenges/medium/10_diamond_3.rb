# frozen_string_literal: true

# Psuedocode in 10_diamond_2.rb
class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(top_letter)
    return 'A' if top_letter == 'A'

    max_width = ALPHABET.index(top_letter) * 2 + 1
    list_of_rows = [make_row(top_letter, max_width)]
    ALPHABET.select { |letter| letter < top_letter }.reverse_each do |letter|
      current_row = make_row(letter, max_width)
      list_of_rows = [current_row] + list_of_rows + [current_row]
    end
    list_of_rows.join
  end

  class << self
    private

    def make_row(letter, max_width)
      return "#{'A'.center(max_width)}\n" if letter == 'A'

      "#{letter}#{' ' * spaces_between(letter)}#{letter}".center(max_width) + "\n"
    end

    def spaces_between(letter)
      ALPHABET.index(letter) * 2 - 1
    end
  end
end

puts Diamond.make_diamond('E')
puts Diamond.make_diamond('F')
