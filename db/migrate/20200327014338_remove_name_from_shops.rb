class RemoveNameFromShops < ActiveRecord::Migration[6.0]
  def change

    remove_column :shops, :name, :string
  end
end
