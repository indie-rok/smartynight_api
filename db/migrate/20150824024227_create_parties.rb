class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
    	t.string :img_url
    	t.string :name
    	t.string :party_type
    	t.date :date
    	t.time :start_time
    	t.time :end_time
    	t.integer :cover
    	t.text :description
    	t.string :status
      t.references :venue, index: true, foreign_key: true
      t.timestamps null: false
    end
    add_foreign_key :parties,:venues
  end
end
