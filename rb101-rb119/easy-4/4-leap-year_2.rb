def leap_year?(year)
if year < 1752
  year % 4 == 0
else
   (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true

# Other student: "These exercises really helped me understand that equality expressions return booleans. It's one of those seemingly obvious things that never really clicked with me until I had to think about it directly. Knowing this gives us the option of writing more terse code without needing to explicitly return true or false."
# ^ I agree