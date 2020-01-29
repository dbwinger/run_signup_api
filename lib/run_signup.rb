if ENV['ENV'] == 'development'
  require 'dotenv/load'
end
require 'run_signup/version'
require 'run_signup/race'
require 'run_signup/client'

module RunSignup
  class Error < StandardError; end
end
