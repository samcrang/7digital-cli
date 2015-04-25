require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:lint)
Cucumber::Rake::Task.new(:features)

task default: [:spec, :features, :lint]
