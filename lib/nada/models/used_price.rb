module Nada::Models
  class UsedPrice
    include Virtus.value_object

    values do
      attribute :year, String
      attribute :make_id, Integer
      attribute :make_name, String
      attribute :model_id, Integer
      attribute :model_name, String
      attribute :vehicle_id, Integer
      attribute :vehicle_name, String
      attribute :base_rough_trade_in_price, String
      attribute :base_average_trade_in_price, String
      attribute :base_clean_trade_in_price, String
      attribute :base_clean_retail_price, String
      attribute :total_option_rough_trade_in_price, String
      attribute :total_option_average_trade_in_price, String
      attribute :total_option_clean_trade_in_price, String
      attribute :total_option_clean_retail_price, String
      attribute :total_rough_trade_in_price, String
      attribute :total_average_trade_in_price, String
      attribute :total_clean_trade_in_price, String
      attribute :total_clean_retail_price, String
      #attribute :rough_trade_in_explanation, String
      #attribute :average_trade_in_explanation, String
      #attribute :trade_in_explanation, String
      #attribute :clean_retail_explanation, String
    end

    def self.from_response_hash hash
      new year: hash["YearReturnTO"]["Year"],
        make_id: hash["MakeReturnTO"]["MakeID"],
        make_name: hash["MakeReturnTO"]["MakeDisplayName"],
        model_id: hash["ModelReturnTO"]["n_ModelID"],
        model_name: hash["ModelReturnTO"]["ModelDisplayName"],
        vehicle_id: hash["VehicleID"],
        vehicle_name: hash["VehicleDisplayName"],
        base_rough_trade_in_price: hash["BasePrice"]["RoughTradeIn"],
        base_average_trade_in_price: hash["BasePrice"]["AverageTradeIn"],
        base_clean_trade_in_price: hash["BasePrice"]["CleanTradeIn"],
        base_clean_retail_price: hash["BasePrice"]["CleanRetail"],
        total_option_rough_trade_in_price: hash["TotalOptionPrice"]["RoughTradeIn"],
        total_option_average_trade_in_price: hash["TotalOptionPrice"]["AverageTradeIn"],
        total_option_clean_trade_in_price: hash["TotalOptionPrice"]["CleanTradeIn"],
        total_option_clean_retail_price: hash["TotalOptionPrice"]["CleanRetail"],
        total_rough_trade_in_price: hash["TotalPrice"]["RoughTradeIn"],
        total_average_trade_in_price: hash["TotalPrice"]["AverageTradeIn"],
        total_clean_trade_in_price: hash["TotalPrice"]["CleanTradeIn"],
        total_clean_retail_price: hash["TotalPrice"]["CleanRetail"]
      #rough_trade_in_explanation: hash["PriceTypes"]
      #average_trade_in_explanation: hash["PriceTypes"]
      #trade_in_explanation: hash["PriceTypes"]
      #clean_retail_explanation: hash["PriceTypes"]
    end
  end
end
