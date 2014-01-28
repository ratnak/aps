class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.references :property, index: true
      t.string :partyType
      t.string :partyName

      t.timestamps
    end
  end
end
