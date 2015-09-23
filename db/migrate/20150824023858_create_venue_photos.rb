class CreateVenuePhotos < ActiveRecord::Migration
  def change
    create_table :venue_photos do |t|
    	t.references :venue,index: true, foreign_key: true
    	t.string :url
      t.timestamps null: false
    end
    add_foreign_key :venue_photos,:venues
  end
end
