require_relative 'app'

class Menu
  def initialize(app)
    @app = app
  end

  def display_options
    puts "\nPlease  choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    gets.chomp.to_i
  end

  def handle_option(option)
    actions_list = {
      1 => :list_books,
      2 => :list_people,
      3 => :create_person,
      4 => :create_book,
      5 => :create_rental,
      6 => :list_rentals,
      7 => :exit
    }
    if option == 3
      puts 'Do you want to create a student (1) or a teacher (2)?'
    elsif option == 5
      puts 'Select a book from the following list by number'
    end
    @app.send(actions_list[option])
  end

  def run
    puts 'Welcome to School Library App!'
    loop do
      option = display_options
      if option == 7
        @app.exit
        break
      end
      handle_option(option)
    end
  end
end
