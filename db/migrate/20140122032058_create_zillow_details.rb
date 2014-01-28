class CreateZillowDetails < ActiveRecord::Migration
  def change
    drop_table :zillow_details
    create_table :zillow_details do |t|
      t.references :property, index: true
      t.string :zpid
      t.string :useCode
      t.string :latitude
      t.string :longitude
      t.integer :year
      t.decimal :lot
      t.decimal :area
      t.decimal :baths
      t.decimal :beds
      t.date :lastSoldDate
      t.decimal :lastSold
      t.decimal :zEstimate
      t.date :zEstimateDate
      t.decimal :zRentEstimate
      t.date :zRentEstimateDate
      t.string :zillowDetails

      t.timestamps
    end
  end
end
