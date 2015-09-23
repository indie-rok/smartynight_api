class CreateApiTokens < ActiveRecord::Migration
  def change
    create_table :api_tokens do |t|
    	t.string :token
    	t.references :user,index: true,foreign_key: true
      t.timestamps null: false
    end

    add_foreign_key :tokens,:users

  end
end