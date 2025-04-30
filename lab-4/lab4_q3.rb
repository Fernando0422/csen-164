# lab4_q3.rb
require_relative 'gym'
require_relative 'dojo'

# now we can explicitly refer to each Push class:
gym_push  = Gym::Push.new
puts gym_push.up    # => 40

dojo_push = Dojo::Push.new
puts dojo_push.up   # => 30
