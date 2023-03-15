require_relative 'student'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_s
    "#{super} [Teacher] Name: #{name}, ID: #{id}, Age: #{age}"
  end

  def self.create_teacher
    puts
    puts 'Age:'
    age = gets.chomp.to_i

    puts 'Name:'
    name = gets.chomp

    puts 'Specialization:'
    specialization = gets.chomp

    teacher = new(specialization, age, name)

    puts
    puts 'Person created successfully'
    puts teacher

    teacher.save
  end

  def save
    if File.exist?('teachers.json')
      teachers_file = File.read('teachers.json')
      teachers = JSON.parse(teachers_file)
      teachers << { age: age, name: name, specialization: specialization }

      File.write('teachers.json', JSON.pretty_generate(teachers))
    else
      File.write('teachers.json',
                 JSON.pretty_generate([{ age: age, name: name, specialization: specialization }]))
    end
  end

  def self.load_teachers
    return unless File.exist?('teachers.json')

    teachers_file = File.read('teachers.json')
    teachers = JSON.parse(teachers_file)
    teachers.each do |teacher|
      new(teacher['age'], teacher['name'], teacher['specialization'])
    end
  end
end
