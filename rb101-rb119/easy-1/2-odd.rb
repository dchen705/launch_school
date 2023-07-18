# Write a method that takes one integer argument, which may be positive, negative, or zero. This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.


# instinct
# how do i check if number is odd?
# mod

# pedac
# process prob

# input? num - non neg integer
# output? bool

# explicit req
# no using odd? or even? rb functions
# assumes num is valid

# example

# puts is_odd(2) => false

# ^^ function returns not prints bool

# DS
# num to bool

# Algo
# -define method with num as arg
# -if mod of num is 1 or even, return true or false

# Code

# improvements? thought it was fine.

def is_odd?(num)
  if (num % 2 == 1)
    return true
  else
    return false
  end
end

puts is_odd?(2)
puts is_odd?(3)



