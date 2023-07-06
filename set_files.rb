require './constants'
require 'fileutils'

class SetFiles
  include Constants

  def initialize()
    set_dir
  end

  private

  def set_dir
    create_directory unless Dir.exist?(DIRECTORY_PATH)
    create_files
  end

  def create_directory
    Dir.mkdir(DIRECTORY_PATH)
  end

  def create_files
    FILE_NAMES.each do |file_name|
      file_path = "#{DIRECTORY_PATH}/#{file_name}"
      FileUtils.touch(file_path) unless File.exist?(file_path)
    end
  end
end
