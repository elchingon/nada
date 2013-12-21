require 'spec_helper'

describe Nada::Models::UsedPrice, ".from_response_hash" do
  it "creates an object with the appropriate attributes set" do
    input= {
      "YearReturnTO"=>{"Year"=>2013, "YearType"=>nil},
      "MakeReturnTO"=>{"MakeID"=>1216, "MakeDisplayName"=>"Volvo"},
      "ModelReturnTO"=>{"c_ModelID"=>0, "n_ModelID"=>10253, "ModelDisplayName"=>"XC60"},
      "StyleID"=>0,
      "StyleDisplayName"=>nil,
      "VehicleID"=>117209,
      "Trim_jpg"=>nil,
      "VehicleDisplayName"=>"Utility 4D 3.2 2WD I6",
      "BasePrice"=>{"RoughTradeIn"=>"24650.00", "AverageTradeIn"=>"26400.00", "CleanTradeIn"=>"27850.00", "CleanRetail"=>"31700.00"},
      "TotalOptionPrice"=>{"RoughTradeIn"=>"-550", "AverageTradeIn"=>"-550", "CleanTradeIn"=>"-550", "CleanRetail"=>"-525"},
      "TotalPrice"=>{"RoughTradeIn"=>"23600.00", "AverageTradeIn"=>"25350.00", "CleanTradeIn"=>"26800.00", "CleanRetail"=>"30675.00"},
      "Mileage"=>"25000",
      "MileageAdjustment"=>"-500",
      "UsedOptions"=>[
        {"Option"=>
          {
            "OptionReturnTO"=>{"OptionGroup"=>nil, "OptionGroupID"=>0, "OptionDisplayName"=>"W/out Power Sunroof", "OptionCode"=>"018"}, "IsStd"=>false},
            "OptionPrice"=>{"RoughTradeIn"=>"-600", "AverageTradeIn"=>"-600", "CleanTradeIn"=>"-600", "CleanRetail"=>"-600"}},
            {"Option"=>
              {"OptionReturnTO"=>{"OptionGroup"=>nil, "OptionGroupID"=>0, "OptionDisplayName"=>"Fixed Running Boards", "OptionCode"=>"137"}, "IsStd"=>false},
                "OptionPrice"=>{"RoughTradeIn"=>"50", "AverageTradeIn"=>"50", "CleanTradeIn"=>"50", "CleanRetail"=>"75"}
          }
    ],
      "PriceTypes"=>[
        {"PriceTypeID"=>9,
          "PriceType"=>"CR",
          "PriceTypeDisplayName"=>"Rough<br>Trade-In",
          "PriceTypeExplanation"=>"<b>Rough Trade-In</b><br>Rough Trade-in values reflect a vehicle in rough condition.  Meaning a vehicle with significant mechanical defects requiring repairs in order to restore reasonable running condition. Paint, body and wheel surfaces have considerable damage to their finish, which may include dull or faded (oxidized) paint, small to medium size dents, frame damage, rust or obvious signs of previous repairs. Interior reflects above average wear with inoperable equipment, damaged or missing trim and heavily soiled /permanent imperfections on the headliner, carpet, and upholstery.  Vehicle may have a branded title and un-true mileage. Vehicle will need substantial reconditioning and repair to be made ready for resale. Some existing issues may be difficult to restore. Because individual vehicle condition varies greatly, users of NADAguides.com may need to make independent adjustments for actual vehicle condition."},
        {"PriceTypeID"=>11,
          "PriceType"=>"CW",
          "PriceTypeDisplayName"=>"Average<br>Trade-In",
          "PriceTypeExplanation"=>"<b>Average Trade-In</b><br>The Average Trade-In values on nadaguides.com are meant to reflect a vehicle in average condition.  A vehicle that is mechanically sound but may require some repairs/servicing to pass all necessary inspections; Paint, body and wheel surfaces have moderate imperfections and an average finish and shine which can be improved with restorative repair; Interior reflects some soiling and wear in relation to vehicle age, with all equipment operable or requiring minimal effort to make operable; Clean title history; Vehicle will need a fair degree of reconditioning to be made ready for resale.  Because individual vehicle condition varies greatly, users of nadaguides.com may need to make independent adjustments for actual vehicle condition."},
        {"PriceTypeID"=>2,
          "PriceType"=>"CT",
          "PriceTypeDisplayName"=>"Clean<br>Trade-In",
          "PriceTypeExplanation"=>"<b>Clean Trade-In</b><br>Clean Trade-In values reflect a vehicle in clean condition. This means a vehicle with no mechanical defects and passes all necessary inspections with ease. Paint, body and wheels have minor surface scratching with a high gloss finish and shine. Interior reflects minimal soiling and wear with all equipment in complete working order. Vehicle has a clean title history. Vehicle will need minimal reconditioning to be made ready for resale. Because individual vehicle condition varies greatly, users of NADAguides.com may need to make independent adjustments for actual vehicle condition."},
        {"PriceTypeID"=>1,
          "PriceType"=>"CA",
          "PriceTypeDisplayName"=>"Clean<br>Retail",
          "PriceTypeExplanation"=>"<b>Clean Retail</b><br>Clean Retail values reflect a vehicle in clean condition. This means a vehicle with no mechanical defects and passes all necessary inspections with ease. Paint, body and wheels have minor surface scratching with a high gloss finish and shine. Interior reflects minimal soiling and wear with all equipment in complete working order. Vehicle has a clean title history. Because individual vehicle condition varies greatly, users of NADAguides.com may need to make independent adjustments for actual vehicle condition. Note: Vehicles with low mileage that are in exceptionally good condition and/or include a manufacturer certification can be worth a significantly higher value than the Clean Retail price shown."}]}

    price = described_class.from_response_hash input

    # expect(price.id).to eq(117209)
  end
end
