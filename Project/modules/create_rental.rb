require_relative '../rental'

module CreateRental
  def self.create_rental(people, rentals, books, book_index)
    person_id = gets.chomp.to_i
    selected_person = people.find { |person| person.id == person_id }
    print 'Date: '
    date = gets.chomp
    rentals << Rental.new(date, selected_person, books[book_index])
    puts '---------------------------------'
    puts 'Rental created successfully!'
    puts '---------------------------------'
  end
end
