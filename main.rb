require './set_files'
require './options'

def main
  SetFiles.new
  puts 'Welcome to the School Library App!'
  Options.new
end

main
