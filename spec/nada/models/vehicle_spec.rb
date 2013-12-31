require 'spec_helper'

describe Nada::Models::Vehicle, ".from_response_hash" do
  it "creates an object with the appropriate attributes set" do
    input = {
      "YearReturnTO"=>{"Year"=>2013, "YearType"=>nil},
      "MakeReturnTO"=>{"MakeID"=>1216, "MakeDisplayName"=>"Volvo"},
      "ModelReturnTO"=>{"c_ModelID"=>0, "n_ModelID"=>10253, "ModelDisplayName"=>"XC60"},
      "StyleID"=>0,
      "StyleDisplayName"=>nil,
      "VehicleID"=>117209,
      "Trim_jpg"=>nil,
      "VehicleDisplayName"=>"Utility 4D 3.2 2WD I6"}
    vehicle = described_class.from_response_hash input

    expect(vehicle.id).to eq(117209)
    expect(vehicle.name).to eq("Utility 4D 3.2 2WD I6")
    expect(vehicle.year).to eq(2013)
    expect(vehicle.make_id).to eq(1216)
    expect(vehicle.make_name).to eq("Volvo")
    expect(vehicle.model_id).to eq(10253)
    expect(vehicle.model_name).to eq("XC60")
  end
end
