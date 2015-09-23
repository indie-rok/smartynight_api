class CreateDancers < ActiveRecord::Migration
  def change
    create_table :dancers do |t|
    	t.string :username
    	t.string :gender
    	t.string :age_range
    	t.string :facebook_token, index:true
  		t.references :user,index: true, foreign_key: true
      t.timestamps null: false
    end

    add_foreign_key :dancers,:users
  end
end
