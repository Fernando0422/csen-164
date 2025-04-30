# lab4_hello_q2.rb
require_relative 'greeting'

class Hello
  include Greeting
end

if __FILE__ == $0
  obj = Hello.new
  puts obj.hello("john")  # => "hello, john, nice to meet you"
  puts obj.hello("amy")   # => "hello, amy, nice to meet you"
end
