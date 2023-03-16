require_relative 'spec_helper'
describe Person do
  student = Student.new(Classroom.new(rand(100..108)), 18, 'John', true)
  teacher = Teacher.new('Math', 30, 'Jane', true)
  it 'should create a student' do
    expect(Student.all.length).to eql(1)
    expect(Student.all[0].name).to eql('John')
    expect(Student.all[0].age).to eql(18)
    expect(Student.all[0].parent_permission).to eql(true)
    expect(Student.all[0].classroom).to eql(student.classroom)
  end
  it 'should create a teacher' do
    expect(Teacher.all.length).to eql(1)
    expect(Teacher.all[0].name).to eql('Jane')
    expect(Teacher.all[0].age).to eql(30)
    expect(Teacher.all[0].parent_permission).to eql(true)
    expect(Teacher.all[0].specialization).to eql('Math')
  end
  it 'should list all people' do
    list_of_all_peaple = Person.all
    expect(list_of_all_peaple).to eql([teacher, student])
  end
end
