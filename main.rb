require './app'

class Main
  def initialize
    @app = App.new
    @output = 0
  end

  def option_list
    puts 'Welcome to school library app!'
    while @output != 7
      puts " Please choose an option by entering a number:
        1. List all books.
        2. List all people
        3. Create a person
        4. Create a book.
        5. Create a rental
        6. List all rentals for a given person id.
        7. Exit

        "
      start_app
    end
  end

  def start_app
    @output = gets.chomp.to_i
    case @output
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.rental_control
    when 6
      @app.rentals_person_id
    else
      puts 'Good Bye'
    end
  end
end

main = Main.new
main.option_list
