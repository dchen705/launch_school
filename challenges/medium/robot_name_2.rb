class Robot
  @@preexisting_ids = []
  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a

  attr_reader :name

  def initialize
    @name = random_name
  end

  def reset
    @name = random_name
  end

  private

  def random_name
    name_id = make_uniq_id
    name_id.map.with_index do |key, index|
      index < 2 ? LETTERS[key] : DIGITS[key]
    end.join
  end

  def make_uniq_id
    loop do
      id = Array.new(2) { rand(0..25)} + Array.new(3) {rand(0..9)}
      next if @@preexisting_ids.include?(id)
      @@preexisting_ids << id
      return id
    end
  end
end

# --- Attempt 2

Create random name (verify not dup with history of names) -> delete random name
Another way to ensure no dup - someone used srand(Random.new_seed) before name creation

2 random letters + 3 random digits

- my first way was using rand to generate 10 digits, using index keys for lets and digits
- refactored using rand(range) and those index keys
- saw other ppl use Array#sample
- ascii way - can easily find values with #ord on irb

constructor is optional as student shows, he just put name creation/verifcation logic in the name method

class Robot
  def name
    return @name if @name
    srand(Random.new_seed)
    self.name = random_name
  end

  def reset
    self.name = nil || name
  end

  private

  attr_writer :name

  def random_name
    ('A'..'Z').to_a.shuffle[0, 1].join + ('0'..'9').to_a.shuffle[0, 2].join
  end
end

class Robot
  @@used_names = []
  attr_reader :name

  def reset
    @name = random_name
  end

  alias :initialize :reset

  private

  def random_name
    loop do
      random_name = ''
      2.times { random_name << rand(65..90).chr }
      3.times { random_name << rand(48..57).chr }
      next if @@used_names.include?(random_name)
      @@used_names << random_name
      return random_name
    end
  end
end

# ^ had to make #initialize the alias of reset, if we made reset alias of initialize which is private, reset
# is also private