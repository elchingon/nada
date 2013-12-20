module Nada::Models
  class Make
    attr_accessor :id, :name

    def self.from_response_hash(hash)
      new.tap do |make|
        make.id = hash["MakeID"]
        make.name = hash["MakeDisplayName"]
      end
    end

  end
end
