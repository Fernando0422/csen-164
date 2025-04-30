# Define a Book class and Member class:
# Book Class:
# - Attributes: Title, Author, ISBN, and Status (borrowed or available).
# - Initialize each book object with its Title, Author, and ISBN.
# The Status should be set to 'available' by default.
# - Methods to:
# • Display book information.
# • Check out a book. If the book is already checked out, display an
# appropriate message.
# • Return a book. If the book is already returned, display an appropriate
# message.
# Member Class:
# - Attributes: Name, ID, and a list of Books currently borrowed.
# - Initialize each member with their Name and ID. Initialize the list of Books as empty.
# - Methods to:
# • Display member information along with the books currently borrowed.
# • Borrow a book (add the book to the member's list of borrowed books and
# update the book's status).
# • Return a book (remove the book from the member's list and update the
# book's status).

#Lab 3 - Question 7
#Fernando Rojas

class Book
  attr_reader :title, :author, :isbn
  attr_accessor :status

  def initialize(title, author, isbn)
    @title  = title
    @author = author
    @isbn   = isbn
    @status = 'available'
  end

  def display_info
    puts "#{title} by #{author} (ISBN: #{isbn}) — #{status}"
  end

  def check_out
    if status == 'available'
      self.status = 'borrowed'
      puts "you've borrowed “#{title}.”"
    else
      puts "Sorry, “#{title}” is already borrowed."
    end
  end

  def return_book
    if status == 'borrowed'
      self.status = 'available'
      puts "you've returned “#{title}.”"
    else
      puts "“#{title}” wasn’t borrowed."
    end
  end
end

#member class
class Member
  attr_reader :name, :id
  attr_accessor :borrowed_books

  def initialize(name, id)
    @name           = name
    @id             = id
    @borrowed_books = []
  end

  def display_info
    puts "#{name} (ID: #{id}) has borrowed:"
    if borrowed_books.empty?
      puts "  — none —"
    else
      borrowed_books.each { |book| puts "  • #{book.title}" }
    end
  end

  def borrow(book)
    if book.status == 'available'
      book.check_out
      borrowed_books << book
    else
      puts "cannot borrow “#{book.title}”; it’s already #{book.status}."
    end
  end

  def return_book(book)
    if borrowed_books.delete(book)
      book.return_book
    else
      puts "you don’t have “#{book.title}” to return."
    end
  end
end

# Demo
puts "library demo"
b1 = Book.new("1984", "George Orwell", "12345")
b2 = Book.new("Dune", "Frank Herbert", "67890")
m1 = Member.new("Alice", "M001")

m1.display_info
puts
m1.borrow(b1)
puts
m1.display_info
puts
m1.borrow(b1)
puts
m1.return_book(b1)
puts
m1.display_info