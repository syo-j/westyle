class AddAreaIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :area_id, :integer
  end
end
