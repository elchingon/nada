require "spec_helper"

describe Nada::Models::Make, ".from_response_hash" do
  it "creates a class with the appropriate attributes" do
    input = {"MakeID"=>1188, "MakeDisplayName"=>"Alfa Romeo"}

    make = described_class.from_response_hash(input)

    expect(make.id).to eq(1188)
    expect(make.name).to eq("Alfa Romeo")
  end
end
