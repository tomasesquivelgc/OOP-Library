require 'json'
require_relative '../person'
require_relative '../book'
require_relative '../rental'

module LoadData
  def self.load_data
    load_books
    load_people
  end

  def self.load_books
    return unless File.exist?('database/books.json')
    json_str = File.read('database/books.json')
    print 'libros: '
    puts json_str
    @books = JSON.parse(json_str).first.map do |book_data|
      Book.new(book_data['title'], book_data['author'])
    end
  end

  def self.load_people
    return unless File.exist?('database/people.json')
    json_str = File.read('database/people.json')
    @people = JSON.parse(json_str).map do |person_data|
      Person.new(person_data['name'], person_data['id'])
    end
  end
end