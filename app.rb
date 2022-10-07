require './book'
require './teacher'
require './student'
require './rental'

class App
  attr_reader :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books
  def list_books
    if @books.length.zero?
      puts 'There are no books at the moment.'
    else
      @books.each_with_index { |book, i| puts "#{i}) Title: \"#{book.title}\", Author: #{book.author}" }
    end
  end

  # list all people

  def list_people
    if @people.length.zero?
      puts 'There are no people at the moment.'
    else
      @people.each_with_index do |person, i|
        puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  # create a person[teacher or student]
  def add_student(student)
    @people << student
  end

  def add_teacher(teacher)
    @people << teacher
  end

  def create_person_type(type, age, name) # rubocop:disable Metrics/ClassLength
    case type
    when 1
      permission = ''
      until %w[Y N].include?(permission)
        puts 'Has parent permission? [Y/N]:'
        permission = gets.chomp
        case permission.downcase
        when 'y'
          true
        else
          false
        end
      end
      student = Student.new(nil, age, name, parent_permission: permission == 'y')
      add_student(student)
    when 2
      puts 'Specialization:'
      specialization = gets.chomp.capitalize
      teacher = Teacher.new(specialization, age, name)
      add_teacher(teacher)

    end
  end

  def create_person
    person_type = 0
    until [1, 2].include?(person_type)
      puts 'Do you want to create a student (1) or do you want to create a teacher (2)? [Input the number]:'
      person_type = gets.chomp.to_i
    end

    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    create_person_type(person_type, age, name)
    person = person_type == 1 ? 'Student' : 'Teacher'
    puts "#{person} created successfully."
  end

  # create a book

  def add_book(book)
    @books << book
  end

  def create_book
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
    book = Book.new(title, author)
    add_book(book)
    puts 'Book created successfully.'
  end

  # create a rental
  def add_rental(rental)
    @rental << rental
  end

  def create_rental
    i_book = nil
    i_person = nil
    until (0..@book.length - 1).include? i_book
      puts 'Select a book from the following list by number'
      list_books
      i_book = gets.chomp.to_i
    end
    until (0..@people.length - 1).include? i_book
      puts 'Select a book from the following list by number'
      list_people
      i_person = gets.chomp.to_i
    end

    puts 'Date: '
    date = gets.chomp
    rental = Rental.new(date, @people[i_person], @books[i_book])
    add_rental(rental)
    puts 'Rental created successfully'
  end

  def rental_control
    if @books.length.zero?
      puts 'There are not books for rental'
    elsif @people.length.zero?
      puts 'There are no registered people to make the rental'
    elsif @people.length.zero? && @books.length.zero?
      puts 'There are no people and books registered to make the rental'
    else
      create_rental
    end
  end

  # list all rentals for a given person id

  def rentals_person_id
    puts 'ID of person: '
    id = gets.chomp.to_i
    person = nil
    @person.each { |pers| person = pers if pers.id == id }
    if person.nil?
      puts "There is not person with the id #{id} registered"
    elsif person.rentals.length.zero?
      puts "Person #{id}: #{person.name} doesn't have rentals"
    else
      puts 'Rentals: '
      person.rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
