require './person'
class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name, parent_permission)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.push(self) unless classroom.students.include?(self)
  end

  def self.create_student
    puts 'Classroom: '
    classroom = gets.chomp
    puts 'Age: '
    age = gets.chomp.to_i
    puts 'Name: '
    name = gets.chomp
    permission = ''
    until %w[Y N].include?(permission)
      puts 'Has parent permission? [Y/N]:'
      permission = gets.chomp.capitalize
    end
    Student.new(classroom, age, name, permission)
  end
end
