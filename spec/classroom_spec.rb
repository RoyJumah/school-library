require_relative 'spec_helper'

describe Classroom do
  it 'should create a classroom' do
    Classroom.new(101)
    Classroom.new(102)
    expect(Classroom.all.map(&:label)).to include(101, 102)
  end
end
