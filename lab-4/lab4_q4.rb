# lab4_q4.rb

#capture baseline of all object constants
baseline = Object.constants

require_relative 'gym'
require_relative 'dojo'

module Dojo
  A = 4

  module Kata
    B = 8

    module Roulette
      class ScopeIn
        def push
          15
        end
      end
    end
  end
end

#define top-level constants
A = 16
B = 23
C = 42

#print only the new top-level numeric constants
puts "Top-level numeric constants:"
(Object.constants - baseline).
  select { |c| Object.const_get(c).is_a?(Numeric) }.
  each { |c| puts "#{c} = #{Object.const_get(c)}" }

#print dojo constants
puts "\nDojo numeric constants:"
Dojo.constants.
  select { |c| Dojo.const_get(c).is_a?(Numeric) }.
  each { |c| puts "Dojo::#{c} = #{Dojo.const_get(c)}" }

puts "\nDojo::Kata numeric constants:"
Dojo::Kata.constants.
  select { |c| Dojo::Kata.const_get(c).is_a?(Numeric) }.
  each { |c| puts "Dojo::Kata::#{c} = #{Dojo::Kata.const_get(c)}" }

#call push() to print 15
puts "\nCalling push:"
puts Dojo::Kata::Roulette::ScopeIn.new.push
