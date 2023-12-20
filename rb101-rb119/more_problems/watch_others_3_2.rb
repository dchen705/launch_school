22 min total
2:30 - Problem understanding phase - went by smoothly - 
-> 8:48 - Algorithm brainstorming
-> 9:54 - going over data structures (probably could have done before algo brainstorming)
-> 18:01 - I started implementing in code, ended up stuck until 18:01 due to not noticing a 
  - reverse range error. 
  
  
^^ Suggestion: fairly comfortable with understanding prob through example cases, but then
i''m a little disorganized - I skip to algo then go back to data structure.
I dived straight into code from my high level algo... an issue that happened with this approach
was I stumbled at the implementation level...

Another lesson learned was I was trying mix method definition putting into irb and it was just a big
annoyance - trying to edit (also no autofill) just put it on the left panel and run the code.
Just keep testing code process in the text editor, not on the terminal on the right.

Also, compared to other student, I could improve on writing pseudocode.
# given a list of strings - only in lowercase letters
# return a new string representing the common prefix
#   existing in all strings, return empty string if no common prefix

# p common_prefix(['flower', 'flow', 'flight'])

# Thoughts

# - iterate through all leading substrings at index 0 of any provided substring (arbitrary - take first string in list)

# 'flower' -> ['flower', 'flowe', 'flow'] -> 

# iterate from length of string to length 1
#   extract each substring starting at index 0, place in `leading_substrings` array

# iterate through `leading_substrings` taking longest length first then to shortest length - call the iterative method all?
#   - check if every string in input array from index 0 to lenght of current substring are equal
#     if yes, the return current substring

#   at end, return empty string if not

strings = ['flower', 'flow', 'flight'] 
  def get_leading_substrings(strings)
    # get a list of leading substrings from index 0, sort by longest to shortest
    leading_substrings = []
    (1..(strings.first.size)).reverse_each do |length|
      leading_substrings << strings.first[0, length]
    end
    leading_substrings
  end

def common_prefix(strings)
  leading_substrings = get_leading_substrings(strings)
  leading_substrings.each do |prefix|
    return prefix if strings.all? do |string|
      string[0, prefix.length] == prefix
    end
  end
  return ''
end

p common_prefix(['flower', 'flow', 'flight'])
p common_prefix(['interspecies', 'interstellar', 'interstate'])
p common_prefix(['throne', 'dungeon'])
p common_prefix(['throne', 'throne'])