require_relative './spec_helper'

describe Classroom do
  Classroom.new(101)
  Classroom.new(102)

  it 'should create a classroom' do
    expect(Classroom.all[0].label).to eql(102)
    expect(Classroom.all[1].label).to eql(101)
  end
end
