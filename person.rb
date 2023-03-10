require_relative 'nameable'
require_relative 'rental'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id, :rentals

  @people = []

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    self.class.all << self
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def self.all
    @people
  end

  def self.find(id)
    @people.find { |person| person.id == id }
  end

  def of_age?
    @age >= 18
  end

  def add_rental(rental)
    @rentals.push(rental)
  end
end

class Student < Person
  attr_accessor :classroom

  @students = []

  def initialize(age, classroom, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @classroom = classroom
    self.class.all << self
  end

  def self.all
    @students
  end
end

class Teacher < Person
  attr_accessor :specialization

  @teachers = []

  def initialize(age, specialization, name: 'Unknown', parent_permission: true)
    super(age, name: name, parent_permission: parent_permission)
    @specialization = specialization
    self.class.all << self
  end

  def self.all
    @teachers
  end
end
