class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(date, person, self)
  end

  # list all books
  def self.list_books(books)
    if books.empty?
      puts 'There are no books at the moment.'
    else
      books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  def self.create_book(books)
    title = ''
    author = ''
    while title.empty?
      print 'Title: '
      title = gets.chomp
    end
    while author.empty?
      puts 'Author: '
      author = gets.chomp
    end
    books << Book.new(title, author)
    puts 'Book created successfully.\n'
  end
end
