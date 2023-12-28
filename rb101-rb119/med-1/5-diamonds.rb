# 19 minutes
# problem components w/ high abstract options
  - how to iterate through all rows
    - one loop that toggles
    - one ascending loop followed by descending loop
  - how to print a single row
    - associate row number w/ length of consecutive stars via counter + incremnenter
    - associate distance of row from center with number of stars to print
# high abstract option
# Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.


# Observations
#   - n indicates number of rows and number of stars for the center row
#   - first and last row is always 1 star in length


# High Level Options
#   - use an array of empty spaces and stars, loop through a counter that changes the array and prints it as a string for each iteration
#   - iterate by length starting at 1 to n then back to 1, print out length of stars centered as a string

# Lang toolbox
#   String#center


# Data Structures
#   " "

#   diamond(9)

#     *
#    ***
#   *****
#  *******
# *********
#  *******
#   *****
#    ***
#     *

# (1..n).step

# Step from length 1 to n by 2, for each step, `length`
#   print - "*" * length centered by n 

# Step from length (n - 2) to 1 by 2, for each step, `'elgnth`
#   print - "*" * length centered by n 

def diamond(n)
  (1..n).step(2) { |length| puts ("*" * length).center(n)}

  last_length = n
  while last_length > 1
    last_length -= 2
    puts ("*" * last_length).center(n)
  end
end

# refactor the manual loop?
def diamond(n)
  (1..n).step(2) { |length| puts ("*" * length).center(n)}
  (1..(n-2)).step(2).reverse_each { |length| puts ("*" * length).center(n)}
end

# refactor again - pick better parameter name like star_count or stars_per_row or
# consecutive_stars or #star

def diamond(n)
  (1..n).step(2) { |stars_in_row| puts ("*" * stars_in_row).center(n)}
  (1..(n-2)).step(2).reverse_each { |stars_in_row| puts ("*" * stars_in_row).center(n)}
end

diamond(1)

Further Exploration

Try modifying your solution or our solution so it prints only the outline of the diamond:

diamond(5)

  *
 * *
*   *
 * *
  *
  
how to iteratively print rows?
  - toggle loop or 2 loops (ascend then descend)
  
"i'll go w/ 2 loops"

How to print each row?
  - associate row''s distance from center w/ number of spaces between 2 stars
    - center star + space + star to grid size
    - if number of spaces between stars are negative like in row 1 and last row, then
      collapse into one star for those rows.
      
      
`print_row`
  - given grid_size and distance_from_center
  - 'max_spaces_between' = n - 2
  - `spaces_between` assign to `max_spaces_between` - (2 * distance_from_center)
  - spaces_between negative? puts "*".center(n) : puts "*" + spaces_between + *).center()
  
`outline_diamond` (main)
  - iterate from (n / 2) to 0, set distance_from_center
    - call print_row(distance_from_center)
  - iterate from 1 to n/2, , set distance_from_center
    - call print_row(distance_from_center)
    
def outline_diamond(n)
  (n / 2).downto(0) do |distance_from_center|
    print_row(distance_from_center)
  end
  (1).upto(n / 2) do |distance_from_center|
    print_row(distance_from_center)
  end
end

def print_row(n, distance_from_center)
  max_spaces_between = n - 2
  spaces_between = max_spaces_between - (2 * distance_from_center)
  spaces_between.negative? ? puts "*".center(n) : puts ("*" + spaces_between + "*").center(n)
end

# corrected
# forgot to string interpolate in the spaces * spaces between

def outline_diamond(n)
  (n / 2).downto(0) do |distance_from_center|
    print_row(n, distance_from_center)
  end
  (1).upto(n / 2) do |distance_from_center|
    print_row(n, distance_from_center)
  end
end

def print_row(n, distance_from_center)
  max_spaces_between = n - 2
  spaces_between = max_spaces_between - (2 * distance_from_center)
  spaces_between.negative? ? (puts "*".center(n)) : (puts ("*" + "#{" " * spaces_between}" + "*").center(n))
end

outline_diamond(5)
outline_diamond(7)

# Other students solution simplified
  - ah right... they used same solution from first part
  - first part: print num stars
  - 2nd part: print (num - 2) spaces
  - 3rd part: using a ternary to deal with the "up then down" / direction switching
  iteration component of the problem.

def hollow_diamond(n)
  star_numbers_in_each_row = (1..n).map do |row|
    (row <= (n + 1) / 2) ? row * 2 - 1 : (n - row) * 2 + 1
  end

  star_numbers_in_each_row.each do |num|
    puts num == 1 ? "*".center(n) : "*#{(" " * (num-2))}*".center(n)
  end
end

So here''s how I''d refactor my solution using my first part solution and their inspiration

def outline_diamond(n)
  (1..n).step(2) do |length|
    length <= 1 ? puts "*".center(n) : puts "*#{" " * (length - 2)}*"
  end
  (1..(n - 2)).step(2).reverse_each do |length|
    length <= 1? puts "*".center(n) : puts "*#{" " * (length - 2)}#"
  end
end

# ok so including puts in ternary really throws it off so I had to 
# wrap them in parenthesis:

def outline_diamond(n)
  (1..n).step(2) do |length|
    length <= 1 ? (puts "*".center(n)) : (puts "*#{" " * (length - 2)}*".center(n))
  end
  (1..(n - 2)).step(2).reverse_each do |length|
    length <= 1 ? (puts "*".center(n)) : (puts "*#{" " * (length - 2)}*".center(n))
  end
end


outline_diamond(3)
outline_diamond(5)
outline_diamond(11)

# refactor - parameter naming more clear
def outline_diamond(n)
  (1..n).step(2) do |outline_width|
    outline_width <= 1 ? (puts "*".center(n)) : (puts "*#{" " * (outline_width - 2)}*".center(n))
  end
  (1..(n - 2)).step(2).reverse_each do |outline_width|
    outline_width <= 1 ? (puts "*".center(n)) : (puts "*#{" " * (outline_width - 2)}*".center(n))
  end
end

#refactor ternary so puts is on lefthand side and puts is just outputing
# return value of overall ternary expression

def outline_diamond(n)
  (1..n).step(2) do |outline_width|
    puts outline_width <= 1 ? "*".center(n) : 
    "*#{" " * (outline_width - 2)}*".center(n)
  end
  (1..(n - 2)).step(2).reverse_each do |outline_width|
    puts outline_width <= 1 ? "*".center(n) : 
    "*#{" " * (outline_width - 2)}*".center(n)
  end
end