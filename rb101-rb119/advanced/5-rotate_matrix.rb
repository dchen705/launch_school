# Solved in 12 minutes
# used similar solution as transpose problems
# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# Observations
#   - first row becomes the last column
#   - last row becomes the first column

#   - initialize new_matrix
#   - reverse iterate for each row of `matrix`
#     - for each `row`, iterate through each element with `idx`
#       - if new_matrix[idx] doesn't exist (nil) then create empty array and assign to new_matrix[idx]
#         concatenate row[idx] to new_matrix[idx]
#       else
#         concatenate row[idx] to new_matrix[idx]

def rotate90(matrix)
  matrix.reverse_each.with_object([]) do |row, new_matrix|
    row.each_index do |idx|
      new_matrix << [] if new_matrix[idx].nil?
      new_matrix[idx] << row[idx]
    end
  end
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Further Exploration

# Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

# just use recursion

# we can normalize degree argument from 0 to 360
# use a key to change numbers between those 4 values to one of those 4... rly just 
# 0, 90, 180, 270

# base case is if argument is 0
# just have it return the matrix argument

# otherwise, recursive call -
pass into `rotate`(`rotate90`, degrees - 90)

def rotate(matrix, degrees)
  return matrix if degrees == 0
  rotate(rotate90(matrix), degrees - 90)
end

def rotate(matrix, degrees)
  degrees = (degrees % 360).to_i
  degrees = snap_to_right_angle(degrees)
  return matrix if degrees == 0
  rotate(rotate90(matrix), degrees - 90)
end

def snap_to_right_angle(degrees)
  case degrees
  when 1..90 then 90
  when 91..180 then 180
  when 181..270 then 270
  else 0
  end
end

p rotate(matrix2, 1)

^^ above is a recursive solution, 
^ i also normalize it so degrees beyond 0..360 work.
^ also added a helper method that snaps degrees to right angle degrees
, so to make code more resilient to inputs