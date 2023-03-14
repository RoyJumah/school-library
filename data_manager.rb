require_relative 'book'
require_relative 'person'
require_relative 'rental'
require 'json'

class DataManager
  def self.save_data(books, people, rentals)
    data = {
      books: books.map(&:to_hash),
      people: people.map(&:to_hash),
      rentals: rentals.map(&:to_hash)
    }

    File.write('books.json', data[:books].to_json)
    File.write('people.json', data[:people].to_json)
    File.write('rentals.json', data[:rentals].to_json)
  end

  def self.load_data
    puts 'Loading data...'
    books = []
    people = []
    rentals = []
  
    if File.exist?('books.json')
      data = JSON.parse(File.read('books.json'))
      data.each { |book| books << Book.from_hash(book) }
    end
  
    if File.exist?('people.json')
      data = JSON.parse(File.read('people.json'))
      data.each do |person|
        case person['type']
        when 'Student'
          people << Student.from_hash(person)
        when 'Teacher'
          people << Teacher.from_hash(person)
        end
      end
    end
  
    if File.exist?('rentals.json')
      data = JSON.parse(File.read('rentals.json'))
      data.each do |rental|
        person = people.find { |p| p.id == rental['person_id'] }
        book = books.find { |b| b.title == rental['book_title'] }
        rentals << Rental.new(rental['date'], book, person)
      end
    end
  
    [books, people, rentals]
  end
  
end
