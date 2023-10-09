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

  def create_person
    puts 'Do you want to create a student (1) or a teacher (2)?'
    person_type = gets.chomp.to_i
    case person_type
    when 1
      CreateUser.new.create_student(@people)
    when 2
      CreateUser.new.create_teacher(@people)
    else
      puts 'Person type not recognized'
    end
    puts '---------------------------------'
    puts 'Person created successfully'
    puts '---------------------------------'
  end
end
