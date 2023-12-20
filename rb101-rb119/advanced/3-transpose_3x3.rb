# took me 13-14 minutes to solve initial problem
# given - matrix - an outer array with 3 3-element arrays each inner array representing a row

# return - new matrix that is transposed version of input matrix
# Example
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# Data Structure

# Algorithm

#   High Abstract Approaches
#     - copy matrix and change element by element except center (manually)

#     - iterate row by row 
#       - iterate index within row
#         - concatenate row[index] to new_matrix[index]


def transpose(matrix)
  new_matrix = []
  # add rows to new matrix
  matrix.size.times  { new_matrix << [] }
  # iterate for each `row` in matrix
  matrix.each do |row|
    # iterate for index in row
    row.each_index do |idx|
      new_matrix[idx] << row[idx]
    end
  end
  new_matrix
end
# ^ small refactor:
# we want matrix[0].size.times NOT matrix.size.times if we want to handle
# cases where M vs N are different lengths
# becuz we need size of row of original matrix to determine size of column of new matrix
# not the number of rows but the number of elements in a row.

# Refactored
def transpose(matrix)
  matrix.each_with_object([[]] * (matrix.size - 1)) do |row, new_matrix|
    row.each_index do |idx|
      new_matrix[idx] << row[idx]
  end
end
# ^ doesn't work, the []* method will multiply the same object-id array, so all 3
# empty arrays are actually the same array.

# Refactored (working!)
def transpose(matrix)
  matrix.each_with_object([]) do |row, new_matrix|
    row.each_index do |idx|
      new_matrix << [] if new_matrix[idx].nil?
      new_matrix[idx] << row[idx]
    end
  end
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# ========================
# ANS KEY
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end
  result
end

# derived from observing that column 1 of matrix becomes row 1 of new_matrix

# ========================
# Further Exploration
# 23 minutes to figure out
# some time from messing up an index - out of range returning nil

# Write a transpose! method that transposes a matrix in place. The obvious solution is to reuse transpose from above, then copy the results back into the array specified by the argument. For this method, don't use this approach; write a method from scratch that does the in-place transpose.

# Rules/Requirements
#   - solve without transposing a dup matrix then assigning it back to `matrix`

# High Abstract Approaches
#   - get a new matrix then map each element of new matrix to matrix (just copying)

#   - use 2 pointers to swap 2 elements at a time
#     - leave the corners and center alone
#     - swap 
#       - row0col1 and row0col1
#       - row0col2 and row2col0
#       - row1col2 and row2col1
#       (does parallel assignment create a "temp" var to hold)
#       [1] 3.2.2 > big = 100
#       100
#       [2] 3.2.2 > small = 1
#       1
#       [3] 3.2.2 > big, small = small, big # returns 1, 100
#       # okk good.

# not a good solution cuz can't generalize to M x N matrix
def transpose!(matrix)
  swap_positions = [
    [0, 1],
    [0, 2],
    [1, 2]
  ]
  swap_positions.each do |a, b|
    matrix[a][b], matrix[b][a] = matrix[b][a], matrix[a][b]
  end

  matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

# new_matrix = [
#   [1, 4, 3],
#   [5, 7, 9],
#   [8, 2, 6]
# ]

new_matrix = transpose!(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

# see other students swap method

def transpose!(matrix)

  counter = 0

  matrix.each_index do |x|
    y = counter + 1

    loop do
      break if y >= matrix[x].length
      matrix[x][y], matrix[y][x] = matrix[y][x], matrix[x][y]
      y += 1
    end

    counter += 1
  end

  matrix
end

# ^ this can get refactored, x can serve as counter, `counter` var 
# serves redudant purpose

# Here's my take:
# Another issue is that the below solution isn't generizable to M x N matrix.
# esp if M and N are different

# ignore [0, 0] and [1, 1], and [2, 2]

# - iterate from 0 to size - 1, set `a`
#   - b = `a` + 1
#   - until end_idx > size - 1 || start_idx == end_idx
#     - [a][b], [b][a]
#     - end_idx += 1
#     -

def transpose!(matrix)
  last_idx = matrix.size - 1
  (0..last_idx).each do |a|
    b = a + 1
    until b > last_idx || a == b 
      matrix[a][b], matrix[b][a] = matrix[b][a], matrix[a][b]
      b += 1
    end
  end
  matrix
end

# matrix = [
#   [1, 2, 3, 4, 5],
#   [4, 3, 2, 1, 0],
#   [3, 7, 8, 6, 2]
# ]

# ^ this matrix can't be tranposed by just swapping values, have to restructure it