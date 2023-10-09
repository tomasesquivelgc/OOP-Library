require_relative 'create_user'
require_relative 'book'
require_relative 'rental'

class CreateBook
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

class ListPeople
  def list_people(people)
    puts '---------------------------------'
    people.each do |person|
      puts "ID: #{person.id} Name: #{person.name} - #{person.class} "
    end
    puts '---------------------------------'
  end
end

class ListBooks
  def list_books(books)
    puts '---------------------------------'
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts '---------------------------------'
  end
end

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def create_book
    CreateBook.new.create_book(@books)
  end

  def list_people
    ListPeople.new.list_people(@people)
  end

  def list_books
    ListBooks.new.list_books(@books)
  end

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      CreateUser.new.create_student(@people)
    when 2
      CreateUser.new.create_teacher(@people)
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
