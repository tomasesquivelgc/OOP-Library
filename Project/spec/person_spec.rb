require_relative '../person'
require_relative '../book'

describe Person do
  book = Book.new('The Catcher in the Rye', 'J.D. Salinger')

  describe '#can_use_services?' do
    context 'when the person is of age' do
      person = Person.new(20, 'John Doe')

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age but has parent permission' do
      person = Person.new(17, 'Jane Doe', parent_permission: true)

      it 'returns true' do
        expect(person.can_use_services?).to eq(true)
      end
    end

    context 'when the person is not of age and does not have parent permission' do
      person = Person.new(17, 'Jane Doe', parent_permission: false)

      it 'returns false' do
        expect(person.can_use_services?).to eq(false)
      end
    end
  end

  describe '#add_rental' do
    person = Person.new(20, 'John Doe')
    it 'creates a new rental' do
      rental = person.add_rental('2021-08-01', book)
      expect(rental).to be_a(Rental)
    end

    it 'adds the rental to the person rentals' do
      rental = person.add_rental('2021-08-01', book)
      expect(person.rental).to include(rental)
    end
  end
end
