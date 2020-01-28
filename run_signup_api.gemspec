# encoding: utf-8

$:.unshift File.expand_path('../lib', __FILE__)
require 'run_signup_api/version'

Gem::Specification.new do |s|
  s.name          = 'run_signup_api'
  s.version       = RunSignupApi::VERSION
  s.authors       = ['dbwinger']
  s.email         = ['daryl@entrision.com']
  s.homepage      = 'https://github.com/dbwinger/run_signup_api'
  s.licenses      = ['MIT']
  s.summary       = 'Ruby wrapper for RunSignup.com API'
  s.description   = 'Ruby wrapper for RunSignup.com API'

  s.files         = Dir.glob('{bin/*,lib/**/*,[A-Z]*}')
  s.platform      = Gem::Platform::RUBY
  s.require_paths = ['lib']
end
