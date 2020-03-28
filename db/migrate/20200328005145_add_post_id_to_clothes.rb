class AddPostIdToClothes < ActiveRecord::Migration[6.0]
  def change
    add_column :clothes, :post_id, :integer
  end
end
