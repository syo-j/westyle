class AddDetailsToColors < ActiveRecord::Migration[6.0]
  def change
    add_column :colors, :css_color, :string
  end
end
