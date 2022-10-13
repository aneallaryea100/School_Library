require './person'
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def self.create_teacher
    puts 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    puts 'Specialization: '
    specialization = gets.chomp.capitalize
    Teacher.new(specialization, age, name)
  end
end
