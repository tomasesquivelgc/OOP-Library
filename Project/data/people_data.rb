require 'json'
module PersonData
  def self.save_people(people)
    File.open('database/people.json', 'w') do |file|
      file.puts people.map { |person|
        { 'name' => person.name,
          'id' => person.id,
          'class' => person.class }
      }.to_json
    end
  end
  def self.load_people(people)
    return unless File.exist?('database/people.json')
    file = File.read('database/people.json')
    people_hash = JSON.parse(file)
    people_hash.each do |person|
      people << Person.new(person['name'], person['id'])
    end
  end
end