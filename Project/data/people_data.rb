require 'json'
module PersonData
  def self.save_people(people)
    File.open('database/people.json', 'w') do |file|
      file.puts people.map { |person|
        { 'age' => person.age,
          'name' => person.name,
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
      if person['class'] == 'Student'
        people << Student.new(person['age'], person['name'], person['id'])
      elsif person['class'] == 'Teacher'
        people << Teacher.new(person['age'], person['specialization'], person['name'], person['id'])
      end
    end
    people
  end
end
