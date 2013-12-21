require 'spec_helper'

describe Nada::Models::Category, ".from_response_hash" do
  it "creates an object with the appropriate attributes set" do
    input = {"CategoryID"=>18, "CategoryDisplayName"=>"SUVs", "CategoryName"=>"SUV"}

    category = described_class.from_response_hash input

    expect(category.id).to eq(18)
    expect(category.display_name).to eq("SUVs")
    expect(category.name).to eq("SUV")
  end
end
