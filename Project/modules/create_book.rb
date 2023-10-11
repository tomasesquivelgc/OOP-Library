require_relative '../book'

module CreateBook
  def self.create_book(books)
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    books << Book.new(title, author)
    puts '---------------------------------'
    puts 'Book created successfully!'
    puts '-------------------------------'
  end
end