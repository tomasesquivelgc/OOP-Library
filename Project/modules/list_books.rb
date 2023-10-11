module ListBooks
  def self.list_books(books)
    puts '---------------------------------'
    books.each_with_index do |book, index|
      puts "#{index + 1}. #{book.title} by #{book.author}"
    end
    puts '---------------------------------'
  end
end
