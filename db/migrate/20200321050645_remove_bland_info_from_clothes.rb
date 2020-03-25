class RemoveBlandInfoFromClothes < ActiveRecord::Migration[6.0]
  def change

    remove_column :clothes, :bland, :string

    remove_column :clothes, :size, :string

    remove_column :clothes, :color, :string
  end
end
