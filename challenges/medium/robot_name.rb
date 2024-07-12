# class Robot
#   @@preexisting_ids = []
#   LETTERS = ('A'..'Z').to_a
#   DIGITS = ('0'..'9').to_a

#   attr_reader :name

#   def initialize
#     @name = random_name
#   end

#   def reset
#     @name = random_name
#   end

#   private

#   def random_name
#     name_id = make_uniq_id
#     single_chars = []
#     3.times do
#       name_id, last_2_digits = name_id.divmod(100)
#       single_chars.prepend(DIGITS[last_2_digits % 10])
#     end
#     2.times do
#       name_id, last_2_digits = name_id.divmod(100)
#       single_chars.prepend(LETTERS[last_2_digits % 26])
#     end
#     single_chars.join
#   end

#   def make_uniq_id
#     id = ''
#     loop do
#       id = Integer(rand * (10**10))
#       break unless @@preexisting_ids.include?(id)
#     end
#     @@preexisting_ids << id
#     id
#   end
# end

# # refactoring: I realize I could use ruby's rand(range) method high lvl abstraction to greatly simplify the problem

# # this doesn't work:
# # [rand(0..9)] * 3 because returns [0,0,0], etc... all are same values
# # but I remembered there's something we can do with Array.new and blocks
# # Array.new(3) {rand(0..9)} => => [8, 4, 0] nice!

# # create a 5 element array, first two are random number from 0-25 and last three are random number from 0-9
# # regenerate if already exists

# # transform array into characters based on branching logic by index and join
# # during refactoring, I struggle to name appropriatley

# # Refactored
# class Robot
#   @@preexisting_ids = []
#   LETTERS = ('A'..'Z').to_a
#   DIGITS = ('0'..'9').to_a

#   attr_reader :name

#   def initialize
#     @name = random_name
#   end

#   def reset
#     @name = random_name
#   end

#   private

#   def random_name
#     name_id = make_uniq_id
#     name_id.map.with_index do |key, index|
#       index < 2 ? LETTERS[key] : DIGITS[key]
#     end.join
#   end

#   def make_uniq_id
#     loop do
#       id = Array.new(2) { rand(0..25)} + Array.new(3) {rand(0..9)}
#       next if @@preexisting_ids.include?(id)
#       @@preexisting_ids << id
#       return id
#     end
#   end
# end

# # Refactored v2
# class Robot
#   @@preexisting_names = []

#   attr_reader :name

#   def initialize
#     @name = random_name
#   end

#   def reset
#     @name = random_name
#   end

#   private

#   def random_name
#     loop do
#       name = (Array.new(2) { ('A'..'Z').to_a.sample} + Array.new(3) { ('0'..'9').to_a.sample }).join
#       next if @@preexisting_names.include?(name)
#       @@preexisting_names << name
#       return name
#     end
#   end
# end

# class Robot
#   def name
#     return @name if @name
#     srand(Random.new_seed)
#     self.name = random_name
#   end

#   def reset
#     self.name = nil
#   end

#   private

#   attr_writer :name

#   def random_name
#     ('A'..'Z').to_a.shuffle[0, 2].join + ('0'..'9').to_a.shuffle[0, 3].join
#   end
# end

class Robot
  @@used_names = []
  attr_accessor :name

  def reset
    self.name = random_name while name.nil? || @@used_names.include?(name)
    @@used_names << name
  end

  alias initialize reset

  private

  def random_name
    (Array.new(2) { ('A'..'Z').to_a.sample } + Array.new(3) { ('0'..'9').to_a.sample }).join
  end
end

# alternative
  # def random_name
  #   Array.new(5) do |index|
  #     chars = index < 2 ? 'A'..'Z' : '0'..'9'
  #     chars.to_a.sample
  #   end.join
  # end

