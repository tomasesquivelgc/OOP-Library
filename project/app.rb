require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @students = []
    @teachers = []
    @books = []
    @rentals = []
  end

  def list_books
    puts "---------------------------------"
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts "---------------------------------"
  end

  def list_people
    @students.each do |student|
      puts student
    end
    @teachers.each do |teacher|
      puts teacher
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp.downcase == 'y'
    @students << if permission
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
    @teachers << Teacher.new(age, specialization, name)
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
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
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
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_rentals
    @rentals.each do |rental|
      puts rental
    end
  end
end
