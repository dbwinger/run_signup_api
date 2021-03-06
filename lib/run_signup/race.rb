require 'ostruct'
require 'run_signup/data_coercion'

# Wrap the API results for a race in an class, and do some data coercion
module RunSignup
  class Race < OpenStruct
    include RunSignup::DataCoercion

    def initialize hash = nil
      super coerce_from_api hash
    end
  end

  class Event < OpenStruct; end;
end