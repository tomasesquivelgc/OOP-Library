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
