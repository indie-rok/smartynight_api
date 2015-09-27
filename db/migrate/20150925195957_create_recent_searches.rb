class CreateRecentSearches < ActiveRecord::Migration
  def change
    create_table :recent_searches do |t|
    	t.references :user, index: true, foreign_key: true
    	t.references :venue, index: true, foreign_key: true
    end
  end
end
