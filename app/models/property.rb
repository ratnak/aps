class Property < ActiveRecord::Base
  has_many :zillow_details
  has_many :parties
end
