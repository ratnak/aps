json.array!(@parties) do |party|
  json.extract! party, :id, :property_id, :partyType, :partyName
  json.url party_url(party, format: :json)
end
