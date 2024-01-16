def palindrome_substrings(str)
  palindromes = []
  (0..(str.size-1)).each do |start_char_idx|
    next if start_char_idx == str.size - 1
    # ^ edit: needs this to skip on last char of string
    indices_of_matching_chars = []
    ((start_char_idx + 1)..(str.size - 1)).each do |end_char_idx|
      # ^ edit: should iterate starting at 1+ of the start_char_idx
      if str[start_char_idx] == str[end_char_idx]
        indices_of_matching_chars << end_char_idx
      end
    end
    indices_of_matching_chars.each do |matching_end_idx|
      substring = str[start_char_idx..matching_end_idx]
      if substring == substring.reverse
        palindromes << substring
      end
    end
  end
  palindromes
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []

# Algo I used:
# •  Iterate from range 0 to string size minus 1, set parameter `start_char_idx`
# o  Create `indices_of_matching_chars` variable and assign to empty array.
# o  Iterate from range start_char_idx to string size minus 1, set parameter to `end_char_idx
#   If `start_char_idx` == `end_char_idx`
# •  Add end_char_idx to array `indices_of_matching_chars
# o  Iterate over `idiocies_of_matching_chars, set parameter to matched_end_char_idx
#   If string[start_char_idx..matched_end_char_idx] = string[start_char_idx..matched_end_char_idx].reverse
# •  Add string[start_char_idx..matched_end_char_idx] to return array.
