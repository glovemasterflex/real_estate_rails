class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.integer :bed
      t.integer :bath
      t.integer :sqft
      t.integer :price
      t.boolean :sold, null: false
      t.boolean :like, null: true
      t.belongs_to :agent

      t.timestamps null: false
    end
  end
end
