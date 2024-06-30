# frozen_string_literal: true

# this is the octal class
class Octal
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if value.match(/[^0-7]/)

    value.to_i.digits.map.with_index { |digit, index| digit * (8**index) }.sum
  end
end

# --- ^ above is rubocop appeased

# 31 minutes, stumbled when chaining with_index to reduce

# g: an octal number
# r: decimal version of given

# explicits:
#   def:
#     - octal is base 8

#   rule
#     - invalid inputs treated as 0 octal

#   concepts
#     - for base 8, multiply by 8 ** n - 1 where n is the digit place

# implicits
#     rules
#       - digits 8 and 9 are invalid

# Test cases
# Octal class
#     `constructor`: string as argument

#     `to_decimal`: returns decimal value of octal

# DS
# - arrays start at index n-1 which mirrors the rule
# - integer#digits method returns array in reverse

# Algo
# High-lvl
# check for invalids, then convert to reversed digits array, and iterate calculate a running total based on index
# low-lvl
# - return 0 if any chars invalid in array version of string
# - transform all strings to numbers in array
# - iterate in reverse of array, calc running total based on value ** (index)
require 'pry'

class Octal
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if value.match(/[^0-7]/)

    total = 0

    value.to_i.digits.each_with_index do |digit, index|
      total += digit * (8 ** index)
    end

    total
  end
end

# I couldn't figure out to use reduce,
# this guy was big brain:

# def to_decimal
#   @num.chars.map(&:to_i).reduce { |sum, num| sum * 8 + num }
# end

# Below is what I was trying to do:
# @number.to_i.digits.each_with_index.reduce(0) do |acc, (n, i)|
#   acc + n * 8 ** i
# end

# refactored

class Octal
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if value.match(/[^0-7]/)

    value.chars.map(&:to_i).reduce { |sum, digit| sum * 8 + digit }
  end
end

# another common solution was using #map then #sum

class Octal
  attr_reader :value

  def initialize(value)
    @value = value
  end

  def to_decimal
    return 0 if value.match(/[^0-7]/)

    value.to_i.digits.map.with_index { |digit, index| digit * (8 ** index) }.sum
  end
end