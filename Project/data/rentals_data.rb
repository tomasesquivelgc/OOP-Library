require 'json'

module RentalData
  def self.save_rentals(rentals)
    File.open('database/rentals.json', 'w') do |file|
      file.puts rentals.map { |rental|
        { 'date' => rental.date,
          'person' => rental.person.id,
          'book' => rental.book.title }
      }.to_json
    end
  end

  def self.load_rentals(rentals, books, people)
    return unless File.exist?('database/rentals.json')

    file = File.read('database/rentals.json')
    rentals_hash = JSON.parse(file)
    rentals_hash.each do |rental|
      book_checked = books.find { |book| book.title == rental['book'] }
      person_checked = people.find { |person| person.id == rental['person'] }
      rentals << Rental.new(rental['date'], person_checked, book_checked)
    end
    rentals
  end
end
