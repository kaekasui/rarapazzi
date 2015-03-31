class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :link
      t.string :image_url
      t.integer :event_id

      t.timestamps null: false
    end
  end
end
