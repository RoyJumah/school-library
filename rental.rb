require_relative 'book'

class Rental 

  attr_accessor :date, :book

  def initialize(date)
    @date = date

  end 
end