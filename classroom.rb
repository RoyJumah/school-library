class Classroom
  attr_accessor :label

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end

  def self.all
    ObjectSpace.each_object(self).to_a
  end

  def to_s
    "Classroom #{label}"
  end
end
