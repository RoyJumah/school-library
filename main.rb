require_relative 'app'

app = App.new

puts "Welcome to the Book Rental App"



loop do
  puts "Please choose an option:"
  puts "1. List all books"
  puts "2. List all people"
  puts "3. Create a person"
  puts "4. Create a book"
  puts "5. Create a rental"
  puts "6. List all rentals for a given person ID"
  puts "0. Exit"

  input = gets.chomp.to_i

  case input
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    puts "Enter name:"
    name = gets.chomp
    puts "Enter age:"
    age = gets.chomp.to_i
    puts "Enter type (student/teacher):"
    type = gets.chomp
    if type == "student"
      puts "Enter classroom:"
      classroom = gets.chomp
      puts "Does the student have parent permission? (y/n)"
      parent_permission = gets.chomp.downcase == "y"
      app.create_person(name, age, type, classroom: classroom, parent_permission: parent_permission)
    elsif type == "teacher"
      puts "Enter specialization:"
      specialization = gets.chomp
      puts "Does the teacher have parent permission? (y/n)"
      parent_permission = gets.chomp.downcase == "y"
      app.create_person(name, age, type, specialization: specialization, parent_permission: parent_permission)
    else
      puts "Invalid person type. Please choose 'student' or 'teacher'."
    end
  when 4
    puts "Enter title:"
title = gets.chomp
puts "Enter author:"
author = gets.chomp
puts "Enter ID:"
id = gets.chomp.to_i
app.create_book(title, author, id)

  when 5
    puts "Enter date (YYYY-MM-DD):"
    date = gets.chomp
    puts "Choose a book:"
    app.list_all_books
    book = nil
    loop do
      puts "Enter book ID:"
      book_id = gets.chomp.to_i
      book = Book.find(book_id)
      break if book
      puts "Invalid book ID. Please choose a valid book ID."
    end
    puts "Choose a person:"
    app.list_all_people
    person = nil
    loop do
      puts "Enter person ID:"
      person_id = gets.chomp.to_i
      person = Person.find(person_id)
      break if person
      puts "Invalid person ID. Please choose a valid person ID."
    end
    app.create_rental(date, book, person)
  when 6
    puts "Enter person ID:"
    person_id = gets.chomp.to_i
    app.list_all_rentals(person_id)
  when 0
    break
  else
    puts "Invalid input. Please choose a valid option."
  end
end

puts "Thanks for using the Book Rental App!"
