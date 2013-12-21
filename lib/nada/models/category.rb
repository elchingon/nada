module Nada::Models
  class Category
    attr_accessor :id, :name, :display_name

    def self.from_response_hash(hash)
      new.tap do |category|
        category.id = hash["CategoryID"]
        category.name = hash["CategoryName"]
        category.display_name = hash["CategoryDisplayName"]
      end
    end

  end
end
