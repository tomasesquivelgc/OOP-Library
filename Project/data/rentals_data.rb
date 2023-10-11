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

  def self.load_rentals(rentals)
    return unless File.exist?('database/rentals.json')

    file = File.read('database/rentals.json')
    rentals_hash = JSON.parse(file)
    rentals_hash.each do |rental|
      rentals << Rental.new(rental['date'], rental['person'], rental['book'])
    end
    rentals
  end
end
