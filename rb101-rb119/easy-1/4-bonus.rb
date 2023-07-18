# Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary. If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

# my reflex algo
# if else - honestly statements built into the prompt, just have it return
# rather than print the bonus value...
  
def calculate_bonus(salary, is_bonus)
  if (is_bonus)
    return salary / 2
  else
    return 0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# answer key: used a ternary operator, again, I could have be more concise albeit less clear
# when given a simple conditional

# def calculate_bonus(salary, is_bonus)
#   is_bonus ? (salary / 2) : 0
# end

# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000