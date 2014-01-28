class CreateProperties < ActiveRecord::Migration
  def change
    drop_table :properties
    create_table :properties do |t|
      
      t.date :auctionDate
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
      t.string :zillow
      
    end
  end
end
