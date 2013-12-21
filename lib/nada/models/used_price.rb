module Nada::Models
  class UsedPrice
    include Virtus.value_object

    def self.from_response_hash hash
      new
    end
  end
end
