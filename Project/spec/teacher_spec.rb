require_relative '../teacher'

describe Teacher do
  describe '#initialize' do
    it 'creates a new teacher with the age, specialization and name attributes' do
      teacher = Teacher.new(30, 'Math', 'Jim')

      expect(teacher.age).to eq(30)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.name).to eq('Jim')
      expect(teacher.rental).to be_empty
    end
  end
end

describe Teacher do
  describe '#can_use_services?' do
    it 'always returns true' do
      teacher = Teacher.new(35, 'Programming', 'Rose')

      expect(teacher.can_use_services?).to be(true)
    end
  end
end

describe Teacher do
  describe '#specialization=' do
    it 'updates the teacher\'s specialization' do
      teacher = Teacher.new(30, 'Math', 'Marie')

      teacher.specialization = 'Science'

      expect(teacher.specialization).to eq('Science')
    end
  end
end
