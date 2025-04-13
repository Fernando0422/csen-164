# Lab 2 Part C
# Fernando Rojas

# 1. Use Ruby iterator to print the following pattern:
# **********
# *********
# ********
# *******
# ******
# *****
# ****
# ***
# **
# *

puts "pattern of decreasing asterisks"
10.downto(1) do |i|
  puts "*" * i
end
puts "\n"



# 2. Use .times to calculate 1+2+3+4+5+6+7+8+9+10
puts "calculate sum using .times"
sum = 0
10.times do |i|
  sum += i + 1
end
puts "The sum is: #{sum}"
puts "\n"




# 3. For array:
# books = [
#     { title: "The Fellowship of the Ring", year: 1954 },
#     { title: "Harry Potter and the Sorcerer's Stone", year: 1997 },
#     { title: "American Gods", year: 2001 },
#     { title: "The Da Vinci Code", year: 2003 },
#     { title: "Twilight", year: 2005 },
#     { title: "The Road", year: 2006 },
#     { title: "Nineteen Eighty-Four", year: 1949 }
#     ]
#     Use the select method to filter books published after 2000, print titles and years

puts "filter books published after 2000"
books = [
  { title: "The Fellowship of the Ring", year: 1954 },
  { title: "Harry Potter and the Sorcerer's Stone", year: 1997 },
  { title: "American Gods", year: 2001 },
  { title: "The Da Vinci Code", year: 2003 },
  { title: "Twilight", year: 2005 },
  { title: "The Road", year: 2006 },
  { title: "Nineteen Eighty-Four", year: 1949 }
]

recent_books = books.select { |book| book[:year] > 2000 }

recent_books.each do |book|
  puts "#{book[:title]} (#{book[:year]})"
end
puts "\n"






# # 4. Given a hash of family members, with keys as the title and an array of names as the values,
# use Ruby's built-in select method to gather only immediate family members' names into a
# new array.
# family = { uncles: ["bob", "joe", "steve"],
# sisters: ["jane", "jill", "beth"],
# brothers: ["frank","rob","david"],
# aunts: ["mary","sally","susan"] }

puts "gather immediate family members"
family = { 
  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank", "rob", "david"],
  aunts: ["mary", "sally", "susan"] 
}

immediate_family = family.select { |k, v| k == :sisters || k == :brothers }
immediate_family_names = immediate_family.values.flatten

puts immediate_family_names.join(", ")
puts "\n"

# 5. Given the array:
# words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#     'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']
#     Write a program that prints out groups of words that are anagrams. Anagrams are words that
#     have the same exact letters in them but in a different order. Your output should look something
#     like this:
#     ["demo", "dome", "mode"]
#     ["none", "neon"]
#     ["tied", "diet", "edit", "tide"]
#     ["evil", "live", "veil", "vile"]
#     ["fowl", "wolf", "flow"]

    
puts "print groups of anagrams"
words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
         'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide', 'flow', 'neon']

result = {}

words.each do |word|
  key = word.chars.sort.join

  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |group|
  p group
end
puts "\n"

# 6. Implement Array#flatten method without using build-in flatten method

puts "custom Array#flatten implementation"
class Array
  def my_flatten
    result = []

    self.each do |element|
      if element.is_a?(Array)
        result += element.my_flatten
      else
        result << element
      end
    end

    result
  end
end

test_array = [1, 2, [3, 4, [5, 6]], 7, [8, 9]]
puts "original array: #{test_array}"
puts "flattened array: #{test_array.my_flatten}"
puts "\n"

# 7. Assuming h1 and h2 are two shallow hashes (no nested hashes)
# write code to merge the two hashes (values of h2 overwrite values of h1 if keys are the
#     same)
    
puts "merge two shallow hashes"
def merge_hashes(h1, h2)
  result = h1.clone

  h2.each do |key, value|
    result[key] = value
  end

  result
end

h1 = { a: 100, b: 200, c: 300 }
h2 = { b: 250, d: 400 }

merged = merge_hashes(h1, h2)
puts "h1: #{h1}"
puts "h2: #{h2}"
puts "merged: #{merged}"
