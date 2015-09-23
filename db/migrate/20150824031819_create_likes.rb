class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.references :dancer, index: true, foreign_key: true
    	t.references :venue, index: true, foreign_key: true
    end

    add_foreign_key :likes,:dancers
    add_foreign_key :likes,:venues

  end
end
