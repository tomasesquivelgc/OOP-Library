require_relative 'student'
require_relative 'teacher'

class CreateUser
  def create_student(people)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? (Y/N): '
    permission = gets.chomp.downcase == 'y'
    people << if permission
                Student.new(age, name)
              else
                Student.new(age, name, parent_permission: false)
              end
  end

  def create_teacher(people)
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    people << Teacher.new(age, specialization, name: name)
  end
end
