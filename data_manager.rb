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

    books = load_books
    people = load_people
    rentals = load_rentals(books, people)

    [books, people, rentals]
  end

  def self.load_books
    return [] unless File.exist?('books.json')

    data = JSON.parse(File.read('books.json'))
    data.map { |book| Book.from_hash(book) }
  end

  def self.load_people
    return [] unless File.exist?('people.json')

    data = JSON.parse(File.read('people.json'))
    data.map do |person|
      case person['type']
      when 'Student'
        Student.from_hash(person)
      when 'Teacher'
        Teacher.from_hash(person)
      end
    end
  end

  def self.load_rentals(books, people)
    return [] unless File.exist?('rentals.json')

    data = JSON.parse(File.read('rentals.json'))
    data.map do |rental|
      person = people.find { |p| p.id == rental['person_id'] }
      book = books.find { |b| b.title == rental['book_title'] }
      Rental.new(rental['date'], book, person)
    end
  end
end
