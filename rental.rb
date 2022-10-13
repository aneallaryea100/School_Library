require './book'
require './person'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book) 
    @date = date

    @book = book
    book.rentals << self
    
    @person = person
    person.rentals << self
  end

  def self.create_rental(books, people)
    i_book = nil
    i_person = nil
    until (0..books.length - 1).include? i_book
      puts 'Select a book from the following list by number'
      Book.list_books(books)
      i_book = gets.chomp.to_i
    end
    until (0..people.length - 1).include? i_person
      puts 'Select a book from the following list by number'
      Person.list_people(people)
      i_person = gets.chomp.to_i
    end

    puts 'Date: '
    date = gets.chomp
    Rental.new(date, people[i_person], books[i_book])
  end

  def self.rental_control(books, people, rental)
    if books.empty?
      puts 'There are not books for rental'
    elsif people.empty?
      puts 'There are no registered people to make the rental'
    elsif people.empty? && books.empty?
      puts 'There are no people and books registered to make the rental'
    else
      rental << create_rental(books, people)
      puts "Rental created successfully\n"
    end
  end

  def self.show_rental(people, rentals)
    print 'ID of person: '
    id = gets.chomp.to_i
    people.each do |person|
    if person.nil?
      puts "There is not person with the id #{id} registered"
    else
      puts 'Rentals:'
      rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
    end
  end


  def self.rentals_person_id(people, rentals)
    if rentals.empty?
      puts 'There are no rentals registered'
    else
      show_rental(people, rentals)
    end
  end
end
