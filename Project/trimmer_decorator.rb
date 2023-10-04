require_relative 'base_decorator'

class TrimmerDecorator < Base_Decorator
  def correct_name
    @nameable.correct_name.slice(0, 10)
  end
end