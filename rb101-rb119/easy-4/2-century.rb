# Write a method that takes a year as input and returns the century. The return value should be a string that begins with the century number, and ends with st, nd, rd, or th as appropriate for that number.

# New centuries begin in years that end with 01. So, the years 1901-2000 comprise the 20th century.

# Algorithm:
# 1) Take the year, output the century number
# 2) Determine and append appropriate suffix 
#   a) take the last digit of century number
#   b) check collections that contain 1 of each digit linked to the appropriate suffix -> key: value in form of 
#   array: String


def century(year)
  century = ((year - 1) / 100) + 1
  century = century.to_s
  last_2_digits = century.length > 1 ? century[-2, 2].to_i : century.to_i
  suffix = select_suffix(last_2_digits)
  century + suffix
end

def select_suffix(last_2_digits)
  num_to_suffixes = {[10, 11, 12, 13] => "th", [0, 4, 5, 6, 7, 8, 9] => "th", [1] => "st", [2] => "nd", [3] => "rd"}
  
  if num_to_suffixes.keys[0].include?(last_2_digits)
    return "th"
  end
  
  num_to_suffixes.delete([10, 11, 12, 13])
  
  last_digit = last_2_digits < 10 ? last_2_digits : last_2_digits % 10
  
  num_to_suffixes.each do |numbers, suffix|
    if numbers.include?(last_digit)
      return suffix
    end
  end
end  

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# It took me 2-4 edits before I passed all the cases.
# First I didn't pass the last three because I didn't account for 11th, 12th, 13th
# I changed select suffix method to pass in the last two digits
# Then I failed all the cases except for the last three because I mistakenly
# filtered out the second to last digit with integer division rather than the last
# digit as intended with %
# I changed to % then I failed the cases in which the century was a single digit
# because I was selecting for a double digit with string[-2, 2] so nil would be
# returned due to out of range.

# When I looked at answer key, I realized using case (when and else) structure was simpler
# than using a hash dictionary. 
# I remember as I started out, my mind worked backwards order of PEDAC
# starting from the algorithm -> then to the data structure
# I guess this shows the importance of following the order of PEDAC

# I chose my data structure without any basis

# If I had spent more time prelim thinking clearly about inputs and outputs
# perhaps I would have seen the pattern that only 1, 2, 3 were linked to 
# the suffixes that were not "th" - every other number used "th" so assigning "th"
# to an else branch prob was better.

# Seeing the input and output pattern before picking the data structure

# Seeing the answer key, it's crazy how the solution was condensed and broken down into about
# really 4 step concise logical procedures. I spent over an hour over a convoluted process.
