# Write a method that takes a positive integer, n, as an argument, and displays a right triangle whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the images below) should have one end at the lower-left of the triangle, and the other end at the upper-right.

# instinct algo:
# make a loop iterating n times
# first prints appropriate # of spaces
# then prints appropriate # of *

def triangle(n)
  n.times do |x|
    puts "#{' ' * (n - (x + 1))}#{'*' * (x + 1)}"
  end
end

triangle(3)

triangle(9)

# answer key, set space and star variables and incremented them 

# def triangle(num)
#   spaces = num - 1
#   stars = 1

#   num.times do |n|
#     puts (' ' * spaces) + ('*' * stars)
#     spaces -= 1
#     stars += 1
#   end
# end

def reversed_triangle(n)
  num_spaces = 0
  num_stars = n
  
  n.times do |x|
    puts (' ' * num_spaces) + ('*' * num_stars)
    num_spaces += 1
    num_stars -= 1
  end
end

reversed_triangle(9)
