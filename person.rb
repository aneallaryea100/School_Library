require_relative './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  attr_accessor :id, :name, :age
  attr_reader :rentals

  def initialize(age, name, parent_permission)
    super()
    @id = Random.rand(1..100)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, self, book)
  end

  def self.list_people(people)
    if people.empty?
      puts 'There are no people at the moment.\n'
    else
      people.each_with_index do |person, i|
        puts "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def self.create_person(people)
    person_type = 0
    until [1, 2].include?(person_type)
      puts 'Do you want to create a student (1) or do you want to create a teacher (2)? [Input the number]:'
      person_type = gets.chomp.to_i
    end

    case person_type
    when 1 then person = Student.create_student
    when 2 then person = Teacher.create_teacher
    end
    people << person
    puts "#{person.class} created successfully."
  end

  private

  def of_age?
    @age >= 18
  end
end
