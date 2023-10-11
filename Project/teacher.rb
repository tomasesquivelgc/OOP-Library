require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, specialization, name: 'Unknown', id: Random.rand(1..1000))
    super(age, name, id, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
