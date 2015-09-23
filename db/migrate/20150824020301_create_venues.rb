class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
        
     	t.string :name
     	t.string :phone
     	t.string :city
     	t.string :state
     	t.string :zip_code
     	t.string :street_address
     	t.string :venue_type
     	t.string :dresscode
     	t.string :popular_drink
     	t.string :best_for
     	t.string :url
        t.string :music_genre
        t.boolean :live
     	t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_foreign_key :venues, :users

  end
end
