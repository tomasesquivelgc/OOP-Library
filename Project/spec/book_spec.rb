require_relative '../book'
require_relative '../person'

describe Person do
  book = Book.new("The Catcher in the Rye", "J.D. Salinger")
  person = Person.new(20, "John Doe")

  describe "#initialize" do
    it "creates a new person with a name, age, and ID" do
      expect(person.name).to eq("John Doe")
      expect(person.age).to eq(20)
      expect(person.id).to be_an(Integer)
    end

    it "creates a new person with an empty rental array" do
      expect(person.rental).to eq([])
    end
  end

  describe "#add_rental" do
    it "creates a new rental for the person and book" do
      rental = person.add_rental("2021-09-01", book)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(rental.date).to eq("2021-09-01")
    end

    it "adds the rental to the person's rental array" do
      person.add_rental("2021-09-01", book)
      expect(person.rental.length).to eq(2)
    end
  end
end