def signed_integer_to_string(signed_int)
  unsigned_int = (signed_int < 0) ? -signed_int : signed_int
  str = integer_to_string(unsigned_int)
  if signed_int == 0
    str
  elsif signed_int > 0
    str.prepend('+')
  else
    str.prepend('-')
  end
end


def integer_to_string(integer)
  integer_to_string_key = {0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6',
  7 => '7', 8 => '8', 9 => '9'}
  dividend = integer
  str = ''
  while dividend > 0
    divide_by_10 = dividend.divmod(10)
    dividend = divide_by_10[0]
    remainder = divide_by_10[1]
    str.prepend(integer_to_string_key[remainder])
  end
  integer > 0 ? str : '0'
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'