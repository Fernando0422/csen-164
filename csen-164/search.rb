def search(options)
    options = {duration: 120}.merge(options)

    if options.has_key?(:genre)
        genre = options[:genre]
        options.delete(:genre)

    end
    
    duration = options[:duration]
    options.delete(:duration)

    puts "Invalid options: #{options}" unless options.empty?


end

#valid opetions: genre, duration 
search({genre: "jazz", duration: 230})
search({genre: "jazz", duration: 230, author: "me"})
search({genre: "jazz", duration: 230, author: "me", invalid: "this"})

def search(genre: "pop", duration: 120, **invalid)
    p [genre, duration]
end
search()
search(duation: 200, genre: "jazz")
search(duation: 200, genre: "jazz", other: "something")