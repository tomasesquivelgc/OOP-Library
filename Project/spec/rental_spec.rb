require 'rspec'
require_relative '../rental'

describe Rental do
  let(:date) { '2023-10-11' }
  let(:person) { instance_double('Person', rental: []) }
  let(:book) { instance_double('Book', rental: []) }

  describe '#initialize' do
    it 'initializes a rental with date, person, and book' do
      rental = Rental.new(date, person, book)
      expect(rental.date).to eq(date)
      expect(rental.person).to eq(person)
      expect(rental.book).to eq(book)
    end

    it 'adds the rental to the book and person' do
      rental = Rental.new(date, person, book)
      expect(book.rental).to include(rental)
      expect(person.rental).to include(rental)
    end
  end
end