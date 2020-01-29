if ENV['ENV'] == 'development'
  require 'dotenv/load'
end
require 'run_signup_api/version'
require 'run_signup/race'
require 'run_signup_api/client'

module RunSignupApi
  class Error < StandardError; end
end
