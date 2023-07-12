# We started writing an RPG game, but we have already run into an error message. Find the problem and fix it.

# Each player starts with the same basic stats.

# player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# # Then the player picks a character class and gets an upgrade accordingly.

# character_classes = {
#   warrior: { strength:  20 },
#   thief:   { dexterity: 20 },
#   scout:   { stamina:   20 },
#   mage:    { charisma:  20 }
# }

# puts 'Please type your class (warrior, thief, scout, mage):'
# input = gets.chomp.downcase

# player.merge(character_classes[input])

# puts 'Your character stats:'
# puts player

# # is error caused because character_classes[input]
# but input is a string not a symbol like what's expected
# for the key of the hash. so need to convert with .to_s?

# Error was:
# 10-warriors_wizards.rb:19:in `merge': no implicit conversion of nil into Hash (TypeError)

# player.merge(character_classes[input])

# what's merge syntax?
# merge(*other_hases) -> new_hash
# it merges two hashes

# First i need to change to .merge(character_classes[input.to_s])

# but wont merge just append this hash to the player hash?

# I need program to save the new hash into a variable
# use the new hash variable's key to open the corresponding
# player hash's key and then add the two hash's values together
# Actually, to change to symbol is .to_sym
# To return a hash's key without knowing using keys name i can do .keys.first

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

class_upgrade = character_classes[input.to_sym]

player[class_upgrade.keys.first] += class_upgrade.values.first

puts 'Your character stats:'
puts player

# Their solution below: interestingly .merge knows to combine the values
# of the two hashes that share the same key
# Each player starts with the same basic stats.

# player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# # Then she picks a character class and gets an upgrade accordingly.

# character_classes = {
#   warrior: { strength:  20 },
#   thief:   { dexterity: 20 },
#   scout:   { stamina:   20 },
#   mage:    { charisma:  20 }
# }

# puts 'Please type your class (warrior, thief, scout, mage):'
# input = gets.chomp.downcase

# player = player.merge(character_classes[input.to_sym])

# puts 'Your character stats:'
# puts player




