class AddBlandInfoToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :bland_id, :integer
    add_column :clothes, :size_id, :integer
    add_column :clothes, :color_id, :integer
  end
end
