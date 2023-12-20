# Took me an hour and 20 minutes
# sure there's a faster way
# Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

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