def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# each method: 0, 1, 2, 3
# 'dull' - index 1

# 'boring' - index 2

In Ruby, #each call iterate by index +1 over the calling collection without consideration of how collection's size changes dynamically.

During #each call, within iterative block execution when `word` is assigned to `dull`, the each call is iterating on the 2nd element of the collection, next call, it will iterate on the 3rd element. If we mutately delete the same element we iterate over, then the next element gets shifted to become the 2nd element, so `boring` gets skipped over as each calls iterates over the 3rd element of the mutated calling collection

possible fix:
def neutralize(sentence)
  words = sentence.split(' ')
  words.each_with_index do |word, idx|
    words[idx] = '' if negative?(word)
  end
  words.delete('')

  words.join(' ')
end

Ans key using #select / #reject
def neutralize(sentence)
  words = sentence.split(' ')
  words.reject! { |word| negative?(word) }
  words.join(' ')
end

here''s an implementation of reject! - which is essentially what we wanted to do for this prob:

def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end

index doesn''t increment if condition is met and current element gets deleted.