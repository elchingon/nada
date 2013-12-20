module Nada
  class NadaClient
    attr_reader :username, :password, :root_url

    DEFAULT_ROOT_URL = "https://www.nadaguideswebservices.com/UsedCarsService.svc"

    # Creates a new NADA client
    #
    # @param username [String] NADA web service username
    # @param password [String] NADA web service password
    # @param opts [Hash] the options to create the client with
    # @option opts [String] :root_url (https://www.nadaguideswebservices.com/UsedCarsService.svc) base url to use
    def initialize(username, password, opts={})
      @username = username
      @password = password
      @root_url = opts.fetch(:root_url){DEFAULT_ROOT_URL}
    end

    def makes
      response = get_url "Makes"
      response_obj = JSON.parse response
      response_obj["GetMakesResult"]
    end

    def years(make_id)
      response = get_url "Years/#{make_id}"
      response_obj = JSON.parse response
      response_obj["GetYearsResult"]
    end

    def categories(make_id, year_id)
      response = get_url "Categories/#{make_id}/#{year_id}"
      response_obj = JSON.parse response
      response_obj["GetCategoriesResult"]
    end

    def models(make_id, year_id, category_id)
      response = get_url "Models/#{make_id}/#{year_id}/#{category_id}"
      response_obj = JSON.parse response
      response_obj["GetModelsResult"]
    end

    def trims(year_id, model_id)
      response = get_url "Trims/#{year_id}/#{model_id}"
      response_obj = JSON.parse response
      response_obj["GetTrimsResult"]
    end

    def options(vehicle_id)
      response = get_url "Options/#{vehicle_id}"
      response_obj = JSON.parse response
      response_obj["GetOptionsResult"]
    end

    def used_price(vehicle_id, options_string, mileage)
      response = get_url "Prices/#{vehicle_id}/#{URI::escape(options_string)}/#{mileage}"
      response_obj = JSON.parse response
      response_obj["GetUsedPriceResult"]
    end

    private

    def get_url(url_suffix)
      RestClient.get "#{root_url}/#{url_suffix}", "UserName" => username, "password" => password
    end

  end
end
