42 minutes
=> 16:39 - finally started writing first line of code
that was bad.
I rewrote my algorithm, just to later realize the real issue was not paying attention to the indexing of the new array being different from the original array.
Also spent time having to rewrite the algorithm because
my intial pseducode didn''t account for:
1) can''t delete string by index and return the same index // much harder to do than with an Array
2) struggled to figure out how to delete two indexes spread apart from each other simulatenously for an Array
  - also with how to delete first occurence of a element not all elements
Why did I struggle so much?
  honestly the mid-level algorithm writing not being fleshed out/flawed, trying to start the 
  code but not accounting for nuances of the methods/data structures I''m using.
why didn''t my studying help?

=>8:00 - honestly, good start, I did PED and next starting A
=>15:45 - rly struggled writing algorithm (it was still incomplete), but moved on to code implementation
Issue was when I made changes like: 
Deciding against helper method - I had to change in 2 places now - in my pseudocode and in my actual code.
=>22:24 - up to this point, I’m struggling with translating my pseudocode into code, then I flounder cuz I realize I can’t delete at index by string… I could but I couldn’t think of it - so a big issue was failing to remember the best fundamental option - I chose a time consuming alternative of converting to array.
=>28:27 - ran into a false error and didn’t know what to do.. slowly I decide to redo my algo completely.
=>40:18 - finally after simplifying algo and refactoring, I realized the index was misaligned
from new array compared to original array

I struggled with
Turning a high level into a working 100% pseudocode which led me to waste time:
1. Having to rewrite pseudocode and my actual code adds mental pressure
2. trying to figure out the implementation while writing actual code
	surprised how weak my ruby method knowledge was
3. Struggling to debug an unexpected error within time constraints which made me scrap the whole
Algo and rewrite it - the pseudocode

Another struggle point was inadequate ruby fluency
- second guessed myself on not being able to delete by index for string - you can!
- didn''t know how to delete first occurence of array
- didn''t know how to delete 2 non-consecutive indexes of array simultaneously


The lesson is I shouldn’t move to actual code before I’m pretty much 100% confident w/ my solution. On my
2nd pseudocode writing, I felt was much neater and more concise. I should have just done that at the beginning instead of going with an incomplete plan and having to go back and rewrite it…
But the issue is sometimes I don’t realize problems of implementation until I start writing actual code:


# Write a method that takes a string as an argument, and returns true if all parentheses in the string are properly balanced, false otherwise. To be properly balanced, parentheses must occur in matching '(' and ')' pairs.


# given - string (possibly containing '(' or ')')
# return - a boolean that fulfills the condition 
#   condition: (), (( ))

# thoughts: not concerned with characters besides ( or )
# not just about number of ( or ) this matching
# the positions also have to be w/ ( on left and ) on right


# balanced?('What (is) this?') == true
# balanced?('What is) this?') == false
# balanced?('What (is this?') == false
# balanced?('((What) (is this))?') == true
# balanced?('((What)) (is this))?') == false
# balanced?('Hey!') == true
# balanced?(')Hey!(') == false
# balanced?('What ((is))) up(') == false
# balanced?('What ())(is() up') == false

# Data Structure
# ('What (is) this?') -> '()'
# ')'
# '('
# '(()())'
# '(())())' -> '())()' -> '())()' -> if we find '(' with no ')' then return false

# index("(") -> to check all indexes to right for ')' and if found delete pair and loop back 

# Algo
# High Abstract Approach
#   - delete all characters except for '()', convert to array and assign to char_arr
#   - call balanced_parentheses? 'str' on : helper
#     High level Approach
#     LOOP 
#       - iterate through each character, with index, `char` and `idx`
#       - char is '('
#         - check from idx to str.size for ')' using #index then delete both current char and that matching ')'' then next loop
#          if can't find, then return false
#       -')' check from 0 to index (excluding index), using #index then delete both current char and that matching ')'',then next loop
#        if can't find return false
#     END
#       - return true

# - `char_arr`

# - iterate through each `char`
#   - if `char` == ')' return false
#   - if 'char' == '('
#     - find ')' to right of char
#       if nil return false
#       otherwise delete char and delete at index where found ')'
    


def balanced?(str)
  p char_arr = str.delete('^()').chars

  until char_arr.size == 0
    char_arr.each_with_index do |char, idx|
      if char == ')'
        return false
      else
        right_side = char_arr[idx + 1..(char_arr.size - 1)]
        if right_side.index(')')
          char_arr[idx] = ''
          char_arr[right_side.index(')') + idx + 1] = ''
          char_arr.delete('')
          break
        else
          return false
        end
      end
    end
  end

  true
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false

def balanced?(str)
  str = str.delete('^()')

  until str.size == 0
    str.each_char.with_index do |char, idx|
      return false if char == ')'
      right_side = str[idx..(str.size - 1)]
      return false unless right_side.index(')')
      str.slice!(str.index('('))
      str.slice!(str.index(')'))
      break
    end
  end

  true
end
# ^ 5 minutes on 2nd pass:

# refactored again

def balanced?(str)
  str = str.delete('^()')
  until str.size == 0
    return false if str[0] == ')'
    return false unless str[1..-1].index(')')
    str.slice!('(')
    str.slice!(')')
  end
  true
end

# Further exploration
# Square brackets and curly brackets normally come in pairs. Quotation marks(single and double) also typically come in pairs and should be balanced. Can you expand this method to take into account those characters?

high abstract thoughts
- say we keep the tally system but just change the conditions to 
if the char is included in a string of `openers` like "([{'"'
  that doesn't work becuz '' and "" are not differentiated
  we can separate the logic for those two for ' ' and " " just check if its count is even

  main algo:
  - given `str`
  - substustute all occurences of substring "'s" with empty string
  - return false if count of "'" is odd
  - return false if count of \" is odd -> .count("\"")
  - assign `open_parens` and `close_parens` to '({[' and ')}]' respectively
  - init and assign `counter` to 0
  - iterate by `chars` through `str`
    - return false if counter less than 0
    - counter += 1 if char included in `open_parens`
    - counter -= 1 if char included in 'close_parens'
  - return false if `counter` != 0

  # other student pointed out issue how to ignore an \' if part of a word like it's
  # maybe a bad fix but tell it to ignore counts of ' that are directly followed with a "s"
  
  # 13:00 minutes for algo.
  # I''m dumb I just realized that each type of punctuation needs it''s own counter.
  
  # high abstract approach
  # - count occurences of ' and " - return false if either count is odd 
  # - for cases of {([, )]}
  # - loop through array containing these elements: '()', '{}', '[]', set open, close
  #   - init counter and assign to 0
  #   - iterate by `char` through `str`
  #     - return false if `counter` is less than 0
  #     - counter += 1 if char == open
  #     - counter -= 1 if char == close
  #     - return false if counter != 0
  # - return true

def balanced?(str)
  return false if str.count("'").odd? || if str.count("\"").odd?

  [['(', ')'], ['{', '}'], ['[', ']']].each do |open, close|
    counter = 0
    str.each_char do |char|
      return false if counter < 0
      counter += 1 if char == open
      counter -= 1 if char == close
    end
    return false if counter != 0
  end

  true
end

^ this code doesn''t work. why?
# the if should be removed after the ||
def balanced?(str)
  return false if str.count("'").odd? || str.count("\"").odd?

  [['(', ')'], ['{', '}'], ['[', ']']].each do |open, close|
    counter = 0
    str.each_char do |char|
      return false if counter < 0
      counter += 1 if char == open
      counter -= 1 if char == close
    end
    return false if counter != 0
  end

  true
end
  
  
p balanced?("\"\"\"\"") # true

p balanced?("\'\'\'") # false