# 45 minutes, I was on track to finishing in 30 minutes but see last issue
# Stumbling Blocks
# Dealing with heredocs
# not knowing if optional arg can be assigned to one of parameters
# Reading the minitest error messages
# Spent long time just figuring out the Heredoc string ended in a newline feed
# After reversing the array, I was not paying attention to how the returned joined array would be reversed
# so would need to unreverse
# I needed 0 to reference the end of array and 99 to reference start of array w/o reversing the array
# becuz then I''d need to do two reversals.
# 0 + x = 99
# 99 + x = 0
# 1 + x = 98
# so index of array = (verse_num - 99).abs

# from others. was actually appropriate use of class variable

# Test Cases / Examples
# BeerSong class
#   class:`verse`(arg1, arg2 (optional))
#     if 1 arg only
#       then validate is number from 99-0, where 99 returns the first verse "99 bottles..."
#       0 is the final verse, "0 bottles"

#     if 2 args
#       assuming arg1 < arg2
#       return each verse starting from arg1 and to arg2.
#   class:`lyrics`
#     returns the entire lyrics with each verse delimited by blank line or \n\n

# DS
# beer_song.txt store the lyrics and we assign it to @lyrics - gettable

# split lyrics file string into an array of verse strings delimited by blank lines and reverse it
# verse_list

# Algo
# `verse`
#     set start_verse and `end_verse` - defaults to start_verse
#     save `verse_list` as split lyrics file string into an array of verse strings delimited by blank lines and reverse it
#     verse_list
#     slice verse_list from (start_verse to end verse)
#     join the sliced ^ with blank line delimiters

class BeerSong
  LYRICS = File.read('beer_song.txt')

  def self.lyrics
    LYRICS
  end

  def self.verses(early_verse, later_verse = early_verse)
    LYRICS.strip.split("\n\n").reverse[later_verse..early_verse].reverse.join("\n\n") + "\n"
  end

  def self.verse(verse)
    verses(verse)
  end
end


class BeerSong
  LYRICS = File.read('beer_song.txt')

  def self.lyrics
    LYRICS
  end

  def self.verses(early_verse, later_verse = early_verse)
    LYRICS.strip.split("\n\n")[index(early_verse)..index(later_verse)].join("\n\n") + "\n"
  end

  def self.verse(verse)
    verses(verse)
  end

  class << self
    private

    def index(verse)
      (verse - 99).abs
    end
  end
end

# Refactor
# data validate the `verse` arguments are between 0 and 99

# another student doing the double reverse, also used a class variable

class BeerSong
  @@text_array = File.open('beer_song.txt', 'r').read.split("\n\n").reverse

  def self.verse(verse)
    @@text_array[verse] + "\n"
  end

  def self.verses(verse, range)
    @@text_array[range..verse].reverse.join("\n\n") + "\n"
  end

  def self.lyrics
    @@text_array.reverse.join("\n\n") + "\n"
  end
end

# this is probably the clearest:
class BeerSong
  def self.verse(num)
      case num
      when 0
          "No more bottles of beer on the wall, no more bottles of beer.\n" \
          "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      when 1
          "1 bottle of beer on the wall, 1 bottle of beer.\n" \
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
      when 2
          "2 bottles of beer on the wall, 2 bottles of beer.\n" \
    "Take one down and pass it around, 1 bottle of beer on the wall.\n"
      else
          "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
      end
  end

  def self.verses(first, last)
      (last..first).to_a.reverse.map { |num| verse(num) }.join("\n")
  end

  def self.lyrics
      verses(99, 0)
  end
end

# He solved by not splitting verses by blank spaces
# he split into array of new lines using #lines method from File
# that's why he had to step by 3

# module BeerSongHelper
#   idx_arr = []
#   (0..299).step(3) { |i| idx_arr << i }
#   VERSE_QUERY = ((0..99).to_a.zip idx_arr.reverse).to_h

#   f = File.new('99-bottles-of-beer.txt', 'r')
#   SONG_ARR = f.read.lines
#   f.close
# end

# class BeerSong
#   def self.verse(n)
#     idx = BeerSongHelper::VERSE_QUERY[n]
#     BeerSongHelper::SONG_ARR[idx..(idx + 1)].join
#   end