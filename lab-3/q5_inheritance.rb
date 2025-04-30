# When you subclass, the instance method will be inherited. However, the "initialize" method
# in the parent class might not be called automatically if the subclass has "initialize" itself.
# Read the following code:
# class Parent
#     def initialize(name="nobody")
#     @name = name
#     end
#     end
#     class Child < Parent
#     attr_accessor :name, :grade
#     def initialize(name, grade)
#     @grade = grade
#     end
#     end
#     y = Child.new("yuan", 100)
#     print "name is: ", y.name
#     puts
#     puts y.grade
#     y.grade = 90
#     puts y.grade
# Add a statement to make the Child object be able to initialize the "@name" attribute.

#Lab 3 - Question 5
#Fernando Rojas

class Parent
    def initialize(name="nobody")
        @name = name
    end
end

class Child < Parent
    attr_accessor :name, :grade
    def initialize(name, grade)
        super(name)
        @grade = grade
    end
end

# test case
y = Child.new("yuan", 100)
print "name is: ", y.name
puts
puts y.grade
y.grade = 90
puts y.grade