26:30
# Given 
#   - set of blocks
#   - String
#   condition for true is if the string can be made from the characters in the block set according to rule below
# Return a boolean

# Rules/Requirements
#   - a set of blocks contains blocks
#   - a block has two characters
#   - any character in the block set can only be included once in the String
#   - only one character out of 2 characters of any given block can be used in the string. Both characters of a block can''t be included.
#   - there are no duplicat characters between blocks
#   - case insensitive


# BLOCKS = B:O  X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

# B:O  X:K   D:Q   C:P   N:A
# G:T   R:E   F:S   J:W   H:U
# V:I   L:Y   Z:M

# ['bo', 'xk', 'dq'] -> ['bo', 'xk']

# High Abstract Option
#   - given list of blocks, 'blocks', as a list of 2 character strings and a `word`
#   - iterate by `chars` through `word`
#     - for each `char`, iterate through `blocks`, 
#       - for each block:
#         if find char in block
#           delete current block from blocks
#           next
#         if reach of block then return false

# Selection (especially rejection)
# - given list of blocks, 'blocks', as a list of 2 character strings and a `word`
# - iterate by `chars` through `word`
#     get a new block set, deselecting any block that contains char and reassigning to `blocks``
#     if no blocks get deslected from 'blocks, then return false
^ didnt use this one cuz if one character was in two 2 separate blocks, they'd
both be deselected.. though text case doesn't include this, still wanna avoid this.


BLOCKS = %w(BO  XK   DQ   CP   NA
GT   RE   FS   JW   HU
VI   LY   ZM)

def block_word?(word)
  word = word.upcase

  block_set = BLOCKS.each_with_object([]) do |block, set|
    set << block
  end

  word.each_char do |char|
    block_set.each_with_index do |block, idx|
      if block.include?(char)
        block_set.delete_at(idx)
        break
      else
      return false if idx == block_set.size - 1
      end
    end
  end

  true
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true