class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.references :contact, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :topics, :contacts
  end
end