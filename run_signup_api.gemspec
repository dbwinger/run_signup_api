# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# $:.unshift File.expand_path('../lib', __FILE__)
require 'run_signup/version'

Gem::Specification.new do |s|
  s.name          = 'run_signup_api'
  s.version       = RunSignup::VERSION
  s.authors       = ['dbwinger']
  s.email         = ['daryl@entrision.com']
  s.homepage      = 'https://github.com/dbwinger/run_signup_api'
  s.licenses      = ['MIT']
  s.summary       = 'Ruby wrapper for RunSignup.com API'
  s.description   = 'Ruby wrapper for RunSignup.com API'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']

  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'dotenv', '~> 2.7'

  s.add_dependency 'httparty'
end
