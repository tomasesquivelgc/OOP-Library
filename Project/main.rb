require_relative 'app'
require_relative 'interface'

def launcher
  app = App.new
  puts 'Welcome to School Library App!'
  menu = Menu.new(app)
  menu.run
end
launcher
