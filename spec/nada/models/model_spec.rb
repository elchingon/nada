require 'spec_helper'

describe Nada::Models::Model, ".from_response_hash" do
  it "creates an object with the appropriate attributes set" do
    input = {"MakeID"=>1216,
      "MakeDisplayName"=>"Volvo",
      "ModelReturnTO"=>
        {"c_ModelID"=>0, "n_ModelID"=>10253, "ModelDisplayName"=>"XC60"},
      "CategoryID"=>18,
      "CategoryDisplayName"=>"SUVs",
      "ShortReview"=>nil,
      "FactFast"=>nil,
      "jpg"=>"13867.jpg"
    }

    model = described_class.from_response_hash input

    expect(model.id).to eq(10253)
    expect(model.name).to eq("XC60")
    expect(model.make_id).to eq(1216)
    expect(model.make_name).to eq("Volvo")
    expect(model.category_id).to eq(18)
    expect(model.category_name).to eq("SUVs")
  end
end
