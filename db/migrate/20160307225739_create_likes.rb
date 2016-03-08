class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
    	t.belongs_to :home
    	t.belongs_to :user

      t.timestamps null: false
    end
  end
end
