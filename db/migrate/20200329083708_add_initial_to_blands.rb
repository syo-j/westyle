class AddInitialToBlands < ActiveRecord::Migration[6.0]
  def change
    add_column :blands, :initial, :string
  end
end
