module Nada::Models

  # A vehicle option like 4wd, towing package, etc.
  #
  # @!attribute id [r]
  #   @return [Integer] NADA model id
  # @!attribute name [r]
  #   @return [String] Name of vehicle model
  class Option
    include Virtus.value_object

    values do
      attribute :code, String
      attribute :name, String
      attribute :standard, Boolean
    end

    def self.from_response_hash(hash)
      new code: hash["OptionReturnTO"]["OptionCode"],
        name: hash["OptionReturnTO"]["OptionDisplayName"],
        standard: hash["IsStd"]
    end
  end
end
