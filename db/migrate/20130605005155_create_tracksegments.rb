class CreateTracksegments < ActiveRecord::Migration
  def change
    create_table :tracksegments do |t|
      t.references :Track

      t.timestamps
    end
    add_index :tracksegments, :Track_id
  end
end
