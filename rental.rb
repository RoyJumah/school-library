require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  @@rentals = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    @@rentals << self
  end

  def self.all
    @@rentals
  end
end
