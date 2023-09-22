# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.
def word_sizes(str)
  words = str.split
  size_counts = Hash.new(0)
  words.each do |word| 
    letter_counter = 0
    word.downcase.chars.each { |char| letter_counter += 1 if ('a'..'z').include?(char)}
    size_counts[letter_counter] += 1
  end
  size_counts
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}


# ans key solution:
# essentially, delete all non-alphabeticals
# def word_sizes(words_string)
#   counts = Hash.new(0)
#   words_string.split.each do |word|
#     clean_word = word.delete('^A-Za-z')
#     counts[clean_word.size] += 1
#   end
#   counts
# end

# other student's
# essentially, count all alphabeticals
# def word_sizes(string)
#   result = Hash.new(0)
#   string.split.each { |word| result[word.count("a-zA-Z")] += 1}
#   result
# end

# another student's
def word_sizes(string)
  # whereas previous solutions incremented hash values iteratively
  # this solution first builds a new array with sizes of each word as elements
  clean_string = string.downcase.delete('^ a-z')
  sizes = clean_string.split.map(&:size)
  sizes.map { |size| [size, sizes.count(size)] }.to_h
  # ^ here #maps gonna return an array of nested arrays that are hashifiable
  # but during hashification - duplicate hash keys get overwritten by interpretter like below:
  # [1] 3.2.2 > [[1, 1], [1, 1], [1, 1]].to_h
# {
#     1 => 1
# }
end