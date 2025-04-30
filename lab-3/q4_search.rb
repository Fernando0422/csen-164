# For the search method we defined in class:
# def search(options)
#     options = {duration:120}.merge(options) # duration:120 is the default value
#     print "initial options: ", options
#     puts
#     if options.has_key?(:duration)
#     duration = options[:duration] # get the duration value for later search
#     options.delete(:duration) # delete duration key/value
#     end
#     if options.has_key?(:genre)
#     genre = options[:genre]
#     options.delete(:genre)
#     end
#     print "option: ", options
#     puts
#     print "Invalid options: #{options.keys.join(', ')}" unless options.empty?
#     puts
# end
# change the parameters to "keyword parameters" so that it will automatically check the
# valid options ("genre" and "duration") and collect the invalid options

#Lab 3 - Question 4 
#Fernando Rojas

def search(duration: 120, genre: nil, **invalid)
    #build initial options hash for display
    initial = { duration: duration }
    initial[:genre] = genre unless genre.nil?

    #display initial options
    print "initial options: ", initial
    puts

    #invalid now holds leftover keys
    print "options: ", invalid
    puts

    #report invalid keys if there are any
    unless invalid.empty?
        print "invalid options: #{invalid.keys.join(', ')}"
        puts
    end
end

#test cases
puts "demo 1: valid genre, plus invalid foo/bar"
search(genre: "comedy", foo: 1, bar: 2)
#=> initial options: {:duration=>120, :genre=>"comedy"}
#=> options: {"foo"=>1, "bar"=>2}
#=> Invalid options: foo, bar

puts "\ndemo 2: override duration"
search(duration: 90)
#=> initial options: {:duration=>90}
#=> options: {}

puts "\ndemo 3: both keywords and invalid"
search(duration: 45, genre: "action", extra: "x")
#=> initial options: {:duration=>45, :genre=>"action"}
#=> options: {"extra"=>"x"}
#=> Invalid options: extra
