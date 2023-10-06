class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date
    @book = book
    @person = person

    book.rental << self
    person.rental << self
  end
end
