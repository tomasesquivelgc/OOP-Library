require_relative 'modules/create_user'
require_relative 'rental'
require_relative 'data/data_manager'
require_relative 'modules/create_book'
require_relative 'modules/list_people'
require_relative 'modules/list_books'

class App
  include CreateUser

  def initialize
    @books = []
    @rentals = []
    @people = []
    @data_manager = DataManager.new
    load_data
  end

  def load_data
    @data_manager.load_data
    @books = @data_manager.books
    @people = @data_manager.people
  end

  def save_data
    @data_manager.save_data
  end

  def create_book
    CreateBook.create_book(@books)
  end

  def list_people
    ListPeople.list_people(@people)
  end

  def list_books
    ListBooks.list_books(@books)
  end

  def create_person
    person_type = gets.chomp.to_i
    case person_type
    when 1
      CreateUser.create_student(@people)
    when 2
      CreateUser.create_teacher(@people)
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
    print 'Date: '
    date = gets.chomp
    @rentals << Rental.new(date, selected_person, @books[book_index])
    puts '---------------------------------'
    puts 'Rental created successfully!'
    puts '---------------------------------'
  end

  def list_rentals
    list_people
    print 'ID of person: '
    person_id = gets.chomp.to_i
    selected_person = @people.find { |person| person.id == person_id }
    puts 'Rentals:'
    selected_person.rental.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
    puts '---------------------------------'
  end

  def exit
    save_data
    puts 'Goodbye!'
  end
end
