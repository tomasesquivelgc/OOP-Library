# spec/classroom_spec.rb
require 'rspec'
require_relative '../classroom'

describe Classroom do
  let(:label) { 'Class A' }
  let(:classroom) { Classroom.new(label) }

  describe '#initialize' do
    it 'initializes a classroom with a label and an empty students array' do
      expect(classroom.label).to eq(label)
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and sets the classroom for the student' do
      student = double('Student')
      allow(student).to receive(:classroom=)

      classroom.add_student(student)

      expect(classroom.students).to include(student)
      expect(student).to have_received(:classroom=).with(classroom)
    end
  end
end
