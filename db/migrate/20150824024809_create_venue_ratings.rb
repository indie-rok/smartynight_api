class CreateVenueRatings < ActiveRecord::Migration
  def change
    create_table :venue_ratings do |t|
    	t.references :dancer, index: true, foreign_key: true
    	t.references :venue, index: true, foreign_key: true
    	t.integer :rating
     	t.timestamps null: false
    end

    add_foreign_key :venue_ratings,:dancers
    add_foreign_key :venue_ratings,:venues

  end
end
