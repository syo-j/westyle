class RemoveUserIdFromAreas < ActiveRecord::Migration[6.0]
  def change

    remove_column :areas, :user_id, :integer
  end
end
