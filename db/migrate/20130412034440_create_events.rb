class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string   :date
      t.integer :estado
      t.integer :user_id

      t.timestamps
    end
    add_index :events, [:user_id, :created_at]
  end
end
