class RemoveAreaIdFromShops < ActiveRecord::Migration[6.0]
  def change

    remove_column :shops, :area_id, :integer
  end
end
