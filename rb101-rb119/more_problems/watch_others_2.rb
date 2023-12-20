
# Problem

#   Rules/Requirements


# Example
# 12 -> 21
# 513 -> 531
# 2017 -> 2071
# if no bigger number, return -1
# 9, 11, 531

# 51200 -> 52100
# 52200

# as long as current digit is less than the potential_swap digit then we won't swap it because then the resulting number will be smaller.
# exception for single digits


# Data Structure
# (input) positive integer ->

# (output) integer

# Approach
#   High Level Options
#    - from digits of input_num, get all possible combinations of digits, sort it, then find the next num higher than input_num (brute force)
#    - iterate backwards from last digit, checking if current digit is greater than (current digit - 1)


def next_bigger(int)
  # reverse iterate digit by digit, check starting from last digit
  digits = int.digits
  checked_digit_idx = 1
  while checked_digit_idx < digits.size
    compared_digit_idx = checked_digit_idx + 1
    while compared_digit_idx < digits.size
      current_digit = digits[-checked_digit_idx]
      comparing_digit = digits[-compared_digit_idx]
      binding.pry
      if current_digit > comparing_digit
        digits_cpy = digits.dup
        digits_cpy[-checked_digit_idx] = digits[-compared_digit_idx]
        digits_cpy[-compared_digit_idx] = digits[-checked_digit_idx]
        return digits_cpy.join.to_i
      end
      compared_digit_idx += 1
    end
    checked_digit_idx += 1
  end
  -1
end

p next_bigger(12)
p next_bigger(513)
p next_bigger(2071)
p next_bigger(9)
p next_bigger(11)
p next_bigger(531)
# 12 -> 21
# 513 -> 531
# 2017 -> 2071
# if no bigger number, return -1
# 9, 11, 531

# 30+ minutes, didn't solve the problem, this is my progress so far
# It fell apart when I couldn't figure out/verify my approach was right.
# Then I felt like I needed to rush through.
# skipped the algorithm writing step, jumped straight in code.