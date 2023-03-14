class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date, self, person)
  end

  def to_hash
    {
      title: @title,
      author: @author,
      rentals: @rentals.map(&:to_hash)
    }
  end

  def self.from_hash(hash)
    title = hash['title']
    author = hash['author']
    book = new(title, author)
    rentals_data = hash['rentals'] || []
    rentals_data.each do |rental_data|
      rental = Rental.from_hash(rental_data)
      rental.book = book
      book.rentals << rental
    end
    book
  end
  
end
