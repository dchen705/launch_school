# Components
#   load in a text file √
#   substitute a specific substring like %{noun} using #format
  # need to figure out how to use #format
#   how represent text data

require 'yaml'

text_file = YAML.load_file('madlibs.yml')
p text_file


# figuring out #format or #sprintf

# format(%s)
  
# 30 min in, can't figure out #format
# ok this is pretty helpful:

# sprintf("%<foo>d : %<bar>f", { :foo => 1, :bar => 2 })
#   #=> 1 : 2.000000
# sprintf("%{foo}f", { :foo => 1 })
#   # => "1f"

# so first argument is just a single string containing format sequences:
# one relevant format sequence is %<name> or %<name>, name is a placeholder
# for any variable, such as noun, adjective, etc.
# then 2nd argument is hash object with keys of the specific names for the format sequence
# and the keys being the values to be substituted into

p format("%<foo>%, %<foo>%, %<foo>%", { :foo => ['a','b','c']})
# returns "%, %, %"

p format("%<foo>s, %<foo>s, %<foo>s", { :foo => ['a','b','c']})
# returns "[\"a\", \"b\", \"c\"], [\"a\", \"b\", \"c\"], [\"a\", \"b\", \"c\"]"

p format("%<foo>s, %<foo>s, %<foo>s", { :foo => ['a','b','c'].sample})
# returns "a, a, a"
# ok so the return value of #sample is fixed and applied to all 3 format sequences

# does #format change the object?

text = "%<abc>sde"
format(text, { :abc => '123'})
p text
# returns "%<abc>sde"

p format(text, { :abc => '123'})
# returns "123de"

# so #format is nonmutating

text = "%{abc}sde"
p format(text, { :abc => '123'})
# "123sde" 
# ah so #{} doesn't need to end with a field character

# 57 minutes in.

# I almost feel like using #sub iteratively would be easier.

text = 'abc abc abc'
p text.gsub('abc', ['1', '2', '3'].sample)
# returns "3 3 3"

# prompt says how i represent data is important...
# are they saying I literally just write the data as an array of words?

# im thinking just convert text to array of words, iterate through each words,
# reformat the word if contains the specific string

adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily noisily excitedly)

format_sequences = ["%{adjective}", "%{noun}", "%{verb}", "%{adverb}" ]
    
words_list = text_file.split

words_list.each do |word|
    if format_sequences.any? { |sequence| word.include?(sequence) }
        word.replace(format(word, { :adjective => adjectives.sample,
                 :noun => nouns.sample,
                 :verb => verbs.sample,
                 :adverb => adverbs.sample }))
    end
end

puts words_list.join(' ')

# 1: 23 minutes in

# ans key:
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERBS    = %w(easily lazily noisly excitedly).freeze

File.open('madlibs2.txt') do |file|
  file.each do |line|
    puts format(line, noun:      NOUNS.sample,
                      verb:      VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb:    ADVERBS.sample)
  end
end

# a requirement of ans key is we can't format the 
# text to have two of a type in same line... example 2 nouns in one line or they will share.
# also look how they don't require yml files, can just open a text file.


# Other student's solution:
# yeah i wish i knew a method like #match? that returns boolean and can search 
# for substring - pair that with a while loop and nest under each, and pretty
# goo approach.

replacement_words = {
  "%{noun}" => ['fox', 'dog', 'head', 'leg'],
  "%{verb}" => ['jumps', 'lifts', 'bites', 'licks'],
  "%{adverb}" => ['easily', 'lazily', 'noisily', 'excitedly'],
  "%{adjective}" => ['quick', 'lazy', 'sleepy', 'ugly']
}

file = File.open("madlib_text.txt")
text = file.read

replacement_words.each do |type, words|
  while text.match?(type)
    text.sub!(type, words.sample)
  end
end

puts text

# my refactored solution using #File object class methods

adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily noisily excitedly)

format_sequences = ["%{adjective}", "%{noun}", "%{verb}", "%{adverb}" ]
    
words_list = File.read('madlibs.txt').split

words_list.each do |word|
    if format_sequences.any? { |sequence| word.include?(sequence) }
        word.replace(format(word, { :adjective => adjectives.sample,
                 :noun => nouns.sample,
                 :verb => verbs.sample,
                 :adverb => adverbs.sample }))
    end
end

puts words_list.join(' ')

# other students:
MADLIBS = {
  '%{adjective}' => ['quick', 'lazy', 'sleepy', 'ugly'],
  '%{noun}' => ['fox', 'dog', 'head', 'leg'],
  '%{verb}' => ['jumps', 'lifts', 'bites', 'licks'],
  '%{adverb}' => ['easily', 'lazily', 'noisily', 'excitedly']
}

def madlibs(text)
  output = text.clone
  MADLIBS.each do |k, v|
    text.count(k).times { output.sub!(k, v.sample) }
  end
  puts output
end

text = File.read('madlibs.txt')
madlibs(text)

^ I thought of doing something like this, though... isn't string#count by single
characters not by substrings?