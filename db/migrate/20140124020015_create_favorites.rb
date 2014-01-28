class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :property, index: true
      t.references :user, index: true
      t.text :notes

      t.timestamps
    end
  end
end
