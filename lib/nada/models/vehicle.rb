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
    end

    def self.from_response_hash(hash)
      new id: hash["VehicleID"],
        name: hash["VehicleDisplayName"]
    end
  end
end
