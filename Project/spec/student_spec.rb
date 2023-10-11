require_relative '../student'

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
