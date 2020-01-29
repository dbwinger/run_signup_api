require 'httparty'

module RunSignupApi
  class Client
    include HTTParty

    BASE_URL = "https://runsignup.com/rest"

    def initialize api_key: ENV['RUN_SIGNUP_API_KEY'], api_secret: ENV['RUN_SIGNUP_API_SECRET'], response_format: :json
      @api_key, @api_secret, @response_format = api_key, api_secret, response_format
    end

    # Params used by all API calls
    def default_params
      {
        api_key: @api_key,
        api_secret: @api_secret,
        format: @response_format
      }
    end

    def get_races **opts
      # Response in format
      #  {
      #    "races": [{
      #      "race": {
      #        "race_id": 67504,
      #        "name": "124th Boston Marathon: Fundraising for The Angel Fund, Supported by the Sharon Timlin Race to Cure ALS",
      #        "last_date": "04\/15\/2019",
      #        ...
      #      }
      #    },
      #      "race": {
      #        "race_id": 67505,
      #        "name": "Another race",
      #        "last_date": "04\/16\/2019",
      #        ...
      #      }
      #    }]
      #  }
      call_api('/races', opts)['races'].map do |race|
        RunSignup::Race.new(race['race'])
      end
    end

    # RunSignup::Client.new.get_race(1, only_future_events: true, something_else: '234')
    def get_race race_id, **opts
      # Response in format
      # {
      #   "race": {
      #       "race_id": 33675,
      #       "name": "\"ASL Run Series: 5K Walk\/Run\" ASL Deaf",
      #       "last_date": "09\/29\/2018",
      RunSignup::Race.new(call_api('/race', opts.merge(race_id: race_id))['race'])
    end

    protected

    def call_api path, params = {}
      response = self.class.get("#{BASE_URL}/#{path}", query: default_params.merge(params))
      if response.code == 200
        response = response.parsed_response

        if (error = response['error'])
          raise Error.new error['error_msg']
        else
          response
        end
      else
        raise Error.new response.body
      end
    end
  end
end
