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

    # Lists the available vehicle makes
    #
    # @return [Array<Nada::Models::Make>] List of available makes
    def makes
      response = get_url "Makes"
      response_obj = JSON.parse response
      response_obj["GetMakesResult"].map{|r| Models::Make.from_response_hash(r)}
    end

    # Lists the years available for a given make
    #
    # @param make [Nada::Models::Make] Make to search for available years
    # @return [Array<Integer>] Years that are available
    def years(make)
      make_id = get_object_id make
      response = get_url "Years/#{make_id}"
      response_obj = JSON.parse response
      response_obj["GetYearsResult"].map{|r| r["Year"]}
    end

    # Lists the categories available for a given make and year
    #
    # @param make [Nada::Models::Make] Make to search with
    # @param year [Integer] Year to search with
    # @return [Array<Nada::Models::Category>] Categories available within
    # search
    def categories(make, year)
      make_id = get_object_id make
      response = get_url "Categories/#{make_id}/#{year}"
      response_obj = JSON.parse response
      response_obj["GetCategoriesResult"].map{|r| Models::Category.from_response_hash(r)}
    end

    # Lists the models available for a given make, year and category
    #
    # @param make [Nada::Models::Make] Make to search with
    # @param year [Integer] Year to search with
    # @param category [Nada::Models::Category] Category to search with
    # @return [Array<Nada::Models::Model>] Models available within
    # search
    def models(make, year, category)
      make_id = get_object_id make
      category_id = get_object_id category
      response = get_url "Models/#{make_id}/#{year}/#{category_id}"
      response_obj = JSON.parse response
      response_obj["GetModelsResult"].map{|r| Models::Model.from_response_hash(r)}
    end

    # Lists the trims available for a given year, model
    #
    # @param year [Integer] Year to search with
    # @param category [Nada::Models::Model] Model to search with
    # @return [Array<Nada::Models::Vehicle>] Vehicles available within
    # search
    def trims(year, model)
      model_id = get_object_id model
      response = get_url "Trims/#{year}/#{model_id}"
      response_obj = JSON.parse response
      response_obj["GetTrimsResult"].map{|r| Models::Vehicle.from_response_hash(r)}
    end

    # Lists the options available for a given vehicle
    #
    # @param vehicle [Nada::Models::Vehicle] Vehicle to search with
    # @return [Array<Nada::Models::Option>] Options available for vehicle
    def options(vehicle)
      vehicle_id = get_object_id vehicle
      response = get_url "Options/#{vehicle_id}"
      response_obj = JSON.parse response
      response_obj["GetOptionsResult"].map{|r| Models::Option.from_response_hash(r)}
    end

    # Gets the pricing information for this vehicle
    #
    # @param vehicle [Nada::Models::Vehicle] Vehicle to get the price for
    # @param options [Array<Nada::Models::Option] The options on this specific vehicle
    # @param mileage [Integer] Number of miles on this vehicle
    # @return [Nada::Models::UsedPrice] Price information for this vehicle
    def used_price(vehicle, options=[], mileage)
      options_string = options.collect(&:code).join("|")
      vehicle_id = get_object_id vehicle
      response = get_url "Prices/#{vehicle_id}/#{URI::escape(options_string)}/#{mileage}"
      response_obj = JSON.parse response
      Models::UsedPrice.from_response_hash response_obj["GetUsedPriceResult"]
    end

    private

    # Validate if variable is an Object, String or Integer
    # Allows strings to be passed as cascading dependencies
    def get_object_id object
      object.is_a?(String) || object.is_a?(Integer) ? object : object.id
    end

    def get_url(url_suffix)
      RestClient.get "#{root_url}/#{url_suffix}", "UserName" => username, "password" => password
    end

  end
end
