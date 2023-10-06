require_relative 'app'

def list_options
  puts 'Please choose an option by entering a number:'
  puts '1 - Create a person'
  puts '2 - Create a book'
  puts '3 - Create a rental'
  puts '4 - List all books'
  puts '5 - List all people'
  puts '6 - List all rentals'
  puts '7 - Exit'
end

def main
  app = App.new
  loop do
    list_options
    option = gets.chomp.to_i
    case option
    when 1
      app.create_person
    when 2
      app.create_book
    when 3
      app.create_rental
    when 4
      app.list_books
    when 5
      app.list_people
    when 6
      app.list_rentals
    when 7
      break
    else
      puts 'Invalid option. Try again.'
    end
  end
end

main