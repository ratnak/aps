json.array!(@favorites) do |favorite|
  json.extract! favorite, :id, :property_id, :user_id, :notes
  json.url favorite_url(favorite, format: :json)
end
