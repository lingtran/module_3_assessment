class BestBuyService
  def initialize
    @_connection = Faraday.new(url: "https://api.bestbuy.com/v1/")
  end

  def get_stores_by_zipcode(zipcode)
    connection.get "stores(area(#{zipcode},25))", { format: "json",
                                                             apiKey: ENV['best_buy_api_key'],
                                                             show: "longName, city,  distance, phone, storeType",
                                                             pageSize: "100"}
  end

  def parse_stores_by_zipcode(zipcode)
    parse(get_stores_by_zipcode(zipcode))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def connection
    @_connection
  end
end
