class AddPhoneInfoToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :phone, :integer
    add_column :shops, :hp_url, :string
    add_column :shops, :area_id, :integer
  end
end
