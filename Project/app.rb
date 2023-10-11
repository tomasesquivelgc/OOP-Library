require_relative 'modules/create_user'
require_relative 'rental'
require_relative 'data/data_manager'
require_relative 'modules/list_books'
require_relative 'modules/list_people'
require_relative 'modules/create_book'
require_relative 'modules/list_rentals'

class App
  include CreateUser
  include ListBooks
  include ListPeople
  include CreateBook
  include ListRentals

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
    @rentals = @data_manager.rentals
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
    CreateUser.choose_user(@people)
  end

  def create_rental
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
    ListRentals.list_rentals(@people)
  end

  def exit
    save_data
    puts 'Thak you for using this app!'
  end
end
