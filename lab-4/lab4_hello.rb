
class ParentClass
  end
  
  # Your Hello subclass
  class Hello < ParentClass
    def hello(name)
      "hello, #{name}, nice to meet you"
    end
  end
  
  # Test code
  if __FILE__ == $0
    obj = Hello.new
    puts obj.hello("john")  # Output: hello, john, nice to meet you
    puts obj.hello("amy")   # Output: hello, amy, nice to meet you
  end