class RenameUserIdColumnToStaffs < ActiveRecord::Migration[6.0]
  def change
  	rename_column :staffs, :user_id, :registering_id
  	rename_column :staffs, :shop_id, :registered_id
  end
end
