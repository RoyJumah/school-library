require_relative 'person'
require_relative 'book'
class Rental
  attr_accessor :date, :book, :person
  def initialize(date, book, person)
    @date = date
    @book = book
    book.rentals << self
    @person = person
    person.rentals << self
  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end
  def to_s
    "Date: #{date}, Book \"#{book.title}\" by #{book.author}, Rented to: #{person.name}"
  end
  def self.create_rental
    puts
    book_class = Book.select_book_for_renting
    puts
    person_class = Person.select_person_to_rent
    puts
    puts 'Date:'
    date = gets.chomp
    rental = new(date, Book.all[book_class], Person.all[person_class])
    puts
    puts 'Rental created successfully'
    puts rental
    rental.save
  end
  def self.rentals_by_person_id
    puts 'ID of person:'
    id = gets.chomp.to_i
    rentals = Rental.load_rentals
    rentals.find { |rental| rental['id'].to_i == id }
  end
  def self.list_rentals
    persons_rentals = rentals_by_person_id
    puts
    puts 'Rentals:'
    puts "date: #{persons_rentals['date']} book: #{persons_rentals['book']} rented by: #{persons_rentals['name']}"
    persons_rentals
  end
  def save
    if File.exist?('rentals.json')
      rentals_file = File.read('rentals.json')
      rentals = JSON.parse(rentals_file)
      rentals << { date: date, book: book.title, id: person.id, name: person.name }
      File.write('rentals.json', JSON.pretty_generate(rentals))
    else
      File.write('rentals.json', JSON.pretty_generate([{ date: date, book: book.title, id: person.id,
                                                         name: person.name }]))
    end
  end
  def self.load_rentals
    return unless File.exist?('rentals.json')
    rentals_file = File.read('rentals.json')
    JSON.parse(rentals_file)
  end
end