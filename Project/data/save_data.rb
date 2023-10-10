require 'json'

module SaveData
  def self.save_data
    save_books
    save_people
    puts 'Data Saved!'
  rescue StandardError => e
    puts "Error Saving Data: #{e.message}"
  end

  def self.save_books
    File.open('database/books.json', 'w') do |file|
      file.puts @books.map do |book|
        { 'title' => book.title,
          'author' => book.author }
      end.to_json
    end
  end

  def self.save_people
    File.open('database/people.json', 'w') do |file|
      file.puts @people.map do |person|
        { 'name' => person.name,
          'id' => person.id }
      end.to_json
    end
  end
end