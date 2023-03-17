require_relative './spec_helper'

describe Book do
  before(:each) do
    @book = Book.new('Rich Dad Poor Dad', 'Robert Kiyosaki')
  end

  it 'class initializes' do
    expect(@book).to be_an_instance_of Book
  end

  it 'attributes are accessible' do
    expect(@book.title).to eq('Rich Dad Poor Dad')
    expect(@book.author).to eq('Robert Kiyosaki')
  end
end
