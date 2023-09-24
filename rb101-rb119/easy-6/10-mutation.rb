# What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# %w(Moe Larry CURLY SHEMP Harpo CHICO Groucho Zeppo)

# If we are assuming what's concatenating to array2 is not a copy of `value` but the object_id /
# reference value itself of `value` then array2 will but mutated just like array1
# because they are different collection objects but they share objects within.