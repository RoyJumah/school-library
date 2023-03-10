require_relative 'rental'

class Book
  attr_accessor :title, :author
  attr_reader :id, :rentals

  @@all_books = []

  def initialize(title, author)
    @id = rand(1..1000)
    @title = title
    @author = author
    @rentals = []
    @@all_books << self
  end

  def add_rental(rental)
    @rentals << rental
  end

  def self.all
    @@all_books
  end

  def self.find(id)
    @@all_books.find { |book| book.id == id }
  end

  def id=(new_id)
    @id = new_id
  end
end

