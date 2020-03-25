class ChangeDatatypeNameOfClothes < ActiveRecord::Migration[6.0]
  def change
  	change_column :clothes, :name, :string
  end
end
