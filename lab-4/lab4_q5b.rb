# lab4_q5b.rb
require_relative 'greetings'

class Hello
  extend Greetings
end

if __FILE__ == $0
  Hello.english  
  Hello.french   
  Hello.spanish  
end
