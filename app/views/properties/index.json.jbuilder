json.array!(@properties) do |property|
  json.extract! property, :id, :auctionStatus, :caseID, :caseType, :judgement, :assesed, :parcel, :address, :city, :state, :zip, :legal, :beds, :baths, :area, :lot, :year, :estimate, :rentEstimate, :zillow
  json.url property_url(property, format: :json)
end
