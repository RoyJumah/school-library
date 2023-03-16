require_relative './spec_helper'

describe Book do
  before(:each) do
    @book = Book.new('The River and The Source', 'Mary Ogolla')
  end

  it 'class initializes' do
    expect(@book).to be_an_instance_of Book
  end

  it 'attributes are accessible' do
    expect(@book.title).to eq('The River and The Source')
    expect(@book.author).to eq('Mary Ogolla')
  end
end