require_relative 'book'
require_relative 'person'
require_relative 'rental'

class App

  def initialize
    @books = []
    @people = []
  end
  def list_all_books
    Book.all.each do |book|
      puts "Title: #{book.title} | Author: #{book.author} ID: #{book.id}"
    end
  end

  def list_all_people
    Person.all.each do |person|
      puts "Name: #{person.correct_name} | Age: #{person.age} | ID: #{person.id}"
    end
  end

  def create_person(name, age, type, classroom: nil, specialization: nil, parent_permission: true)
    if type == "student"
      student = Student.new(age, classroom, name: name, parent_permission: parent_permission)
      return student
    elsif type == "teacher"
      teacher = Teacher.new(age, specialization, name: name, parent_permission: parent_permission)
      return teacher
    else
      puts "Invalid person type. Please choose 'student' or 'teacher'."
    end
  end

  def create_book(title, author, id)
    book = Book.new(title, author)
    book.id = id
    @books.push(book)
    puts "#{book.title} by #{book.author} has been added to the library with ID #{book.id}."
  end
  

  def create_rental(date, book, person)
    rental = Rental.new(date, book, person)
    book.add_rental(rental)
    person.add_rental(rental)

    return rental
  end
  

  # List all rentals for a given person id
  def list_all_rentals(person_id)
    rentals = Rental.all.select { |rental| rental.person.id == person_id }
    rentals.each do |rental|
      puts "Date: #{rental.date} | Book: #{rental.book.title} | Person: #{rental.person.correct_name}"
    end
  end
end
