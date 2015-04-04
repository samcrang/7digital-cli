Gem::Specification.new do |s|
  s.name         = '7d'
  s.version      = '0.0.1.pre'
  s.licenses     = ['MIT']
  s.summary      = 'Provides a CLI to the 7digital API'
  s.description  = <<-EOF
    Generates signed URLs for the 7digital API. Useful for piping between
    various other command line tools.
  EOF
  s.authors      = ['Sam Crang']
  s.email        = 'sam.crang+rubygems@gmail.com'
  s.homepage     = 'https://github.com/samcrang/7digital-cli'
  s.platform     = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9'

  s.bindir       = 'bin'
  s.executables  = ['7d']

  s.require_path = 'lib'
  s.files        = Dir.glob('{lib,spec}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }

  s.add_dependency 'oauth', '~> 0.4.7'
  s.add_dependency 'thor', '~> 0.19.1'

  s.add_development_dependency 'rake', '~> 10.4', '>= 10.4.2'
  s.add_development_dependency 'rspec', '~> 3.2', '>= 3.2.0'
  s.add_development_dependency 'rubocop', '~> 0.29.1'
end
