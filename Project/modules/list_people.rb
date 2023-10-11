module ListPeople
  def self.list_people(people)
    puts '---------------------------------'
    people.each do |person|
      puts "ID: #{person.id} Name: #{person.name} - #{person.class} "
    end
    puts '---------------------------------'
  end
end
