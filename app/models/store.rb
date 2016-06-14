class Store < OpenStruct
  def self.service
    BestBuyService.new
  end

  def self.find_all_by_zipcode(zipcode)
    service.parse_stores_by_zipcode(zipcode)
  end

end
