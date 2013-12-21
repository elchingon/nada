require "spec_helper"

describe Nada::NadaClient, "#initialize" do
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

describe Nada::NadaClient, "#makes" do
  it "returns an array of Make objects" do
    result = default_client.makes
    expect(result).to be_an Array
    expect(result.first).to be_a Nada::Models::Make
  end
end

describe Nada::NadaClient, "#years" do
  it "returns an array of hashes representing years and ids" do
    make = Nada::Models::Make.new
    make.id = 1216

    result = default_client.years make
    expect(result).to be_an Array
    expect(result.first).to be_a Integer
  end
end

describe Nada::NadaClient, "#categories" do
  it "returns an array of hashes" do
    make = Nada::Models::Make.new
    make.id = 1216
    valid_year = 2013

    result = default_client.categories make, valid_year
    expect(result).to be_an Array
  end
end

describe Nada::NadaClient, "#models" do
  it "returns an array of hashes" do
    valid_make_id = 1216
    valid_year_id = 2013
    valid_category_id = 18

    result = default_client.models valid_make_id, valid_year_id, valid_category_id
    expect(result).to be_an Array
  end
end

describe Nada::NadaClient, "#trims" do
  it "returns an array of hashes" do
    valid_year_id = 2013
    valid_model_id = 10253


    result = default_client.trims valid_year_id, valid_model_id
    expect(result).to be_an Array
  end
end

describe Nada::NadaClient, "#options" do
  it "returns an array of hashes representing options" do
    valid_vehicle_id = 117209

    result = default_client.options valid_vehicle_id
    expect(result).to be_an Array
  end
end

describe Nada::NadaClient, "#used_price" do
  it "returns a hash representing the used price" do
    valid_vehicle_id = 117209
    valid_options_string = "137|244|018"
    mileage = 25000

    result = default_client.used_price valid_vehicle_id, valid_options_string, mileage
    expect(result).to be_a Hash
  end
end

def default_client
  @default_client ||= Nada::NadaClient.new ENV['NADA_USERNAME'], ENV['NADA_PASSWORD'], root_url: "https://demo.nadaguideswebservices.com/UsedCarsService.svc"
end
