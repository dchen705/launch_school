# 23 min to solve

# g: number
# r:
# perfect: aliquot sum = num
# deficient aliquot sum < num
# abundant: aliquot sum > num

# aliquot sum = sum of a number''s divisors excluding number itself

# divisors = all other natural numbers that divide evenly into number

# natural numbers = 1, 2, 3, etc...

# Examples/Test Cases
# - PerfectNumber class
#   `classify` class method
#     - accepts a number argument
#     - raises StandardError if number not natural
#     - returns strings of either 'perfect', 'abundant', 'deficient'

# DS
# num -> list of divisors -> aliquot sum, case statement

# Algo
# High Lvl

# getting a list of all divisors from a number
#   since test numbers are all small, prob don''t need to optimize
#   can iterate over a range of nautral numbers from 1 to half of the number

# - given `num`
# - raise standarderror in `initialize` if not
# - get `divisors_list`
# - set `aliquot_sum` to sum of divisors_list
# - use case statement of aliquot_sum to return appropraite string

class PerfectNumber
  attr_reader :num

  def initialize(num)
    raise StandardError if num < 1 || !num.instance_of?(Integer)

    @num = num
  end

  def self.classify(num)
    number = PerfectNumber.new(num)
    divisors_list = number.get_divisors
    aliquot_sum = divisors_list.sum

    case aliquot_sum <=> num
    when 0 then 'perfect'
    when 1 then 'abundant'
    else 'deficient'
    end
  end

  def get_divisors
    (1..(num / 2)).to_a.select do |divisor|
      num % divisor == 0
    end
  end
end

# refactor - more conscise but less clear, also not elying on instance methods

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1 || !num.instance_of?(Integer)

    aliquot_sum = get_divisors(num).sum

    case aliquot_sum <=> num
    when 0 then 'perfect'
    when 1 then 'abundant'
    else 'deficient'
    end
  end

  def self.get_divisors(num)
    (1..(num / 2)).to_a.select do |divisor|
      num % divisor == 0
    end
  end
end