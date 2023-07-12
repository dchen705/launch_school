#  Help Magdalena fix her code so that all three of her dogs' names will be associated with the key :dog in the pets hash.

# pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

# pets[:dog] = 'bowser'

# p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }
pets[:dog].push('bowser')

p pets
