module Nada::Models
  # Make/Brand of a vehicle
  #
  # @!attribute [r] id
  #   @return [Integer] NADA id for this make
  # @!attribute [r] name
  #   @return [String] Name of this make
  class Make
    include Virtus.value_object

    values do
      attribute :id, Integer
      attribute :name, String
    end

    def self.from_response_hash(hash)
      new id: hash["MakeID"], name: hash["MakeDisplayName"]
    end

  end
end
