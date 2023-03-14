class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person
    person.rentals << self
    book.rentals << self
  end

  def to_hash
    {
      date: @date,
      book_title: @book.title,
      person_id: @person.id
    }
  end

  def self.from_hash(hash)
    date = hash[:date]
    book_title = hash[:book_title]
    person_id = hash[:person_id]

    # Look up the book and person objects based on the title and id
    book = Book.all.find { |b| b.title == book_title }
    person = Person.all.find { |p| p.id == person_id }

    # Create a new rental object
    Rental.new(date, person, book)
  end
end
