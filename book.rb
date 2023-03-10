require_relative 'rental'

class Book
  attr_accessor :title, :author, :id
  attr_reader :rentals

  @all_books = []

  def initialize(title, author)
    @id = rand(1..1000)
    @title = title
    @author = author
    @rentals = []
    self.class.all << self
  end

  def add_rental(rental)
    @rentals << rental
  end

  def self.all
    @all_books
  end

  def self.find(id)
    @all_books.find { |book| book.id == id }
  end
end
