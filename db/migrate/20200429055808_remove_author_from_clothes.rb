class RemoveAuthorFromClothes < ActiveRecord::Migration[6.0]
  def change

    remove_column :clothes, :bland_id, :integer
  end
end
