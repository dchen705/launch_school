# Write a program that prompts the user for two positive integers, and then prints the results of the following operations on those two numbers: addition, subtraction, product, quotient, remainder, and power. Do not worry about validating the input.


def prompt(msg)
  puts "==> #{msg}"
end

prompt('Enter the first number:')
first_num = gets.chomp.to_i

loop do
prompt('Enter the second number:')
second_num = gets.chomp.to_i
break if second_num != 0
end

operators = %w(+ - * / % **)

operators.each do |operator|
  prompt("#{first_num} #{operator} #{second_num} = #{(first_num.send(operator, second_num)).to_s}")
end

# Didn't know how to change a string version of arithmetic operator
# into actual arithmetic operator 

#chat gpt gave a way:
# operator = '+'
# operand1 = 5
# operand2 = 10

# result = operand1.send(operator, operand2)
# puts result

# the actual way to represent arithmetic operator is
# with symbol
# like this
# :+