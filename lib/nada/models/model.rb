module Nada::Models

  # A vehicle model
  #
  # @!attribute id [r]
  #   @return [Integer] NADA model id
  # @!attribute name [r]
  #   @return [String] Name of vehicle model
  class Model
    include Virtus.value_object

    values do
      attribute :id, Integer
      attribute :name, String
      attribute :make_id, Integer
      attribute :make_name, String
      attribute :category_id, Integer
      attribute :category_name, String
    end

    def self.from_response_hash(hash)
      new id: hash["ModelReturnTO"]["n_ModelID"],
        name: hash["ModelReturnTO"]["ModelDisplayName"],
        make_id: hash["MakeID"],
        make_name: hash["MakeDisplayName"],
        category_id: hash["CategoryID"],
        category_name: hash["CategoryDisplayName"]
    end
  end
end
