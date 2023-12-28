Timing: PEDAC + 1 working solution + talking
  - 27:24 - damn thought I went faster, but okay, it''s a start
# Write a method that returns a list of all substrings of a string that are palindromic. That is, each substring must consist of the same sequence of characters forwards as it does backwards. The return value should be arranged in the same sequence as the substrings appear in the string. Duplicate palindromes should be included multiple times.

# You may (and should) use the substrings method you wrote in the previous exercise.

# For the purposes of this exercise, you should consider all characters and pay attention to case; that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are. In addition, assume that single characters are not palindromes.


# palindromes('abcd') == []
# palindromes('madam') == ['madam', 'ada']
# palindromes('hello-madam-did-madam-goodbye') == [
#   'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#   'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#   '-madam-', 'madam', 'ada', 'oo'
# ]
# palindromes('knitting cassettes') == [
#   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
# ]
# # ========================
# Problem
#   Restated
#     given a string, return a list of all substrings of that string that are palindromic. Palindromic meaning reversed is same as original.

#     Rules/Requirements
#       duplicate palindromes are counted multiple times
#       single characters are not palindromes
#       palindromes are case-sensitive 
#       non-alphabeticals are kept when detecting palindromes

#   Clarification
#   "return value should be arranged in the same sequence as the substrings appear in the string." ->
#       same sequence as they appear meaning that the list of strings returned are ordered based on their first character index position so:
#           'abcd' -> substrings that start with a are first... then substrings that start with b come next

# THoughts: 
#   if we iterate character by character to collect substrings into a list, then the ordering requirment should be fulfilled.


#     Examples
#     palindromes('abcd') == []
#       'a', 'ab', 'abc', 'abcd', 'b', 'bc', etc.. -> `substrings`

#       `substrings` iterate over....

#         'a' != 'a'.reverse... nothing gets add
#         return empty string
#     palindromes('madam') == ['madam', 'ada']

#       `substrings`
#         'madam' == 'madam'.reverse
#         return_arr [] << current element 'madam'


#     palindromes('hello-madam-did-madam-goodbye') == [
#       'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
#       'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
#       '-madam-', 'madam', 'ada', 'oo'
#     ]

#       non alphas like '-' are included
#       minimum size is 2 characters long
#     palindromes('knitting cassettes') == [
#       'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
#     ]

#     Data Structure
#       (input) string ->
#       (black box)
#       (end output) list of strings

#     Algorithm
#       Approach 1 High Level
#         - get all substrings from string into a list ordered by how they appear in the string. (-> HELPER)
#             ^ get by iterating character index by character index 
#         - iterate through all of these substrings, and check 
#         go to next if substring size is < 2
#         if they are palindromes and push to another new list if they are.
        
#         Approach 1
#            - set `str` as input String
#            - invoke `get_substrings` w/ `str` and assign to `substrings`
#            - invoke `get_palindromes` w/ `substrings`

#            get_substrings:
#             - set `str` as input str parameter
#             - set `substrings` to []
#             - iterate 0...str.size, set `strt_idx` as current element
#               - iterate strt_idx...str.size, set `end_idx` as current element
#                 `substrings`<< str[strt_idx..end_idx]
#               - return substring

#             #get_palindromes
#               - set `substrings` as parameter
#               - set `palindromes` to []
#               - iterate through each of `substrings`, set `substring` as current elmeent
#                 - next iteration if `substring`.size > 2
#                 - if substring == substring.reverse
#                   plaindomres << substring
#                 - then return plaindomres



# ========================

def palindromes(str)
  substrings = get_substrings(str)
  palindromes = get_palindromes(substrings)
end

def get_substrings(str)
  substrings = []
  (0...str.size).each do |strt_idx|
    (strt_idx...str.size).each do |end_idx|
      substrings << str[strt_idx..end_idx]
    end
  end
  substrings
end

def get_palindromes(substrings)
  palindromes = []
  substrings.each do |substring|
    next if substring.size < 2

    if substring == substring.reverse
      palindromes << substring
    end
  end
  palindromes
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
# ========================
# Further exploration:
I need them to clarify about ignoring nonalphabetical..
  1 do they mean return an array of substrings where each substring discludes the nonalphas
  2 or they mean return the array of substrings, leave original substrings but check if its palindrome
  by ignoring nonalphas
  
I chose option 2:
def get_substrings(str)
  substrings = []
  (0..(str.size - 1)).each do |start_idx|
    (1..(str.size - start_idx)).each do |length|
      substrings << str[start_idx, length]
    end
  end
  substrings
end

def palindromes(str)
  substrings = get_substrings(str)
  
  substrings.select do |substring|
    substring = substring.downcase.delete('^a-z1-9')
    if substring.size > 1
      substring == substring.reverse
    else
      false
    end
  end
end

^ note this will change the 3rd test case to false becaues now
substrings like "madam-" evaluate as palindromes since we ignore the "-"

# Other students solution:
not using #delete but #include instead:
ALPHANUMERIC = Array('a'..'z') + Array('A'..'Z') + Array('0'..'9')

def remove_non_alphanumerics(str)
  str.chars.select do |char|
    ALPHANUMERIC.include?(char)
  end.join
end

# ========================
