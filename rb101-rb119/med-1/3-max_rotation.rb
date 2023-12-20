# Here's my interpretation of what happened during my first attempt, why I floundered, and how
# I could have done instead to prevent this:
# main method is `max_rotation`
previous 2 exercises were helper methods for `max_rotate`.
instead of deriving my algorithm by building off my smaller helper methods, I tried
to write an algo - I knew my main algo for max_rotate was going to have a loop construct
but I made that loop construct blind to my earlier helper methods.
when I went back to plug in those helper methods into the main method there was 
unexpected conflict (unaccounted parameter for helper method)
that forced me to redesign the loop construct in my main method


As an alternative, in my 2nd attempt:
- I immediately put in my 2 helper methods into irb
- then i used my helper method on a test case to mimic the looping behavior I wanted
- I kept the parameter accounted for and much quicker able to see and how to create
the right loop construct
^ this is really only usable if you have the method definitions for the smaller helper methods
already written out.
Develop your PEDAC to give you using irb? 

I think my strength was breaking the problem down. But keeping track of many things
was difficult for me. So I need to compensate.

Do I want to have it all figured out before writing a code,
or I do want to have small victories along the way.

Instead of going, do all the problem solving for main mehtod and helper methods
then do all data structure and algo fro all methods.
What if i ran PEDAC multiple times for each helper, then used helper to build next one, etc.

# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

# 6 digit - 5 rotations

# 2 digit - 1 rotation
# 1 digit - no rotation


# rotate_rightmost_digits
# 0..-1
# 1..-1
# 2..-1
# (digit_size - 2)..-1

# counter = 0
# loop size of digits minus 1
# -n
# -(n-1)
# -(n-2)
# digits[(counter)..-1]
# counter + 1

def rotate_array(arr)
  arr[1..-1] << arr[0]
end

def rotate_rightmost_digits(int, n)
  digits_arr = int.digits.reverse
  digits_arr[-n..-1] = rotate_array(digits_arr[-n..-1])
  digits_arr.join.to_i
end

def max_rotation(int)
  digits_length = int.digits.size
  counter = digits_length
  (digits_length - 1).times do
    int = rotate_rightmost_digits(int, counter)
    counter -= 1
  end
  int
end
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845

# my second pass through:

# unfortunately I failed the test case with the leading zero getting dropped.
# I was making good time, building up helper methods along the way, 
# coding and writing out algorithm back and forth then I failed a test case
# and struggling to how to remove this issue.

# If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

# Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

# Note that you do not have to handle multiple 0s.

# max_rotation(735291) == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845

def rotate_int_arr(int_arr)
  # rotate Array of digits
  (int_arr[1..-1] << int_arr[0])
end

def split_int_into_arrays(int, split_idx)
  # get array of digits
  digits = int.digits.reverse
  
  # partition array by if `digit` index < split_idx, pput in first Array
  split_arrays = digits.partition.with_index do |digit, idx|
    idx < split_idx
  end
  split_arrays.each {|array| array.delete(0)}
  split_arrays
end

def max_rotation(int)
  split_idx = 0
  digits_length = int.digits.size
  until split_idx > digits_length - 2
  # loop (# split index -> 0 -> 1 -> 2 ->)
  leave_fixed, rotate_this = split_int_into_arrays(int, split_idx)
    # split int into leave_fixed and #rotate_this
    # `rotate_int_arr(rotate_this)`
  rotate_this = rotate_int_arr(rotate_this)
    # join leave_fixed and #rotate_this
  int = (leave_fixed + rotate_this).join.to_i
    # convert back to int

    split_idx += 1
  end
  binding.pry
  int

end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845

# Ok I solved the edge case, but it took too much time.
# I found that the issue was partitioning by dynamic index wouldn't work
# because leading 0s get dropped which screw up iteration over the digits
# instead I partitioned by dynamic rotate length.

def split_int_into_arrays(int, rotate_length)
  # get array of digits reversed
  digits_reversed = int.digits
  
  rotate_this = (digits_reversed.slice!(0, rotate_length)).reverse
  leave_fixed = digits_reversed.reverse
  # # partition array by if `digit` index < rotate_length, pput in first Array
  # # split by length instead of index
  # split_arrays = digits.partition.with_index do |digit, idx|
  #   idx < rotate_length
  # end
  # split_arrays.each {|array| array.delete(0)}
  # split_arrays
  [leave_fixed, rotate_this]
end