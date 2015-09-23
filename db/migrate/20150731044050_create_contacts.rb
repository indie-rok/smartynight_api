class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :topic, index: true
      t.string :name
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
