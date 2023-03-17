require_relative 'spec_helper'

describe Rental do
  before(:each) do
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
    @student = Student.new(Classroom.new(rand(100..108)), 18, 'John', true)
    @rental = Rental.new('2000/00/00', @book, @student)
  end

  it 'class initializes' do
    expect(@rental).to be_an_instance_of Rental
  end

  it 'attributes are accessible' do
    expect(@rental.book).to eq(@book)
    expect(@rental.person).to eq(@student)
  end
end
