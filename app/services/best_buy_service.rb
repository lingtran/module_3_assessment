class BestBuyService
  def initialize
    @_connection = Faraday.new(url: "https://api.bestbuy.com/v1/")
  end

  def get_stores_by_zipcode_and_location(zipcode, location)
    connection.get "stores(area(#{zipcode},#{location}))", { format: "json",
                                                             apiKey: ENV['best_buy_api_key'],
                                                             show: "longName, city,  distance, phone, storeType",
                                                             pageSize: "100"}
  end

  def parse_stores_by_zipcode_and_location(zipcode, location)
    parse(get_stores_by_zipcode_and_location(zipcode, location))
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  private
  def connection
    @_connection
  end
end
