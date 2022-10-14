require './book'
require './teacher'
require './student'
require './rental'

class App
  attr_reader :rentals, :books, :people

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def option_list
    puts 'Welcome to school library app!'
    puts ' Please choose an option by entering a number:  '
    puts '1. List all books.'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book.'
    puts '5. Create a rental'
    puts '6. List all rentals for a given person id.'
    puts '7. Exit'
  end

  def enter_options(option)
    case option
    when 1 then Book.list_books(@books)
    when 2 then Person.list_people(@people)
    when 3 then Person.create_person(@people)
    when 4 then Book.create_book(@books)
    when 5 then Rental.rental_control(@books, @people, @rentals)
    when 6 then Rental.rentals_person_id(@people, @rentals)
    when 7 then puts 'Thank you for using this app!'
    else puts 'Invalid Inputs!!'
    end
  end

  def start_app
    user_option = 0
    while user_option != 7
      option_list
      user_option = gets.chomp.to_i
      enter_options(user_option)
    end
  end
end
