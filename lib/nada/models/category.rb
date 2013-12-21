module Nada::Models

  # Vehicle category
  #
  # @!attribute id [r]
  #   @return [Integer] NADA category id
  # @!attribute name [r]
  #   @return [String] Name of category
  # @!attribute display_name [r]
  #   @return [String] Name used for display purposes
  class Category
    include Virtus.value_object

    values do
      attribute :id, Integer
      attribute :name, String
      attribute :display_name, String
    end

    def self.from_response_hash(hash)
      new id: hash["CategoryID"],
        name: hash["CategoryName"],
        display_name: hash["CategoryDisplayName"]
    end

  end
end
