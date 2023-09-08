# Using the multiply method from the "Multiplying Two Numbers" problem, write a method that computes the square of its argument (the square is the result of multiplying a number by itself).

def multiply(n1, n2)
  n1 * n2
end

def square(num)
  multiply(num, num)
end

def power_to_n(num, n)
  if n == 1
    num
  elsif n.even?
    multiply(num, num) * (n / 2)
  elsif n.odd?  
    (multiply(num, num) * ((n - 1) / 2)) * num
  end
end

p square(5) == 25
p square(-8) == 64

p power_to_n(2, 0)
p power_to_n(2, 1)
p power_to_n(2, 2)
p power_to_n(2, 3)
p power_to_n(2, 4)
p power_to_n(2, 5)

# adding powers funcionality

# 0 -> 1
# 1 -> num
# 2 -> num * num -> multiply(num, num)
# 3 -> num * num * num -> multiply(num, num), num
# 4 -> num * num * num * num -> multiply(multiply(num, num), multiply(num, num))


# One student used a for loop... not bad to exponentiate
