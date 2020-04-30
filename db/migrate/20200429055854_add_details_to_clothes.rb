class AddDetailsToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :bland, :string
  end
end
