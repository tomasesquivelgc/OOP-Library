require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def list_books
    puts '---------------------------------'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts '---------------------------------'
  end

  def list_people
    puts '---------------------------------'
    @people.each_with_index do |person, index|
      puts "#{index + 1}. #{person.name} - #{person.class}"
    end
    puts '---------------------------------'
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp.downcase == 'y'
    @people << if permission
                 Student.new(age, name)
               else
                 Student.new(age, name, parent_permission: false)
               end
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @people << Teacher.new(age, specialization, name: name)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Person type not recognized'
    end
    puts 'Person created successfully'
    puts '---------------------------------'
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully!'
    puts '---------------------------------'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i - 1
    puts 'Select a student from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i - 1
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, @people[person_index], @books[book_index])
    puts 'Rental created successfully!'
    puts '---------------------------------'
  end

  def list_rentals
    puts '---------------------------------'
    @rentals.each_with_index do |rental, index|
      puts "#{index + 1}. #{rental.person.name} - #{rental.book.title} - #{rental.date}"
    end
    puts '---------------------------------'
  end
end
