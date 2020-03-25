class AddNameInfoToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :photo, :string
    add_column :users, :height, :string
    add_column :users, :gender, :string
    add_column :users, :phone, :integer
    add_column :users, :shop_id, :integer
    add_column :users, :hp_url, :string
    add_column :users, :facebook_url, :string
    add_column :users, :twitta_url, :string
    add_column :users, :instaguram_url, :string
  end
end
