# lab4_q6.rb

#simple proc object
my_proc = Proc.new { |x| puts "Hello, #{x}!" }
my_proc.call("Alice")             #=> Hello, Alice!

puts "-" * 30

#passing blocks with & and converting back
def block_exec(&block_obj)
  block_obj.call
end

block_exec { puts "love" }                                  #=> love
block_exec(&(Proc.new { puts "love" }))                     #=> love

puts "-" * 30

#passing a proc directly to a method
def block_exec_obj(block_obj)
  block_obj.call
end

block_exec_obj(Proc.new { puts "love again" })              #=> love again

puts "-" * 30

#returning a proc from a method (power factory)
def power(exponent)
  Proc.new { |base| base ** exponent }
end

square = power(2)
cube   = power(3)

puts square.call(5)    #=> 25
puts cube.call(5)      #=> 125

puts "-" * 30

#minirouter 
class MiniRouter
  def initialize
    @routes = {}
  end

  def add_route(method, path, &handler)
    @routes[[method, path.downcase]] = handler
  end

  def dispatch(method, path)
    handler = @routes[[method, path.downcase]]
    handler ? handler.call : "404 Not Found"
  end
end

router = MiniRouter.new
router.add_route(:get, "/hello")    { "Hello handler!" }
router.add_route(:get, "/Welcome")  { "Welcome handler!" }

puts router.dispatch(:get, "/hello")    #=> Hello handler!
puts router.dispatch(:get, "/welcome")  #=> Welcome handler!
puts router.dispatch(:get, "/404")      #=> 404 Not Found
