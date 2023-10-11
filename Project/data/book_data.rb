require 'json'

module BookData
  def self.save_books(books)
    File.open('database/books.json', 'w') do |file|
      file.puts books.map { |book|
        { 'title' => book.title,
          'author' => book.author }
      }.to_json
    end
  end

  def self.load_books(books)
    return unless File.exist?('database/books.json')

    file = File.read('database/books.json')
    books_hash = JSON.parse(file)
    books_hash.each do |book|
      books << Book.new(book['title'], book['author'])
    end
  end
end
