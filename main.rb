require './setup/set_files'
require './setup/options'

def main
  SetFiles.new
  puts 'Welcome to the School Library App!'
  Options.new
end

main
