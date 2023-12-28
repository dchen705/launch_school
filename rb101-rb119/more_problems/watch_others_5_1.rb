19:30
I''d break it down into 3 main phases of problem solving
- Understanding problem / High level thinking
- Pseudocode detailing / mid level
- Implemenation / low level, ruby fluency

Flow:
summarize problem (input/output, given/return)
high abstract thoughts
rules/requirements
test cases
high level algorithm
go back to test case and data structure pathway example
mid level algorithm (pseudocode)
code implementation
  - test it
  - debug
  - irb data walkthrough
  
Looking at own vid, made some speaking mistakes but fixed later.
ie: flipping string and substring, disincluding single chars from example data structure walkthrough
saying iterate up to length instead of length - 1
  
Other student
- similar process honestly
- did not talk about single chars being palindromes
- TA advised him to break into more helper methods.
- observation
  - had trouble describing in simple language the get_substrings method
   even though he had "feeling he knew what to do" (but stumbled)
- he developed high level process quickly and clearly but what slowed
   him down was implementations
  - stumbling blocks:
    - writing out get substrings algo
      - tried to iterate up to length not length - 1
      - got leading substrings from index 0, didn''t know the nested iteration 
      (double pointers for index range slice) trick
      - at first tried to convert from string to array, forgot conversion back,
      decided to leave as string.
  - TA advised - "write out all the substrings from an example before coming up with algo"
    - tried Array#max to find max length but it returned alphabetical value max
      his tentative alternative was to iterate through and use max_length variable to keep track of longest length
    
    the more stuff you have figured out, the less burden/anxiety you have.
  - TA "if it's hard to articulate how to implement, usually will run into trouble when implementing"
    


# given String
# return an integer representing the length of the longest palindrome (substring that equals its reversed self) within the input String

# Rules/Requirements
#   - if it's empty string given, return 0
#   - a single character counts as a palindrome and has length 1

# longest_palindrome('a') = 1
# longest_palindrome('aa') = 2
# longest_palindrome('baa') = 2
# longest_palindrome('aab') = 2
# longest_palindrome('baabcd') == 4
# longest_palindrome('baablkj12345432133d') == 9

# 'baa' -> ['b', 'ba', 'baa', 'a', 'aa, 'a'] ->
# ['aa'] -> 2



# High abstract approach
#   - from input string, get a list of all substrings
#   - iterate through `substrings` and select the  `palindromes` subset and assign to var
#   - sort the `palindromes` list
#   - get the longest's length of `palindromes`

# # Algorithm
# #   - `get_substrings` and assign to `substrings`
# #     - given `str`
#       - iterate from 0 to `size` - 1, set `start_idx`
#         - iterate from `start_index` to `size` - 1, set `end_idx`
#           - concatenate slice of str from start_idx to end_idx

def get_substrings(str)
  substrings = []
  (0..(str.size - 1)).each do |start_idx|
    (start_idx..(str.size - 1)).each do |end_idx|
      substrings << str[start_idx..end_idx]
    end
  end
  substrings
end

def longest_palindrome(str)
  return 0 if str.empty?
  substrings = get_substrings(str)
  palindromes = substrings.select do |substring|
    substring == substring.reverse
  end
  palindromes.sort_by! do |palindrome|
    palindrome.length
  end
  palindromes[-1].length
end

p longest_palindrome('') == 0
p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9