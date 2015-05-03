require 'rspec/core/rake_task'
require 'cucumber/rake/task'
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:lint)
Cucumber::Rake::Task.new(:features) do |t|
  t.cucumber_opts = '--format progress'
end

task default: [:spec, :features, :lint]
