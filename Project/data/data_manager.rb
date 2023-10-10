require 'json'
require_relative 'book_data'
require_relative 'people_data'

class DataManager
  include BookData
  include PersonData
  attr_accessor :books, :rentals, :people

  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def load_data
    BookData.load_books(@books)
    PersonData.load_people(@people)
  end

  def save_data
    BookData.save_books(@books)
    PersonData.save_people(@people)
    rescue StandardError => e 
      puts "Error Saving Data: #{e.message}"
  end
end