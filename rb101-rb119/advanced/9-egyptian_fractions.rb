total time prob 1:40ish + 10-20 min of thinking in head
# # given rational number
# # return an array of integers that represent the demonators of a series of egyptian fractions that sum up to input rational number

# # given list of integers representing demonators of a series of egyptian fractions that sum up to input rational number
# # return - corresponding rational number

# # number 2 is represented as Rational(2, 1) == 2

# # rules/requirements
# #   - rational number is any number that can be represented by division of 2 diff integers
# # - egyptian fractions are series of rational numbers in which numerator is 1 and no two denominators are the same
# # many combinations of egyptian fractions per rational number

# # egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# # egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# # egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# # unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# # unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# # unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# # unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# # unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# # unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# # unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# # unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# # DS intermed pathway

# egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# rational(2, 1)
# rational -> list of rational numbers (that add up to rational)
# -> list of integers
# [Rational(1/1), Rational(1/2), etc...]
# [1, 2, 3, 6]

# # High Abstract Summary
# #   Low Lvl algo

# # unegyptian
# # transform list of integers into rational numbers and get their sum

# having trouble figuring out arithmetic of rational numbers
# # (Rational(2/1)) - Rational(1/3) # => 2/1
# # (Rational(2/1)) - (1/3).to_f => 2.0
# ^ it''s becuz 1/3 truncates, need 1.0/3

# get denominator from rational number
# (Rational(2/1) / 1).to_i

# rational?(float)
# float
# do floats have limit to how many decimals?
# yes, ruby doc - inexact real numbers
# how can i check if number is rational?
# if float rationalized and converted back to float doesn''t equal Float?
# reduced_rational - (1.0/denominator) #=> Float
# #substract float from rational gives us float
# having trouble figuring out test case for irrational number
issue is that floats seem to round like I do 1.0 / 3
  rounds to 0.3333333333333333

# def rational?(float)
#   float.to_r.to_f == float
# end



# egyptian(num)
# iterate from (1..), set `denominator`, convert denominator to eqyptian fraction, test if num minus eqyptian fraction is a rational number, if yes, for that iteration, concatenate to return_arr that denominator and return num minus egyptian fraction
#   - given `rational_num`
#   - intialize `eygyptian_fractions` to []
#   - iterate from (1..) using reduce(rational_num), set reduced_rational, denominator
#     - if reduced_rational - (1.0/denominator) is a rational_num?
#       - concatenate denominator to egyptian_fractions
#       - return reduced_rational - (1.0/denominator)
#     - return reduced_rational

#   - return eypgtian fractions

def rational?(float_num)
  p float_num
  float_num.to_r.to_f == float_num
end

def egyptian(rational_num)
  egyptian_fractions = []

  ([1, 2, ]).reduce(rational_num) do |reduced_rational, denominator|
    if rational?(1.0 / denominator)
    egyptian_fractions << denominator 
      rational_num = reduced_rational if denominator == 5
      reduced_rational
    else
      p demoninator
      rational_num = reduced_rational if denominator == 5
      reduced_rational
    end
  end
  p rational_num
  p egyptian_fractions 
end

def unegyptian(num_list)
  num_list.map do |int|
    Rational(1, int)
  end.sum.to_r
end

p rational?(1.0 / 3)

# p unegyptian([1, 2, 3, 4, 5])

# figured out Integer#to_r is change to rational number.
# (1/2) syntax converts to integer

1 hour progress
stumpped at if i can figure out if number is rational

im gonna change my approach -
egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]
I think I'll iterate indiscriminately but I''l set a break clause such that
once decimal reaches certain point, I'll try to convert to a rational number that...
or maybe I'll have algo reduce as low as possible with 1 / denominator, and if can't, it will, skip
and keep doing until reaches 0.

Extended
^^ to finish the rest 33:39
didn''t like my hack-slash way of solving it tbh

def round_to_zero(float_num)
  (float_num * (10 ** 8)).round
end

def egyptian(rational_num)
  egyptian_fractions = []

  (1..).reduce(rational_num) do |reduced_rational, denominator|
    if reduced_rational.rationalize(10e-15) == 0.0
      break egyptian_fractions
    elsif (reduced_rational - (1.0 / denominator)).rationalize(10e-15) < 0.0
      reduced_rational
    else
      egyptian_fractions << denominator 
      reduced_rational = (reduced_rational - (1.0 / denominator)).to_r
    end
  end
end

def unegyptian(num_list)
  num_list.map do |int|
    Rational(1, int)
  end.sum.to_r
end

# ^ I'm getting the correct egyptian fractions but the reduced_rational is not exactly 0.
# i need a break condition that accepts floats very close to zero.
# I made this method but it still doesn''t pass all test cases:
# and it uses magic number - like just trial and error what magnitude
# of 10 to round to.

# ok hack-slashed my way I had to change this:
# reduced_rational - (1.0 / denominator) < 0.0
# to this:
# (reduced_rational - (1.0 / denominator)).rationalize(0.001) < 0.0
# I''m guessing cuz when we convert between float and rational, we want some degree of rounding, otherwise we get values that round to zero even if value is very slightly negative or if float is slightly positive should round to zero too. 

# def round_to_zero(float_num)
#   (float_num * (10 ** 8)).round
# end

p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
p egyptian(Rational(3, 1))    # -> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

# returns [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 14] when rounded to magnitude of 0.001

# passed all but last test case 
# reduced_rational.rationalize(10e-8) == 0.0
# ^^ I was just titrating which magnitude
when I rationalized to (10e-15), I passed all test cases.

p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

# whelp after looking at ans key and other's solution, I realized I just needed very minor refactoring
def egyptian(rational_num)
  egyptian_fractions = []

  (1..).reduce(rational_num) do |reduced_rational, denominator|
    if reduced_rational == 0
      break egyptian_fractions
    elsif (reduced_rational - Rational(1, denominator)) < 0
      reduced_rational
    else
      egyptian_fractions << denominator 
      reduced_rational = reduced_rational - Rational(1, denominator)
    end
  end
end
# instead of substracting a float from rational, I should have converted the float to rational before substracting
# from rational