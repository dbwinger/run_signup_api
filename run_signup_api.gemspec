# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'run_signup_api/version'

Gem::Specification.new do |s|
  s.name          = 'run_signup_api'
  s.version       = RunSignupApi::VERSION
  s.authors       = ['dbwinger']
  s.email         = ['dbwinger@gmail.com']
  s.homepage      = 'https://github.com/dbwinger/run_signup_api'
  s.licenses      = ['MIT']
  s.summary       = '[summary]'
  s.description   = '[description]'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
