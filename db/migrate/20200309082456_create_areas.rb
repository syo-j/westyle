class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.integer :user_id
      t.string :prefecture

      t.timestamps
    end
  end
end
