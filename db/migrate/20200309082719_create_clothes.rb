class CreateClothes < ActiveRecord::Migration[6.0]
  def change
    create_table :clothes do |t|
      t.integer :name
      t.integer :category_id
      t.integer :price
      t.string :bland
      t.string :size
      t.string :color



      t.timestamps
    end
  end
end
