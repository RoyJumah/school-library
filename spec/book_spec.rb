require_relative 'spec_helper'

describe Book do
  before(:each) do
    @book = Book.new('The Hobbit', 'J.R.R. Tolkien')
  end

  it 'class initializes' do
    expect(@book).to be_an_instance_of Book
  end

  it 'attributes are accessible' do
    expect(@book.title).to eq('The Hobbit')
    expect(@book.author).to eq('J.R.R. Tolkien')
  end
end
