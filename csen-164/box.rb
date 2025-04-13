class Box

    #@var for Box object
    #both getter and setter
    attr_accessor(:width, :height, :length)
   
    #getter only
    attr_reader(:width, :height, :length)
    
    #setter only
    attr_writer(:width, :height, :length)

   
    def initizilize(w =10, h=20,l=30)
        @width = w 
        @height = h 
        @length = l
    end

def volume
    @width*@height*@length
end

def get_volume
    volume 
end 
=begin
def width
    @width 
end 
def height
    @height
end

def length
    @length 
end

#even? empty?, sort!, uniq!, 
def width = (x)
    @width = x
end 
def height=(x)
    @height = x
end 
def lengthh=(x)
    @length = x
end
=end
end




b1 = Box.new(1,2,3)
puts b1.volume
puts b1.get_volume

puts b1.width #ok 
#puts b1.@width #not ok 

b1.width = (100)
b1.width= 100
b1.width = 100