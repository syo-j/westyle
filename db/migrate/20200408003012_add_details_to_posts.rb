class AddDetailsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :shop_height, :string
    add_column :posts, :shop_gender, :string
  end
end
