# Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

# Problem
# Restatement:
# return new array that is same values as input array discluding vowels

# pretty sure this is perfect for string#delete which operates on a character by character level.

def remove_vowels(arr)
  # arr.join.delete('aeiou').chars
  # didn't work, realized i need uppercase
  # hmm realized:
  # %w(bcd) == ['bcd'] not ['b', 'c', 'd']
  # i should be #join(" ") then split(" ") instead of chars
  
  # arr.join(' ').delete('aeiouAEIOU').split(' ')
  # ah crap, the last test case fails. how to handle this... I should use array of strings
  # rather than a pure string
  
  arr.map { |element| element.delete('aeiouAEIOU') }
end

p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']