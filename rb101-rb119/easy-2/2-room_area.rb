# Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.

# don't worry about validation

# reflex algo:
# get inputs for length and width in meters
# calculate area in sq m and sq ft
# display area in both measurements

# puts("Enter the length of the room in meters")
# length_m = gets.chomp.to_f

# puts("Enter the width of the room in meters:")
# width_m = gets.chomp.to_f

# area_m = (length_m * width_m).round(2)
# area_ft = (area_m * 10.7639).round(2)

# puts("The area of the room is #{area_m} square meters (#{area_ft} square feet).")

# for clearer code, instead of directly inserting a conversion value int o calculations, label the conversion factor with a constant variable

SQ_FT_TO_SQ_IN = 144
SQ_FT_TO_SQ_CM = 929.0304
puts("Enter the length of the room in feet")
length_ft = gets.chomp.to_f

puts("Enter the width of the room in feet:")
width_ft = gets.chomp.to_f

area_ft = (length_ft * width_ft)
area_in = (area_ft * SQ_FT_TO_SQ_IN ).round(2)
area_cm = (area_ft * SQ_FT_TO_SQ_CM).round(2)
area_ft = area_ft.round(2)

puts("The area of the room is #{area_ft} square feet (#{area_in} square inches or #{area_cm} square centimeters).")

# math error, square feet to square inches is not 12 but 12 x 12.