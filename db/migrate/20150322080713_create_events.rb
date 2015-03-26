class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :brand_id
      t.float :latitude
      t.float :longitude
      t.string :address
      t.text :description
      t.string :title
      t.datetime :datetime
      t.integer :timespan

      t.timestamps null: false
    end
  end
end
