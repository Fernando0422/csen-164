# lab4_q5a.rb
require_relative 'greetings'

class Hello
  include Greetings
end

if __FILE__ == $0
  hello = Hello.new
  hello.english   
  hello.french   
  hello.spanish   
end
