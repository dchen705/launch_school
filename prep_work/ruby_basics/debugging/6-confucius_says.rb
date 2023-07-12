# You want to have a small script delivering motivational quotes, but with the following code you run into a very common error message: no implicit conversion of nil into String (TypeError). What is the problem and how can you fix it?

def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

# Error message suggests get_quote method is returning nil which
# since there's no explicit return, last line evaluated is an if
# statement which returns nil? confused...

# What happens if using other inputs
get_quote('Yoda')      #=> no implicit conversion of nil into String (TypeError)
get_quote('Einstein')  #=> "Do not worry about your difficulties in Mathematics. I can assure you mine are still greater."

# Okay think i got it because there's no return, the method will 
# run until finishes executing the last if statement even if one of
# the above if statements evaluates to true. This is why only when
# Einstein inputted does evaluate to non-nil
# In other words
# get_quote('Einstein') will return what is returned by the last if statement which is the
# if person == 'Einstein' statement, and if statement returns the last statement triggered when evaluated to true.