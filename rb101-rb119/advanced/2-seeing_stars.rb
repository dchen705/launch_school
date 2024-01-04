# Took me an hour and 20 minutes
# sure there's a faster way
# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.
FE asks to draw a circle and sine wave, not sure...
# star(7)

# *  *  *
#  * * *
#   ***
# *******
#   ***
#  * * *
# *  *  *

# star(9)

# *   *   *
#  *  *  *
#   * * *
#    ***
# *********
#    ***
#   * * *
#  *  *  *
# *   *   *

# Thoughts
#   - at 7th star, there's 4 line types
#   - at 9th start, there's 5 line types
#   - at 11th star, there''s 6 line types

# Calculate all line types from n, (n/2) + 1
# Make an array of strings to rep line types
# Assign each line type to a string of size n with all characters as " "
# Assign `midpoint` to n/2 + 1

# Make an array of array of indexes - that represent which index of string is changed to *

#   Start at center line (index 0)
#     - all indexes are changed to stars
#   at index 1

#   Loop: stop when counter >= line_type count
#     - center = `midpoint`
#     - left = midpoint - counter
#     - right = midpoint + counter
#     - concatenate to `index_array`[counter] << center, left, right

# Print lines by iterating over line_types array
#   - iterate 1 to index : size - 1
#   - iteratate index at 0 
#   - iterate from size - 1 to 1

def make_empty_lines(n, unique_lines_count)
  empty_lines = []
  (unique_lines_count).times {empty_lines << ' ' * n}
  empty_lines
end

def make_star_indices_lists(n, unique_lines_count)
  unique_lines = []
  center_line_indices = (0..(n - 1))
  unique_lines << center_line_indices

  center_idx = n / 2
  scatter_lines_count = unique_lines_count - 1
  1.upto(scatter_lines_count) do |nth_from_center|
    left_idx = center_idx - nth_from_center
    right_idx = center_idx + nth_from_center
    nth_from_center_indices = [left_idx, center_idx, right_idx]
    unique_lines << nth_from_center_indices
  end

  unique_lines
end

def mark_empty_lines_into_unique_lines(empty_lines, list_of_star_indices_lists)
  unique_lines = empty_lines
  unique_lines.each_with_index do |line, idx|
    char_arr = line.chars
    star_indices_list = list_of_star_indices_lists[idx]

    star_indices_list.each do |star_idx|
      char_arr[star_idx] = '*'
    end
    unique_lines[idx] = char_arr.join
  end
  unique_lines
end

def print_lines(unique_lines_list)
  unique_lines_list[1..-1].reverse.each do |line|
    puts line
  end
  puts unique_lines_list[0]
  unique_lines_list[1..-1].each do |line|
    puts line
  end
end

def star(n)
  unique_lines_count = n / 2 + 1
  empty_lines = make_empty_lines(n, unique_lines_count)

  list_of_star_indices_lists = make_star_indices_lists(n, unique_lines_count)

  unique_lines_list = mark_empty_lines_into_unique_lines(empty_lines, list_of_star_indices_lists)

  print_lines(unique_lines_list)
end

star(13)

# ============================
# 2nd passthrough

arr = Array.new(n) {''}

arr.map! do |_|
  
end

# 2 Components
  - Iterating rows (Loop)
    - by length of stars/index of stars?
    - by distance from center
    - by number of rows to print
  - Printing a row
  
# Observations
  - number of rows and number of stars both equal to n
  - all rows have one star in center.
  - from first row to n/2 - 1:
    - stars change position by 1 index
    - at distance 1, index 1 from center
    - at distance 3, index 3 from center
  and from row n/2 - 1 to last row
  
# Data structure
row number -> 
distance from center ->
indexes to star

# Algo
  Main
    - make array that has n of ie: "  *  "
    - iterate from first row to last row using each
      - center_distance = get_distance_from_center(current_row)
      - get_indexes_to_star(center_distance).each index
        - assign +- index of first `row` to "*"
    
    print out each string in array
    
    ^ this requires two helper methods, is there a easier way?
    
  Approach 2?
  
    Initialize max_distance to n/2 - 1
    Initialize counter at n/2 - 1
    INitialize incrementer to -1
    Loop while counter < n/2 - 1
      if counter == 0
        p "*" times n
        reassign incrementer to +1
        counter += incrementer
        next
      else
      - current row assign to "*".center(n)
      - change current row at index counter and -counter to *
      - p current row
      - counter += incrementer
  
  def star(n)
    # max distance from center
    max_distance = n / 2 + 1
    counter = max_distance
    incrementer = -1
    
    while counter < max_distance
      if counter == 0
        puts '*' * n
        incrementer = 1
        counter += 1
      else
        current_row = '*'.center(n)
        current_row[counter], current_row[-counter] = '*', "*"
        puts current_row
        counter += incrementer
      end
    end
  end
      
        
  
  def star(n)
  # max distance from center
  max_distance = n / 2
  mid_idx = n / 2
  counter = max_distance
  incrementer = -1
  
  while counter <= max_distance
    if counter == 0
      puts '*' * n
      incrementer = 1
      counter += 1
    else
      current_row = '*'.center(n)
      idx1, idx2 = mid_idx + counter, mid_idx - counter
      current_row[idx1], current_row[idx2] = '*', "*"
      puts current_row
      counter += incrementer
    end
  end
end

star(9)

^ this worked but i stumbled a few steps:
  - i was doing current_row[counter] when should be current_row[mid_idx + counter]
  - i was assigning max distance and mid_idx to wrong values.. should have 
  looked coser at test cases. I was off by one.
  
# also solution still not as short as ans key

# 2nd passthrough
Thoughts
  - printing by row (loop or iteration)
    - by quantity/num rows
  - how print row 
    - space between center and other two rows associate to distance from center or row number
    - ordinal (nth) row
    - besides center, 3 stars to print each row, w/ 1 always at center
    - 


DS intermed pathway


"*#{' ' * (distance_from_center - 1)}*#{' ' * }*".center(n)
row always has "*".center(n)
row length is n
center_row always "*" * n
from_center
***
Mix-match:
Part 1
Iteration 2 ways

^ associate distance from center w/ spaces_between 

OR

^ or (get spaces_between by row number) iterate through that instead

Part 2
print rows 2 ways
- use string interpolated (easier)

OR

- for each row, default to "*".center(n), then find the 2 indices and set to "*" (requires 2 method calls to insert at 2 points, have to find indices, more thinking required)

V3 - lets use the most explicit version i can think of - not the briefest
n = row number - (1..n)
center_row = (n / 2.0).ceil


default_row = ("*").center(n)
star_distance = (row_number - center_row).abs

Finding indices
insert right star first by setting to "*"  at index(*) + star_distance
then insert left star (index(*)) still returns center cuz its the first occurence

High Abstract Summary
  Low Lvl Algo
iterate by spaces_between stars from max (determined using n) to 0 (single loop manual that toggles), print out string interpolated
  - given `n`
  - `max_distance` is n / 2
  - `distance_from_center` = max_distance
  - `incrementer` = 1
  - until `distance_from center` > max_distance
    - `space_between` = `distance_from-center` - 1
    - print star interploated and spaced by `space_between` times
    - `distance_from_center` += incrementer
    - `incrementer = -1 if distance_from_center == 0

===
iterate by max_distance from center to 0, within each iteration, associate distance from center with spaces btween spaces to print appropriate row, iterate from 1 to max distance, repeat...
  - given `n`
  - iterate from (n / 2) downto 0, set `distance_from_center`
    - set `spaces_between to distance_from_center - 1
    - print string interpolated - single star justified center by n, with spaces between times of spaces interpolated in 
  - iterate from 1 upto (n / 2)
    # - set `spaces_between to distance_from_center - 1
    # - print string interpolated - single star justified center by n, with spaces between times of spaces interpolated in 
===
Iterate by row number, for each iteration: set a default line that''s only single star center-justified, print appropriately, find the indices to set to right and left stars via row number and center row difference, set indices to *, print appropriately
  # - given `n`
  # - set `center_row` = n / 2
  # - iterate 1..n, set row_num
  #   - if row is center_row
  #     print "*" * n
  #   - else
  #     - print_row = "*".center(n)
  #     - star_distance = (row_num - center_row).abs
  #     - at index: first occurence of * in default line + star_distance - set to *
  #     - at index: first occurence of * in default line - star_distance - set to *
  #     - print print_row

Took me 50 minutes from start to write these three pseudocodes

V1
def star(n)
  max_distance = n / 2
  distance_from_center = max_distance
  incrementer = -1
  until distance_from_center > max_distance
    space_between = distance_from_center - 1
    if space_between < 0
      puts "*" * n
    else
    puts "*#{' ' * space_between}*#{' ' * space_between}*".center(n)
    end
    distance_from_center += incrementer
    incrementer = 1 if distance_from_center == 0
  end
end

^ missed - incrementer should start at -1, also if statement for if space_betwwen < 0

V2
def star(n)
  (n / 2).downto(1) do |distance_from_center|
    spaces_between = distance_from_center - 1
    puts "*#{' ' * spaces_between}*#{' ' * spaces_between}*".center(n)
  end
  puts "*" * n
  (1).upto(n / 2) do |distance_from_center|
    spaces_between = distance_from_center - 1
    puts "*#{' ' * spaces_between}*#{' ' * spaces_between}*".center(n)
  end
end

V3
def star(n)
  center_row = n / 2 + 1
  (1..n).each do |row_num|
    if row_num == center_row
      puts "*" * n
    else
      print_row = "*".center(n)
      star_distance = (row_num - center_row).abs
      print_row[print_row.index("*") + star_distance] = "*"
      print_row.[]=(print_row.index("*") - star_distance, "*")
      puts print_row
    end
  end 
end

Other student ideas:
str = '***'.chars.join(' ' * spaces).center(int)

def star_print(n,x)
  print [' ' * n, '*',' ' * x, '*', ' ' * x,'*',' ' * n, "\n"].join
end 

Recursion
top_part_recurse(n/2 - 1, 0)
def top_part_recurse(inside_space, outside_space)
  return if inside_space < 0
  puts ' ' * outside_space + '*' + ' ' * inside_space + '*' + ' ' * inside_space + '*'
  return top_part_recurse(inside_space - 1, outside_space + 1)
end

Also did sine wave
def star(n)
  spaces = ' ' * (n / 2 - 1)
  line = "*#{spaces}*#{spaces}*"
  top_lines = [line]

  until spaces.empty?
    spaces.chop!
    line = "*#{spaces}*#{spaces}*".center(n)
    top_lines << line
  end

  puts [top_lines, ('*' * n), top_lines.reverse]
end

def sine_wave(height, freq)
  # generate grid of appropriate size
  grid = []
  (height * 2 + 1 ).times { grid << (' ' * 80) }

  y_vals = (0...80).map { |y| (height * Math.sin(y * freq)).round }
  # change representation of y values to match array index
  # the highest y value (height), for example, becomes 0 since this is the top line of the grid
  y_vals.map! { |y| (y - height) * -1 } 
  80.times { |x| grid[y_vals[x]][x] = '*' }

  grid.each { |line| puts line }
end

sine_wave(1, 0.5)
puts ''
puts ''
sine_wave(2, 0.25)
puts ''
puts ''
sine_wave(10, 0.1)