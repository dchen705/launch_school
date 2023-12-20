# def repeated_substring_pattern(str)
  
# end

# given: string
# return: boolean
#   condition for true: the entire string contains a substring that when multipled
#   a certain times equals the value of the entire string
  
# 'abab' -> true, 'ab' + 'ab'
# 'abcd' -> false # abcd is not a substring of abcd, substring cannot be equal length of string
# 'xyzqpxyzqp'

# there's this abstraction I'm trying to come up with a word for...
# when you see a general pattern that's common for each test case, but you
# aren't sure if it''s a universal rule but you feel you should use it
# within your algorithm as it reduces the boundaries.

# ^ an example in this case, is not having to check substrings that start at index
# 1 or higher.

# can i come up with example where substring starts at index 1 or higher?
# 'aaaa'-> 'a' or 'aa'

# do distinction needed if multiple substrings to fulfill condition

# odd or even in length - doesn't matter. both can fulfill

# the substring has to have a length that's a factor of the string length

# what if it's an emtpy string?
# ''

# also for each testable substring we only need to test one multipler -
#   - string length / substring length
  
# We only need to iterate halfway up the string.
  
# High Level Approach:
#   - get all leading substrings that start at index 0 up to halfway index that have
#   lengths that are a factor of input string length, assign to list `potential_substrings`
#   - iterate over `potential_substrings`, for each `substring`:
#     - check if `substring` * (input str length / substring length) == string

# abcd - 4, 1
# abcde - 5, 2
# size / 2

# 5 / 2 = 2.5
# 4 / 2 = 2
    
    
def repeated_substring_pattern(str)
  potential_substrings = (0..(str.size / 2)).each_with_object([]) do |idx, list|
    substring = str[0..idx]
    if (str.size / substring.size) == (Float(str.size) / substring.size)
      list << substring
    end
  end
  
  potential_substrings.each do |substring|
    multipler = str.size / substring.size
    return true if substring * multipler == str
  end
  
  false
end

def repeated_substring_pattern(str)
  potential_substrings = (0..(str.size / 2)).each_with_object([]) do |idx, list|
    substring = str[0..idx]
    if (str.size / substring.size) == (Float(str.size) / substring.size)
      list << substring
    end
  end
  
  potential_substrings.each do |substring|
    multipler = str.size / substring.size
    return true if substring * multipler == str
  end
  
  false
end

p repeated_substring_pattern('abab')
p repeated_substring_pattern('aba')
p repeated_substring_pattern('aabaaba')
p repeated_substring_pattern('abaababaab')
p repeated_substring_pattern('abcabcabcabc')

# ^ this time instead of focusing on problem loading phase 
# I focused on this phase that's purpose was to test different cases
# to determine general rules/relationships that reduce the bounds 
# do we need to test all substrings? no, only the ones that start at 0
# do we need all substrings that start at 1? no, only go up to half
# actually also, only those w/ lengths that are factors of inut string length.


# ^ once I did above, I could describe the high level approach.

# I started writing out the code immediately

# there were small implementation hurdles that stopped me, so I went back to the high level
# notes and wrote out what to do and tested out in irb
# notably was how to determine if a number was a factor of another number:
# I wrote some test lines out, came up with the rule, then went on irb to test it out
# ^ like a mini version of what I just did above.

# ^ all in all, I think it took 30-35 minutes but this was my 2nd time going through
# the prob.

# that stage where test and come up with general rules/patterns is harder it seems
# then the stage where I take the patterns and make a high level approach
# last the stage where I already have the high level approach and implementing in code form

# another last phase is refactoring
# I could go back and abstract out the helper method for getting #potential_substrings

# Other student:
# used diff iteration to collect substrings, he iterated over the lengths (1 to half)
# he also tested more
# used str.size % substring.size == 0 to test if it's a factor
# he also didn't bother with psuedocode as intermediate after getting the high level approach
# TA comment: better parameter naming and (like I said) extracting that helper method