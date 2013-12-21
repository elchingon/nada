require 'spec_helper'

describe Nada::Models::Option, ".from_response_hash" do
  it "creates an object with the appropriate attributes set" do
    input = {
      "OptionReturnTO"=>{
        "OptionGroup"=>nil,
        "OptionGroupID"=>0,
        "OptionDisplayName"=>"W/out Power Sunroof",
        "OptionCode"=>"018"
      },
      "IsStd"=>false
    }

    option = described_class.from_response_hash input

    expect(option.code).to eq("018")
    expect(option.name).to eq("W/out Power Sunroof")
    expect(option).to_not be_standard
  end
end
