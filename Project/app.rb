require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class CreateStudent
  def create_student(people)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp.downcase == 'y'
    people << if permission
                 Student.new(age, name)
               else
                 Student.new(age, name, parent_permission: false)
               end
  end
end

class CreateTeacher
  def create_teacher(people)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    people << Teacher.new(age, specialization, name: name)
  end
end

class Create_book
  def create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books << Book.new(title, author)
    puts '---------------------------------'
    puts 'Book created successfully!'
    puts '-------------------------------'
  end
end


class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def create_book
    Create_book.new.create_book(@books)
  end
  def list_books
    puts '---------------------------------'
    @books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts '---------------------------------'
  end

  def list_people
    puts @people[0].name
    puts '---------------------------------'
    @people.each do |person|
      puts "ID: #{person.id} Name: #{person.name} - #{person.class} "
    end
    puts '---------------------------------'
  end

  
  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      CreateStudent.new.create_student(@people)
    when 2
      CreateTeacher.new.create_teacher(@people)
    else
      puts 'Person type not recognized'
    end
    puts '---------------------------------'
    puts 'Person created successfully'
    puts '---------------------------------'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i - 1
    puts 'Select a student from the following list by ID'
    list_people
    person_id = gets.chomp.to_i
    selected_person = @people.find { |person| person.id == person_id }
    puts 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, selected_person, @books[book_index])
    puts '---------------------------------'
    puts 'Rental created successfully!'
    puts '---------------------------------'
  end

  def list_rentals
    puts 'Please select a person by ID to see their rentals'
    list_people
    person_id = gets.chomp.to_i
    selected_person = @people.find { |person| person.id == person_id }
    puts '---------------------------------'
    selected_person.rental.each do |rental|
      puts "Book: #{rental.book.title} - Date: #{rental.date}"
    end
    puts '---------------------------------'
  end
end
