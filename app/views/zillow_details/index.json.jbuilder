json.array!(@zillow_details) do |zillow_detail|
  json.extract! zillow_detail, :id, :property_id, :zpid, :useCode, :latitude, :longitude, :year, :lot, :area, :baths, :beds, :lastSoldDate, :lastSold, :zEstimate, :zEstimateDate, :zRentEstimate, :zRentEstimateDate, :zillowDetails
  json.url zillow_detail_url(zillow_detail, format: :json)
end
