require_relative '../student'
require_relative '../classroom'

describe Student do
  describe '#initialize' do
    it 'creates a new student with the age, name, and ID' do
      student = Student.new(18, 'Iván', 123)

      expect(student.age).to eq(18)
      expect(student.name).to eq('Iván')
      expect(student.id).to eq(123)
    end
  end
end

describe Student do
  describe '#play_hooky' do
    it 'returns the string "¯(ツ)/¯"' do
      student = Student.new(19, 'María', 987)

      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end

describe Student do
  describe '#classroom' do
    it 'returns the student\'s classroom' do
      classroom = Classroom.new('Coding')
      student = Student.new(17, 'Kobe', 537, classroom: classroom)

      expect(student.classroom).to eq(classroom)
    end

    it 'returns nil if the student does not have a classroom' do
      student = Student.new(17, 'Kobe', 537)

      expect(student.classroom).to be_nil
    end
  end
end
