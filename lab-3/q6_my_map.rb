# Check out how Array#map works, then implement your own version Array#my_map method

#Lab 3 - Question 6
#Fernando Rojas

class Array
    def my_map
      result = []
      each do |element|
        result << yield(element)
      end
      result
    end
  end
  
  #test cases:
  puts "test:"
  
  #multiply each number by 2
  nums = [1, 2, 3, 4, 5]
  puts "original numbers: #{nums.inspect}"
  puts "doubled numbers:  #{nums.my_map { |n| n * 2 }.inspect}"
  puts
  
  #get string lengths
  words = ["hello", "world", "ruby"]
  puts "original words:   #{words.inspect}"
  puts "lengths array:    #{words.my_map(&:length).inspect}"
  