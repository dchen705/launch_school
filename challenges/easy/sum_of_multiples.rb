# 28 min to solve, test cases don't cover if top num is less than the numbers in set, just add a raise arguemnt
# error clause if any numbers >= top num
# nvm, my first solution was fine, ruby ranges handles invalid ranges perfectly fine.

# given: natural number and list of numbers
# r: sum of all multiples of each number in the list that are less than the first argument number

# 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15,
# ^ note, uniq, not multi-counting multiples

# explicit ^^
#   rule: if no set given, defaults to multiple of 3 or 5
#   disinclude the top number / limit number

# Test Cases
# class SumOfMultiples
#   - class method `to` - that takes single argument
#     defaults to 3 or 5 multiples

#   - instance method `to` - single argument like class method
#   - constructor takes *arguments that represent set of numbers of multiples to sum up

# DS
# group multi-arguments into an array for easy iteration
# Use ranges for stepping up incrementally
# define an instance method, for class method - just mimic the instance method by instantiating a mock with 3 and 5

# Algo
# for each num_in_set,
#   transform each num to a list of multiples up to but disincluding the top number
# - flatten the transformed set of num, remove duplicates and return sum

# First Solution - the argument error raise line was only refactored part
# I later thought I needed to refactor this in:
# raise ArgumentError, 'Number too low.' if numbers.all? { |num| num >= top_num }
# but the truth is if the range is invalid, then Range#step to #to_a will just return an empty []
# NICE!
# frozen_string_literal: true

# finds sum of multiples of 3 and 5 up to given number, can also dictate set of numbers to find multiples of
class SumOfMultiples
  attr_reader :numbers

  def initialize(*numbers)
    @numbers = numbers.empty? ? [3, 5] : numbers
  end

  def to(top_num)
    numbers.map { |num| (num...top_num).step(num).to_a }.flatten.uniq.sum
  end

  def self.to(top_num)
    SumOfMultiples.new.to(top_num)
  end
end

# could also use flat_map

# class SumOfMultiples
#   attr_reader :numbers

#   def initialize(*numbers)
#     @numbers = numbers.empty? ? [3, 5] : numbers
#   end

#   def to(top_num)
#     numbers.flat_map { |num| (num...top_num).step(num).to_a }.uniq.sum
#   end

#   def self.to(top_num)
#     SumOfMultiples.new.to(top_num)
#   end
# end

# rfactor clear naming and remove the getter for conciseness

# in actual code, I'd probably refactor by extracting logic into a `get_multiples_less_than` method

class SumOfMultiples
  def initialize(*multiples_of)
    @multiples_of = multiples_of.empty? ? [3, 5] : multiples_of
  end

  def to(top_num)
    @multiples_of.map { |base_unit| (base_unit...top_num).step(base_unit).to_a }.flatten.uniq.sum
  end

  def self.to(top_num)
    SumOfMultiples.new.to(top_num)
  end
end