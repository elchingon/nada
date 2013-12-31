module Nada::Models

  # A vehicle
  #
  # @!attribute id [r]
  #   @return [Integer] NADA model id
  # @!attribute name [r]
  #   @return [String] Name of vehicle model
  class Vehicle
    include Virtus.value_object

    values do
      attribute :id, Integer
      attribute :name, String
      attribute :year, Integer
      attribute :make_id, Integer
      attribute :make_name, String
      attribute :model_id, Integer
      attribute :model_name, String
    end

    def self.from_response_hash(hash)
      new id: hash["VehicleID"],
        name: hash["VehicleDisplayName"],
        year: hash["YearReturnTO"]["Year"],
        model_id: hash["ModelReturnTO"]["n_ModelID"],
        model_name: hash["ModelReturnTO"]["ModelDisplayName"],
        make_id: hash["MakeReturnTO"]["MakeID"],
        make_name: hash["MakeReturnTO"]["MakeDisplayName"]
    end
  end
end
