require_relative '../decorators/base_decorator'
require_relative '../decorators/trimmer_decorator'
require_relative '../decorators/capitalize_decorator'
require_relative '../nameable'

describe BaseDecorator do
  let(:nameable) { double('Nameable', correct_name: 'John Doe') }
  let(:decorated_nameable) { BaseDecorator.new(nameable) }

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(decorated_nameable.correct_name).to eq('John Doe')
    end
  end
end

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'returns the name trimmed to 10 characters' do
      person = Person.new(10, 'John Martin Doe')
      trimmer = TrimmerDecorator.new(person)
      expect(trimmer.correct_name).to eq('John Marti')
    end
  end
end

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john doe') }
  let(:decorated_nameable) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct name' do
      expect(decorated_nameable.correct_name).to eq('John doe')
    end
  end
end
