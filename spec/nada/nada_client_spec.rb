require "spec_helper"

module Nada

  describe NadaClient, "#initialize" do
    it "sets the username" do
      client = described_class.new("username", "password")
      expect(client.username).to eq("username")
    end

    it "sets the password" do
      client = described_class.new("username", "password")
      expect(client.password).to eq("password")
    end

    it "defaults root_url to DEFAULT_ROOT_URL" do
      client = described_class.new("username", "password")
      expect(client.root_url).to eq(described_class::DEFAULT_ROOT_URL)
    end

    it "sets the root_url" do
      client = described_class.new("username", "password", root_url: "http://www.google.com")
      expect(client.root_url).to eq("http://www.google.com")
    end
  end

  describe NadaClient, "#makes" do
    it "returns an array of Make objects" do
      result = default_client.makes
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Make
    end
  end

  describe NadaClient, "#years" do
    it "returns an array of hashes representing years and ids" do
      make = Models::Make.new id: 1216

      result = default_client.years make
      expect(result).to be_an Array
      expect(result.first).to be_a Integer
    end

    it "accepts make as a string" do
      make = '1216'
      result = default_client.years make
      expect(result).to be_an Array
      expect(result.first).to be_a Integer
    end
  end

  describe NadaClient, "#categories" do
    it "returns an array of hashes" do
      make = Models::Make.new id: 1216
      valid_year = 2013

      result = default_client.categories make, valid_year
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Category
    end

    it "accepts make as a string" do
      make = "1216"
      valid_year = 2013

      result = default_client.categories make, valid_year
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Category
    end
  end

  describe NadaClient, "#models" do
    it "returns an array of hashes" do
      make = Models::Make.new id: 1216
      year = 2013
      category = Models::Category.new id: 18

      result = default_client.models make, year, category
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Model
    end

    it "accepts make and category  as a string" do
      make = "1216"
      year = 2013
      category = "18"

      result = default_client.models make, year, category
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Model
    end
  end

  describe NadaClient, "#trims" do
    it "returns an array of hashes" do
      year = 2013
      model = Models::Model.new id: 10253

      result = default_client.trims year, model
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Vehicle
    end

    it "accepts model as a string" do
      year = 2013
      model = "10253"

      result = default_client.trims year, model
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Vehicle
    end
  end

  describe NadaClient, "#options" do
    it "returns an array of hashes representing options" do
      vehicle = Models::Vehicle.new id: 117209

      result = default_client.options vehicle
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Option
    end
    it "accepts vehicle as a string" do
      vehicle = "117209"

      result = default_client.options vehicle
      expect(result).to be_an Array
      expect(result.first).to be_a Models::Option
    end
  end

  describe NadaClient, "#used_price" do
    it "returns a hash representing the used price" do
      vehicle = Models::Vehicle.new id: 117209
      option_1 = Models::Option.new code: "137"
      option_2 = Models::Option.new code: "224"
      option_3 = Models::Option.new code: "018"
      mileage = 25000

      result = default_client.used_price vehicle, [option_1, option_2, option_3], mileage
      expect(result).to be_a Models::UsedPrice
    end
    it "accepts vehicle as a string" do
      vehicle = 117209
      option_1 = Models::Option.new code: "137"
      option_2 = Models::Option.new code: "224"
      option_3 = Models::Option.new code: "018"
      mileage = 25000

      result = default_client.used_price vehicle, [option_1, option_2, option_3], mileage
      expect(result).to be_a Models::UsedPrice
    end
    it "it works with no options" do
      vehicle = 117209
      options = []
      mileage = 25000

      result = default_client.used_price vehicle, options, mileage
      expect(result).to be_a Models::UsedPrice
    end

  end

end

def default_client
  @default_client ||= Nada::NadaClient.new ENV['NADA_USERNAME'], ENV['NADA_PASSWORD'], root_url: "https://demo.nadaguideswebservices.com/UsedCarsService.svc"
end
