require_relative 'app'
class Menu
  def initialize(app)
    @app = app
  end

  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - Create a person'
    puts '2 - Create a book'
    puts '3 - Create a rental'
    puts '4 - List all books'
    puts '5 - List all people'
    puts '6 - List all rentals'
    puts '7 - Exit'
  end

  def handle_option(option)
    case option
    when 1 then @app.create_person
    when 2 then @app.create_book
    when 3 then @app.create_rental
    when 4 then @app.list_books
    when 5 then @app.list_people
    when 6 then @app.list_rentals
    when 7 then exit
    else
      puts 'Invalid option. Try again.'
    end
  end

  def run
    loop do
      display_options
      option = gets.chomp.to_i
      handle_option(option)
    end
  end
end
app = App.new
menu = Menu.new(app)
menu.run
