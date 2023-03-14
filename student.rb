class Student < Person
  attr_reader :classroom

  def initialize(classroom:, age:, name: 'Unknown', parent_permission: true)
    super(age: age, name: name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def self.from_hash(hash)
    classroom = Classroom.new(hash['classroom'])
    age = hash['age']
    name = hash['name']
    parent_permission = hash['parent_permission']
    student = self.new(classroom: classroom, age: age, name: name, parent_permission: parent_permission)
    student.instance_variable_set(:@id, hash['id'])
    student.instance_variable_set(:@rentals, hash['rentals'].map { |r| Rental.from_hash(r) })
    student
  end
end
