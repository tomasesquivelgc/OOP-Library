require_relative 'app'
require_relative 'interface'

def launcher
  app = App.new
  menu = Menu.new(app)
  menu.run
end
launcher
