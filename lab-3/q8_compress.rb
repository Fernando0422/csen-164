# Write a class for compressing a string. When you create an object of this class, you provide a
# string, then the object save the compressed result (no duplicate words) as the attribute of the
# object. The compressed result will have two arrays: an array for strings and an array for index.
# For example: assuming the name of your class is Compress
# to create an object, you can call like this:
# obj = Compress.new(“i love you but do you love me”)
# then there will be two instance variables created inside the object
# [“i”, “love”, “you”, “but”, “do”, “me”] # no duplicate word (compressed)
# [0, 1,2,3, 4, 2,1, 5] # index to the original array to represent
# # original string
# You can check the original uncompressed string by providing a method to do this.

#Lab 3 - Question 8
#Fernando Rojas

class Compress
    attr_reader :dictionary, :indices
  
    def initialize(str)
      @dictionary = []
      @indices    = []
      words = str.split(' ')
      words.each do |word|
        if (idx = @dictionary.index(word))
          @indices << idx
        else
          @dictionary << word
          @indices    << (@dictionary.size - 1)
        end
      end
    end
  
    #reconstruct the original uncompressed string
    def original
      @indices.map { |i| @dictionary[i] }.join(' ')
    end
  end
  
  #demo
  obj = Compress.new("i love you but do you love me")
  puts "dictionary: #{obj.dictionary.inspect}"
  puts "indices:    #{obj.indices.inspect}"
  puts "original:   #{obj.original}"
  