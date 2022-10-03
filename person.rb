class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..100),
          @name = name,
          @age = age
    is_of_age?
  end

  private

  def is_of_age?
    if @age >= 18
       true
    else
       false
    end
  end

  def can_use_services?
    if age >= 18 || parent_permission == true
       true
    end
  end
end
