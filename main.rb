require_relative 'app'

def prompt(message)
  puts message
  gets.chomp
end

def prompt_int(message)
  prompt(message).to_i
end

def prompt_bool(message)
  prompt(message).downcase == 'y'
end

def list_books(app)
  app.list_all_books
end

def list_people(app)
  app.list_all_people
end

def create_person(app)
  name = prompt('Enter name:')
  age = prompt_int('Enter age:')
  type = prompt('Enter type (student/teacher):')

  case type
  when 'student'
    classroom = prompt('Enter classroom:')
    parent_permission = prompt_bool('Does the student have parent permission? (y/n)')
    app.create_person(name, age, type, classroom: classroom, parent_permission: parent_permission)
  when 'teacher'
    specialization = prompt('Enter specialization:')
    parent_permission = prompt_bool('Does the teacher have parent permission? (y/n)')
    app.create_person(name, age, type, specialization: specialization, parent_permission: parent_permission)
  else
    puts "Invalid person type. Please choose 'student' or 'teacher'."
  end
end

def create_book(app)
  title = prompt('Enter title:')
  author = prompt('Enter author:')
  id = prompt_int('Enter ID:')
  app.create_book(title, author, id)
end

def create_rental(app)
  date = prompt('Enter date (YYYY-MM-DD):')

  list_books(app)
  book = nil
  loop do
    book_id = prompt_int('Enter book ID:')
    book = Book.find(book_id)
    break if book

    puts 'Invalid book ID. Please choose a valid book ID.'
  end

  list_people(app)
  person = nil
  loop do
    person_id = prompt_int('Enter person ID:')
    person = Person.find(person_id)
    break if person

    puts 'Invalid person ID. Please choose a valid person ID.'
  end

  app.create_rental(date, book, person)
end

app = App.new
puts 'Welcome to the Book Rental App'

loop do
  puts 'Please choose an option:'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List all rentals for a given person ID'
  puts '0. Exit'

  input = prompt_int('Enter your choice:')

  case input
  when 1
    list_books(app)
  when 2
    list_people(app)
  when 3
    create_person(app)
  when 4
    create_book(app)
  when 5
    create_rental(app)
  when 6
    person_id = prompt_int('Enter person ID:')
    app.list_all_rentals(person_id)
  when 0
    break
  else
    puts 'Invalid input. Please choose a valid option.'
  end
end

puts 'Thanks for using the Book Rental App!'
