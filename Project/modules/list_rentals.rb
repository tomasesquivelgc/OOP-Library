module ListRentals
  def self.list_rentals(people)
    print 'ID of person: '
    person_id = gets.chomp.to_i
    selected_person = people.find { |person| person.id == person_id }
    puts 'Rentals:'
    selected_person.rental.each do |rental|
      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
    puts '---------------------------------'
  end
end
