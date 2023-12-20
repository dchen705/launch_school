# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.

GRADES = { 90..100 => 'A', 80...90 => 'B', 70...80 => 'C', 
  60...70 => 'D', 0...60 => 'F'
}
def get_grade(grade1, grade2, grade3)
  mean = (grade1 + grade2 + grade3) / 3
  GRADES.each do |scores, letter|
    return letter if scores.include?(mean)
  end
end

get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

# Ans Key
# def get_grade(s1, s2, s3)
#   result = (s1 + s2 + s3)/3

#   case result
#   when 90..100 then 'A'
#   when 80..89  then 'B'
#   when 70..79  then 'C'
#   when 60..69  then 'D'
#   else              'F'
#   end
# end

# Further exploration:
# How would you handle this if there was a possibility of extra credit grades causing it to exceed 100 points?
# 'A+' => 101..

# Others
# def get_grade(score1, score2, score3)
#   average = (score1 + score2 + score3) / 3
#   grade = GRADES.select { |_, range| range.include?(average) }
#   grade.keys.first
# end

# I wanted to think of a solution that will allow for any number of test inputs. The '*' operator before a single parameter will allow us to pass a variable number of arguments because they will become elements inside of an array

# Other students lessons:
# Select to iterate
# Range in case statement
# Using *arg to put all into array to handle variable arguments 
  # ^ refactor suggestion