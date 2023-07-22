# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.


def prompt(msg)
  puts ">> #{msg}"
end


num = 0

loop do
prompt('Please enter an integer greater than 0')
num = gets.chomp

if num == num.to_i.to_s && num.to_i > 0
  break
end
end

int = num.to_i
operator = ''

loop do
prompt("Enter 's' to compute the sum, 'p' to compute the product.")
operator = gets.chomp

if operator == 's' || operator == 'p'
  break
end
end

if operator == 's'
  # result = (1..int).sum
  result = (1..int).inject(:+)
  puts "The sum of the integers between 1 and #{int} is #{result}."
else
  # result = 1
  # (1..int).each  { |n| result = result * n}
  result = (1..int).inject(:*)
  puts "The product of the integers between 1 and #{int} is #{result}."
end