require 'fileutils'

Given(/^the file "([^"]*)" does not exist$/) do |file_name|
  FileUtils.rm_f File.expand_path(file_name)
end
