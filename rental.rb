require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :book, :person

  @rentals = []

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    self.class.rentals << self
  end

  def self.all
    rentals
  end

  # Define attr_accessor for rentals on the metaclass
  class << self
    attr_accessor :rentals
  end
end
