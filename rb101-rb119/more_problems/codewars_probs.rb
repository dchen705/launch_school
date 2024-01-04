# def pangram?(string)
#   string.downcase.delete("^a-z").chars.uniq.size == 26
# end


def pangram?(string)
  ('a'..'z').to_a.all? do |char|
    string.downcase.include?(char)
  end
end

Best practice versions:
def panagram?(string)
  ('a'..'z').all? { |x| string.downcase.include? (x) } 
end

def panagram?(string)
   string.downcase.scan(/[a-z]/).uniq.size == 26
end

=================================================================================

def scramble(s1,s2)
  s2.each_char do |char|
    if s1.include?(char)
      s1.sub!(char, '')
    else
      return false
    end
  end
  true
end


Other''s

# same approach, cleaner
def scramble(s1,s2)
  s2.split("").each do |letter|
    return false unless s1.slice!(letter)
  end
  return true
end


# another approach
def scramble(s1,s2)
  s2.chars.uniq.all?{|x| s2.count(x)<=s1.count(x)}
end

# mine refactored
def scramble(s1,s2)
  s2.each_char do |char|
    return false unless s1.sub!(char, '')
  end
  true
end

=================================================================================
def solution(number)
  (1...number).reduce(0) do |sum, n| 
    n % 3 == 0 || n % 5 == 0 ? sum + n : sum 
  end
end

Other''s
def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end

=================================================================================

given - string of integer characters
return - largest product out of any possible 5 consecutive digits

rules/requirements
- assume string is more than 5 chars

greatest_product("123834539327238239583"), 3240
greatest_product("92494737828244222221111111532909999"), 5292
greatest_product("02494037820244202221011110532909999"), 0

DS intermed pathway
"123834539327238239583" -> ['12383', '23834'... '39583']
start index -> 0...(size - 5)
  start index, length of 5 -> `all_5_digit_sequences`

  ['12383', '23834'... '39583'] -> [[1, 2, 3, 8, 3]]
  #digits
  # reduce(:*)
  # max product

high abstract summary
  low lvl algo
get all possible 5 digit subsequences of string, transform each string into arrays then transform arrays into product then find the max
  - given 'num'
  - initialize `subsequences`
  - iterate from 0..(num.length - 5), set `start_idx`
    - subsequences << slice of length 5 from start_idx
  - for each subsequence in subsequences:
    - transform into array into product of elements of Array
  - find the max of tranformed susbequence and return max

def greatest_product(num)
  subsequences = (0..(num.length - 5)).each_with_object([]) do |start_idx, subsequences|
    subsequences << num[start_idx, 5]
  end

  subsequences.map do |subsequence|
    subsequence.chars.map(&:to_i).reduce(:*)
  end.max
end

p greatest_product("123834539327238239583")#, 3240
p greatest_product("92494737828244222221111111532909999")#, 5292
p greatest_product("02494037820244202221011110532909999")#, 0

# Other's
def greatest_product(n)
  n.chars.each_cons(5).map { |a| a.map(&:to_i).reduce(:*) }.max
end

ALGO
1. Convert the input string into array of digit string
2. Loop from 0 to size of array - 5
  - slice digit char array from current index with length of 5
  - convert each elem of sliced subarray from string to integer
  - get the product of all 5 digits in sliced subarray
  - store the product in output array `prod_arr`
3. Return the maximum number from `prod_arr`

=end

def greatest_product(str)
  digit_arr = str.chars
  prod_arr = (0..digit_arr.size - 5).map do |index|
    int_arr = digit_arr[index, 5].map(&:to_i)
    int_arr.reduce(:*)
  end
  prod_arr.max
end

=================================================================================
given - string
return - integer representing count of all alphanumberic case-insensitive chars occuring more than once


duplicate_count(""), 0
duplicate_count("abcde"), 0
duplicate_count("abcdeaa"), 1
duplicate_count("abcdeaB"), 2
duplicate_count("Indivisibilities"), 2

DS intermed pathway
"Indivisibilities" -> "indivisibilities" ->
tally of counts of each character
{ "i" => 7, "n" =>}. count entries (only those with values 2 or higher)

"indivisibilities"
iterate by char - 
'i', 'n'
Hash.new(0)
char_count[char] += 1
char_count['i'] = 1 ... etc..

High abstract summary
  low lvl algo
get tally of each character count of downcased string, then count entries of tally that are equal or higher than 2 in value
  - given text
  - downcase text then iterate by character while initializing a hash object, set to `char` and `char_count` respectively
    - increment by 1 char_counts value at key: `char`
  ^ count the entries with value equal or greater than 2 and return count

def duplicate_count(text)
  text.downcase.each_char.with_object(Hash.new(0)) do |char, char_count|
    char_count[char] += 1
  end.count { |_, v| v >= 2}
end

p duplicate_count("")#, 0
p duplicate_count("abcde")#, 0
p duplicate_count("abcdeaa")#, 1
p duplicate_count("abcdeaB")#, 2
p duplicate_count("Indivisibilities")#, 2

#other approach
# convert to array, delete 1 instance of every unique character and then uniqued and find the size of unique array

# other's
def duplicate_count(text)
  ('a'..'z').count { |c| text.downcase.count(c) > 1 }
end
^ forgot to include numerics like digits

def duplicate_count(text)
  arr = text.downcase.split("")
  arr.uniq.count { |n| arr.count(n) > 1 }
end

# another 2 version of my approach
def duplicate_count(text)
  hsh = Hash.new(0)
  text.downcase.chars.each { |c| hsh[c] += 1 }
  hsh.values.count { |k| k > 1 }
end

def duplicate_count(text)
  text.downcase.chars.tally.count { |k, v| v > 1 }
end