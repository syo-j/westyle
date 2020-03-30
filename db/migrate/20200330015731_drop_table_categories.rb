class DropTableCategories < ActiveRecord::Migration[6.0]
  def change
  	drop_table :Categories
  end
end
