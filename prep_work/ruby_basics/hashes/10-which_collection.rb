# Rewrite car as a nested array containing the same key-value pairs.

car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

nested_array = car.map { |k, v|
                          [k, v]
                        }

p nested_array