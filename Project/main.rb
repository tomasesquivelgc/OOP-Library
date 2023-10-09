require_relative 'app'

class MenuInterface
  def handle_option(app, option)
    case option
    when 1 then app.create_person
    when 2 then app.create_book
    when 3 then app.create_rental
    when 4 then app.list_books
    when 5 then app.list_people
    when 6 then app.list_rentals
    when 7 then exit
    else
      puts 'Invalid option. Try again.'
    end
  end

  def main
    app = App.new
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1 - Create a person'
      puts '2 - Create a book'
      puts '3 - Create a rental'
      puts '4 - List all books'
      puts '5 - List all people'
      puts '6 - List all rentals'
      puts '7 - Exit'

      option = gets.chomp.to_i
      handle_option(app, option)
    end
  end
end

menu = MenuInterface.new
menu.main
