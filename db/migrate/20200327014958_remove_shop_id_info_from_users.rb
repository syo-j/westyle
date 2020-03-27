class RemoveShopIdInfoFromUsers < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :phone, :integer

    remove_column :users, :shop_id, :integer

    remove_column :users, :hp_url, :string
  end
end
