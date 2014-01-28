class NewPropertiesTable < ActiveRecord::Migration
  def up
    
    create_table :properties do |t|
      t.string :auctionDate
      t.string :auctionID
      t.string :auctionStatus
      t.string :caseID
      t.string :caseType
      t.decimal :judgement
      t.decimal :assesed
      t.string :parcel
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :legal
      t.decimal :beds
      t.decimal :baths
      t.decimal :area
      t.decimal :lot
      t.integer :year
      t.decimal :estimate
      t.decimal :rentEstimate
      t.string :zillow
      
      t.string :zpid
      t.string :useCode
      t.string :latitude
      t.string :longitude
      t.decimal :lastSoldPrice
      t.string :lastSoldDate
      t.string :zillowDetails

      t.timestamps
    end
  end
end
