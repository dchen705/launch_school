# def string_to_signed_integer(str)
#   case str[0]
#   when '+'
#     integer = get_integer_from_str(str[1..-1])
#   when '-'
#     integer = -get_integer_from_str(str[1..-1])
#   else
#     integer = get_integer_from_str(str)
#   end
# end

def get_integer_from_str(str)
  str_to_num_key = {'0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, 
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9}
  
  
  int = str.chars.reduce(0) do |int, char|
    digit = str_to_num_key[char]
    int = int * 10 + digit
  end
  
  
end

# p string_to_signed_integer('4321') == 4321
# p string_to_signed_integer('-570') == -570
# p string_to_signed_integer('+100') == 100

# Further exploration: refactor repetitive

def string_to_signed_integer(str)
  first_char = str[0]
  unsigned_str = (first_char == '+' || first_char == '-') ? str[1..-1] : str
  int = get_integer_from_str(unsigned_str)
  return (first_char == '-') ? -int : int
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100